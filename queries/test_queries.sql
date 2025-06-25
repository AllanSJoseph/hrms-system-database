-- Display tables


SELECT * FROM employees ORDER BY employee_id;

SELECT * FROM department;

SELECT * FROM projects;

SELECT * FROM tasks;

SELECT * FROM time_logs;

SELECT * FROM employee_projects;

SELECT * FROM payroll;

SELECT * FROM feedback;

SELECT * FROM attendance;

SELECT * FROM work_location;



SELECT d.dept_id, d.dept_name, d.no_of_members, e.employee_id, e.first_name
FROM department d JOIN employees e
ON d.manager_id = e.employee_id;

-- Showing Department and Projects 
-- Show Employee Name, Projects and Department they are in.
SELECT e.first_name, e.work_email, p.project_name, d.dept_name
FROM employees e 
JOIN projects p ON e.project_id = p.project_id
JOIN department d ON e.dept_id = d.dept_id;

-- Filter employees by department
SELECT first_name || ' ' || last_name AS employee_name
FROM employees
WHERE dept_id = 1;

-- Filter employees by project
SELECT first_name || ' ' || last_name AS employee_name
FROM employees
WHERE project_id = 2;

-- Filter employees by work location: Show all employees working in India
SELECT e.first_name || ' ' || e.last_name AS employee_name, w.country 
FROM employees e
JOIN work_location w
ON e.wlocation_id = w.wlocation_id
WHERE w.country = 'India';

-- Get List all details of an employee with proper details
SELECT e.employee_id,
e.employee_no,
e.first_name || ' ' || e.last_name AS full_name,
e.personal_mobile,
e.work_mobile,
e.personal_email,
e.work_email,
e.dob,
e.martial_status,
d.dept_name AS department,
w.w_address || ', ' || w.city || ', ' || w.state || ', ' || w.country AS workLocation 
FROM employees e
LEFT JOIN department d
ON e.dept_id = d.dept_id
LEFT JOIN work_location w
ON e.wlocation_id = w.wlocation_id
WHERE e.employee_id = 2;

SELECT d.dept_id, d.dept_name, d.no_of_members, e.first_name || ' ' || e.last_name AS manager
FROM department d
LEFT JOIN employees e
ON d.manager_id = e.employee_id;

SELECT p.project_id, p.project_name, p.project_status, d.dept_name
FROM projects p
JOIN department d
ON p.dept_id = d.dept_id
WHERE d.dept_id = 2; -- You can add other fields on projects to modify this further

SELECT t.task_id, t.task_name, t.task_description, t.status,
p.project_name, 
e.first_name || ' ' || e.last_name AS created_by
FROM tasks t
LEFT JOIN projects p
ON t.project_id = p.project_id
LEFT JOIN employees e
ON t.created_by = e.employee_id
WHERE t.project_id = 4;

-- Show timelogs of employees
SELECT 
l.log_date, l.start_time, l.end_time, l.total_time_spent,
e.first_name || ' ' || e.last_name AS employee_name,
t.task_name
FROM time_logs l
LEFT JOIN employees e
ON l.employee_id = e.employee_id
LEFT JOIN tasks t
ON l.task_id = t.task_id;

-- Show Brief Attendance of an employee
SELECT 
a.worked_day, a.total_hours, a.remarks,
e.first_name || ' ' || e.last_name AS employee_name
FROM attendance a
LEFT JOIN employees e
ON a.employee_id = e.employee_id
WHERE a.employee_id = 10;

-- Show detailed attendance of employees.
SELECT 
a.worked_day, a.total_hours, a.check_in_time, a.check_out_time, a.remarks,
e.first_name || ' ' || e.last_name AS employee_name
FROM attendance a
LEFT JOIN employees e
ON a.employee_id = e.employee_id
WHERE a.employee_id = 10;

-- Show Feedbacks
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

-- Filter feedbacks by feedbacker
SELECT 
fe.first_name || ' ' || fe.last_name AS feedbacker,
e.first_name || ' ' || e.last_name AS employee,
f.feedback_date, f.comments, f.rating
FROM feedback f
LEFT JOIN employees fe
ON f.feedbacker_id = fe.employee_id
LEFT JOIN employees e
ON f.employee_id = e.employee_id
WHERE f.feedbacker_id = 1;

-- Filter feedbacks by employee who is receiving the feedback
SELECT 
fe.first_name || ' ' || fe.last_name AS feedbacker,
e.first_name || ' ' || e.last_name AS employee,
f.feedback_date, f.comments, f.rating
FROM feedback f
LEFT JOIN employees fe
ON f.feedbacker_id = fe.employee_id
LEFT JOIN employees e
ON f.employee_id = e.employee_id
WHERE f.employee_id = 2;


-- Check the list of projects an employee is currently working on.
SELECT
e.first_name || ' ' || e.last_name AS employee_name,
p.project_name AS project_name
FROM employee_projects ep
LEFT JOIN employees e
ON e.employee_id = ep.employee_id
LEFT JOIN projects p
ON ep.project_id = p.project_id
WHERE ep.employee_id = 6;


-- List the tasks in a project, who created them and who they are assigned to.
SELECT 
t.task_name,
t.task_description,
t.status,
p.project_name,
a.first_name || ' ' || a.last_name AS assigned_to,
c.first_name || ' ' || c.last_name AS created_by
FROM tasks t
LEFT JOIN projects p
ON t.project_id = p.project_id
LEFT JOIN employees a
ON t.assigned_to = a.employee_id
LEFT JOIN employees c
ON t.created_by = c.employee_id
WHERE t.project_id = 5;

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
AND e.employee_id = 7 -- optional filter for current month
GROUP BY 
    e.employee_id,
    e.first_name,
    e.last_name,
    t.task_id,
    t.task_name,
    DATE_TRUNC('month', l.log_date);

-- Show attendance of an employee at a specific time/date period
SELECT 
    e.first_name || ' ' || e.last_name AS employee_name,
    a.worked_day,
    a.check_in_time,
    a.check_out_time,
    a.total_hours,
    a.remarks
FROM attendance a
JOIN employees e ON a.employee_id = e.employee_id
WHERE a.employee_id = 5  -- Replace with target employee ID
  AND a.worked_day BETWEEN '2025-06-01' AND '2025-06-06'
ORDER BY a.worked_day;
