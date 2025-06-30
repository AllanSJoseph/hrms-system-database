# READ OPERATIONS

## Reading All Employee Data

Below is a query you can use to get all the details of employees in a proper semantic manner


#### Query:
```sql
SELECT e.employee_id,
e.first_name,
e.last_name,
e.personal_mobile,
e.work_mobile,
e.personal_email,
e.work_email,
e.dob,
e.martial_status,
d.dept_name AS department,
p.project_name AS project,
w.w_address || ', ' || w.city || ', ' || w.state || ', ' || w.country AS workLocation 
FROM employees e
LEFT JOIN department d
ON e.dept_id = d.dept_id
LEFT JOIN projects p
ON e.project_id = p.project_id
LEFT JOIN work_location w
ON e.wlocation_id = w.wlocation_id
WHERE e.employee_id = <requested_employee_id>;
```
This returns all the details of an employee on proper manner. If you want list of all employees in this format, just remove that final ```WHERE``` clause.

#### Expected Output:
```sh
 employee_id | first_name | last_name | personal_mobile |  work_mobile   |    personal_email     |   work_email   |    dob     | martial_status | department |     project      |                  worklocation
-------------+------------+-----------+-----------------+----------------+-----------------------+----------------+------------+----------------+------------+------------------+-------------------------------------------------
           2 | Rahul      | Mehta     | +91-9876543211  | +91-8800559902 | rahul.mehta@gmail.com | rahul@hrms.com | 1989-07-12 | Married        | HR         | HR Policy Update | 123 Residency Road, Bangalore, Karnataka, India
(1 row)
```

## Sorting Employees

### Sorting by Department
```sql
SELECT * FROM employees
WHERE dept_id = <dept_id>; -- OR dept_id IS NULL

-- You can use join functions to get dept_name
```
### Sorting by Project
```sql
SELECT * FROM employees
WHERE project_id = <project_id>; -- OR project_id IS NULL

-- You can use join functions to get project_name
```
### Sorting by Work Location
```sql
SELECT * FROM employees
WHERE wlocation_id = <wlocation_id>; -- OR wlocation_id IS NULL

-- You can use join functions to get wlocation_id
```

## Reading all Departments and Their Managers

```sql
SELECT d.dept_id, d.dept_name, d.no_of_members, 
e.first_name || ' ' || e.last_name AS department_head
FROM department d
LEFT JOIN employees e
ON d.dept_head_id = e.employee_id;
```

#### Expected Output:
```sh
 dept_id |  dept_name  | no_of_members |    manager
---------+-------------+---------------+---------------
       1 | HR          |             4 | Anjali Sharma
       2 | Engineering |             5 | Sophia Brown
       3 | Marketing   |             3 | John Doe
       4 | Finance     |             4 | Ella Wilson
(4 rows)
```

## Reading all Projects Under a Department
```sql
SELECT p.project_id, p.project_name, p.project_status, d.dept_name
FROM projects p
JOIN department d
ON p.dept_id = d.dept_id
WHERE d.dept_id = <requested_dept_id>; 
-- You can add other fields on projects to modify this further
```
#### Expected Output:
```sh
 project_id |      project_name      | project_status |  dept_name
------------+------------------------+----------------+-------------
          2 | Mobile App Development | Active         | Engineering
          3 | API Service            | Active         | Engineering
(2 rows)
```

## Reading all Tasks on a Project
```sql
SELECT t.task_id, t.task_name, t.task_description, t.status,
p.project_name, 
e.first_name || ' ' || e.last_name AS created_by
FROM tasks t
LEFT JOIN projects p
ON t.project_id = p.project_id
LEFT JOIN employees e
ON t.created_by = e.employee_id
WHERE t.project_id = <requested_project_id>;
```

#### Expected Output:
```sh
 task_id |    task_name     |  task_description   |   status    |    project_name    | created_by
---------+------------------+---------------------+-------------+--------------------+------------
       5 | Social Media Ads | Design ad creatives | In Progress | Marketing Campaign | John Doe
       6 | Ad Copywriting   | Write ad content    | Pending     | Marketing Campaign | Ava Taylor
(2 rows)
```

