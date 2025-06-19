-- Display tables


SELECT * FROM employees ORDER BY employee_id;

SELECT * FROM department;

SELECT * FROM projects;

SELECT * FROM tasks;

SELECT * FROM time_logs;

SELECT * FROM time_sheet;

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

-- Show Time Sheet of an employee
SELECT 
s.month_year, s.hours_spent, s.remarks,
e.first_name || ' ' || e.last_name AS employee_name,
t.task_name 
FROM time_sheet s 
LEFT JOIN employees e
ON s.employee_id = e.employee_id
LEFT JOIN tasks t 
ON s.task_id = t.task_id
WHERE s.employee_id = 1;

-- Show Brief Attendance of an employee
SELECT 
a.worked_day, a.total_hours, a.remarks,
e.first_name || ' ' || e.last_name AS employee_name,
FROM attendance a
LEFT JOIN employees a
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