## Reading the Time Logs


Below command shows time logs created by all employees with their task name.
```sql
SELECT 
l.log_date, l.start_time, l.end_time, l.total_time_spent,
e.first_name || ' ' || e.last_name AS employee_name,
t.task_name
FROM time_logs l
LEFT JOIN employees e
ON l.employee_id = e.employee_id
LEFT JOIN tasks t
ON l.task_id = t.task_id;
```

#### Expected Output

```sh
  log_date  |     start_time      |      end_time       | total_time_spent | employee_name |    task_name
------------+---------------------+---------------------+------------------+---------------+-----------------
 2025-06-01 | 2025-06-01 09:00:00 | 2025-06-01 11:00:00 | 02:00:00         | Anjali Sharma | HR Policy Draft
 2025-06-01 | 2025-06-01 11:00:00 | 2025-06-01 13:00:00 | 02:00:00         | Sophia Brown  | Backend API
(2 rows)
```

Below command shows time logs created by the requested employee.

```sql
SELECT 
l.log_date, l.start_time, l.end_time, l.total_time_spent,
e.first_name || ' ' || e.last_name AS employee_name,
t.task_name
FROM time_logs l
LEFT JOIN employees e
ON l.employee_id = e.employee_id
LEFT JOIN tasks t
ON l.task_id = t.task_id
WHERE l.employee_id = 1;
```

This one shows all the log entries created by an employee.


## Generating Timesheets

Below sql command shows the time_sheets created by an employee.

```sql
SELECT 
    e.employee_id,
    e.first_name || ' ' || e.last_name AS employee_name,
    t.task_id,
    t.task_name,
    DATE_TRUNC('month', l.log_date) AS month,
    SUM(l.end_time - l.start_time) AS total_time_spent
FROM time_logs l
JOIN employees e ON e.employee_id = l.employee_id
JOIN tasks t ON t.task_id = l.task_id
WHERE l.log_date >= DATE_TRUNC('month', CURRENT_DATE)
AND e.employee_id = <requested_employee_id> -- Insert employee id here 
GROUP BY 
    e.employee_id,
    e.first_name,
    e.last_name,
    t.task_id,
    t.task_name,
    DATE_TRUNC('month', l.log_date);

```

#### Expected Output
Timesheet of Employee with id 1
```sh
 employee_id | employee_name | task_id |  task_name  |           month           | total_time_spent
-------------+---------------+---------+-------------+---------------------------+------------------
           7 | Emily Clark   |       3 | Backend API | 2025-06-01 00:00:00+05:30 | 17:00:00
(1 row)
```

## Reading Attendance

### Showing Brief Attendance (Only some details)

Below is the query which shows just the total time, day and summary of a person with attendance.

```sql
SELECT 
a.worked_day, a.total_hours, a.remarks,
e.first_name || ' ' || e.last_name AS employee_name,
FROM attendance a
LEFT JOIN employees a
ON a.employee_id = e.employee_id
WHERE a.employee_id = <requested_employee_id>;
```

#### Expected Output
```sh
 worked_day | total_hours | remarks | employee_name
------------+-------------+---------+---------------
 2025-06-01 | 08:00:00    | Present | John Doe
 2025-06-02 | 08:00:00    | Present | John Doe
 2025-06-03 | 08:00:00    | Leave   | John Doe
 2025-06-04 | 08:00:00    | Present | John Doe
 2025-06-05 | 08:00:00    | Present | John Doe
 2025-06-06 | 08:00:00    | Present | John Doe
 2025-06-07 | 08:00:00    | Present | John Doe
(7 rows)

```

### Showing Detailed Attendance (Including Check-in and Check-out time)

Below is the query showing the detailed attendance record of the employee which includes both check-in and check-out times.

```sql
SELECT 
a.worked_day, a.total_hours, a.check_in_time, a.check_out_time, a.remarks,
e.first_name || ' ' || e.last_name AS employee_name
FROM attendance a
LEFT JOIN employees e
ON a.employee_id = e.employee_id
WHERE a.employee_id = 10;
```

#### Expected Output
```sh
 worked_day | total_hours |    check_in_time    |   check_out_time    | remarks | employee_name
------------+-------------+---------------------+---------------------+---------+---------------
 2025-06-01 | 08:00:00    | 2025-06-01 09:00:00 | 2025-06-01 17:00:00 | Present | John Doe
 2025-06-02 | 08:00:00    | 2025-06-02 09:00:00 | 2025-06-02 17:00:00 | Present | John Doe
 2025-06-03 | 08:00:00    | 2025-06-03 09:00:00 | 2025-06-03 17:00:00 | Leave   | John Doe
 2025-06-04 | 08:00:00    | 2025-06-04 09:00:00 | 2025-06-04 17:00:00 | Present | John Doe
 2025-06-05 | 08:00:00    | 2025-06-05 09:00:00 | 2025-06-05 17:00:00 | Present | John Doe
 2025-06-06 | 08:00:00    | 2025-06-06 09:00:00 | 2025-06-06 17:00:00 | Present | John Doe
 2025-06-07 | 08:00:00    | 2025-06-07 09:00:00 | 2025-06-07 17:00:00 | Present | John Doe
(7 rows)

```

## Reading Feedbacks

### Show all recorded feedbacks

```sql
SELECT 
fe.first_name || ' ' || fe.last_name AS feedbacker,
e.first_name || ' ' || e.last_name AS employee,
f.feedback_date, f.comments, f.rating
FROM feedback f
LEFT JOIN employees fe
ON f.feedbacker_id = fe.employee_id
LEFT JOIN employees e
ON f.employee_id = e.employee_id
;
```

#### Expected Output:
```sh
  feedbacker   |   employee   | feedback_date |              comments               | rating
---------------+--------------+---------------+-------------------------------------+--------
 Anjali Sharma | Rahul Mehta  | 2025-06-01    | Great teamwork!                     |      5
 Anjali Sharma | Priya Nair   | 2025-06-01    | Very punctual.                      |      4
 Sophia Brown  | James Smith  | 2025-06-01    | Needs improvement in communication. |      3
 John Doe      | Ava Taylor   | 2025-06-01    | Excellent performance.              |      5
 Ella Wilson   | Mason Martin | 2025-06-01    | Helpful and friendly.               |      4
(5 rows)

```

### Filtering feedback by Feedbacker

```sql
SELECT 
fe.first_name || ' ' || fe.last_name AS feedbacker,
e.first_name || ' ' || e.last_name AS employee,
f.feedback_date, f.comments, f.rating
FROM feedback f
LEFT JOIN employees fe
ON f.feedbacker_id = fe.employee_id
LEFT JOIN employees e
ON f.employee_id = e.employee_id
WHERE f.feedbacker_id = <requested_feedbacker_id>;
```

#### Expected Output: 

```sh
  feedbacker   |  employee   | feedback_date |    comments     | rating
---------------+-------------+---------------+-----------------+--------
 Anjali Sharma | Rahul Mehta | 2025-06-01    | Great teamwork! |      5
 Anjali Sharma | Priya Nair  | 2025-06-01    | Very punctual.  |      4
(2 rows)
```


### Filtering feedback by Employee (Receiver of Feedback)

```sql
SELECT 
fe.first_name || ' ' || fe.last_name AS feedbacker,
e.first_name || ' ' || e.last_name AS employee,
f.feedback_date, f.comments, f.rating
FROM feedback f
LEFT JOIN employees fe
ON f.feedbacker_id = fe.employee_id
LEFT JOIN employees e
ON f.employee_id = e.employee_id
WHERE f.employee_id = <requested_employee_id>;
```

#### Expected Output: 

```sh
  feedbacker   |  employee   | feedback_date |    comments     | rating
---------------+-------------+---------------+-----------------+--------
 Anjali Sharma | Rahul Mehta | 2025-06-01    | Great teamwork! |      5
(1 row)
```

These are some of the common READ Operations that can be done. More will be added later according to requirement.