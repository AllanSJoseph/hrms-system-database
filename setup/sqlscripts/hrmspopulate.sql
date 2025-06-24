-- Populating data to the table for demonstration
-- AI Generated Credits: ChatGPT


-- Insert work locations
INSERT INTO work_location (w_type, w_address, city, state, country, pincode) VALUES
('On-Site','123 Residency Road', 'Bangalore', 'Karnataka', 'India', 560001),
('Remote','456 Tech Park', 'San Francisco', 'California', 'USA', 94107),
('On-Site','789 Central St', 'London', 'Greater London', 'UK', 10001),
('On-Site','Smart City', 'Kochi', 'Kerala', 'India', 602021);

-- Insert departments
INSERT INTO department (no_of_members, dept_name, dept_head_id) VALUES
(4, 'HR', NULL), -- HR
(5, 'Engineering', NULL), -- Engineering
(3, 'Marketing', NULL), -- Marketing
(4, 'Finance', NULL); -- Finance

-- Insert projects
INSERT INTO projects (project_name, project_start_date, dept_id, project_status, project_notes) VALUES
('HR Policy Update', '2025-01-01', 1, 'Active', 'HR Policy Update'),
('Mobile App Development', '2025-02-01', 2, 'Active', 'Android and IOS App'),
('API Service', '2025-02-01', 2, 'Active', 'Developing API Service'),
('Marketing Campaign', '2025-03-01', 3, 'Active', 'Marketing Campaign'),
('Financial Audit System', '2025-01-15', 4, 'Active', 'Financial Audit System');

-- Insert employees (20)
INSERT INTO employees (
    employee_no, first_name, last_name, personal_mobile, work_mobile, personal_email, work_email,
    dob, martial_status, dept_id, wlocation_id
)
VALUES
('GE101', 'Anjali', 'Sharma', '+91-9876543210', '+91-8800559901', 'anjali.sharma@gmail.com', 'anjali@hrms.com', '1990-05-10', 'Single', 1, 1),
('GE102', 'Rahul', 'Mehta', '+91-9876543211', '+91-8800559902', 'rahul.mehta@gmail.com', 'rahul@hrms.com', '1989-07-12', 'Married', 1, 1),
('GE103', 'Priya', 'Nair', '+91-9876543212', '+91-8800559903', 'priya.nair@gmail.com', 'priya@hrms.com', '1992-08-22', 'Single', 1, 2),
('GE104', 'Arjun', 'Reddy', '+91-9876543213', '+91-8800559904', 'arjun.reddy@gmail.com', 'arjun@hrms.com', '1991-01-05', 'Married', 1, 2),
('GE105', 'Sophia', 'Brown', '+1-9876543214', '+1-8800559905', 'sophia.brown@gmail.com', 'sophia@hrms.com', '1988-09-15', 'Single', 2, 2),
('GE106', 'James', 'Smith', '+1-9876543215', '+1-8800559906', 'james.smith@gmail.com', 'james@hrms.com', '1990-12-20', 'Married', 2, 2),
('GE107', 'Emily', 'Clark', '+1-9876543216', '+1-8800559907', 'emily.clark@gmail.com', 'emily@hrms.com', '1993-03-10', 'Single', 2, 2),
('GE108', 'Daniel', 'Jones', '+1-9876543217', '+1-8800559908', 'daniel.jones@gmail.com', 'daniel@hrms.com', '1994-04-14', 'Single', 2, 3),
('GE109', 'Olivia', 'Wong', '+1-9876543218', '+1-8800559909', 'olivia.wong@gmail.com', 'olivia@hrms.com', '1992-06-17', 'Married', 2, 3),
('GE110', 'John', 'Doe', '+44-9876543220', '+44-8800559910', 'john.doe@gmail.com', 'john@hrms.com', '1990-11-30', 'Married', 3, 3),
('GE111', 'Ava', 'Taylor', '+44-9876543221', '+44-8800559911', 'ava.taylor@gmail.com', 'ava@hrms.com', '1995-01-01', 'Single', 3, 3),
('GE112', 'William', 'Davis', '+44-9876543222', '+44-8800559912', 'william.davis@gmail.com', 'william@hrms.com', '1991-05-23', 'Single', 3, 3),
('GE113', 'Ella', 'Wilson', '+91-9876543223', '+91-8800559913', 'ella.wilson@gmail.com', 'ella@hrms.com', '1992-07-12', 'Married', 4, 1),
('GE114', 'Mason', 'Martin', '+91-9876543224', '+91-8800559914', 'mason.martin@gmail.com', 'mason@hrms.com', '1993-08-08', 'Single', 4, 4),
('GE115', 'Mia', 'Lee', '+91-9876543225', '+91-8800559915', 'mia.lee@gmail.com', 'mia@hrms.com', '1990-09-19', 'Single', 4, 4),
('GE116', 'Noah', 'Clark', '+91-9876543226', '+91-8800559916', 'noah.clark@gmail.com', 'noah@hrms.com', '1989-10-30', 'Married', 4, 1),
('GE117', 'Liam', 'Patel', '+91-9876543227', '+91-8800559917', 'liam.patel@gmail.com', 'liam@hrms.com', '1990-03-15', 'Married', 4, 2),
('GE118', 'Isabella', 'Thomas', '+91-9876543228', '+91-8800559918', 'isabella.thomas@gmail.com', 'isabella@hrms.com', '1993-12-25', 'Single', 2, 4),
('GE119', 'Lucas', 'White', '+44-9876543229', '+44-8800559919', 'lucas.white@gmail.com', 'lucas@hrms.com', '1994-11-22', 'Single', 3, 3),
('GE120', 'Amelia', 'Singh', '+44-9876543230', '+44-8800559920', 'amelia.singh@gmail.com', 'amelia@hrms.com', '1991-10-10', 'Married', 3, 3);

-- Assign Department_Head to departments
UPDATE department SET dept_head_id = 1 WHERE dept_id = 1;
UPDATE department SET dept_head_id = 5 WHERE dept_id = 2;
UPDATE department SET dept_head_id = 10 WHERE dept_id = 3;
UPDATE department SET dept_head_id = 13 WHERE dept_id = 4;

-- Assign Project Managers to Projects
UPDATE projects SET manager_id = 2 WHERE project_id = 1;
UPDATE projects SET manager_id = 6 WHERE project_id = 2;
UPDATE projects SET manager_id = 7 WHERE project_id = 3;
UPDATE projects SET manager_id = 12 WHERE project_id = 4;
UPDATE projects SET manager_id = 15 WHERE project_id = 5;

-- Insert tasks
INSERT INTO tasks (task_name, task_description, status, project_id, assigned_to, created_by) VALUES
('HR Policy Draft', 'Prepare initial draft of HR policies', 'In Progress', 1, 3, 1),
('Employee Handbook', 'Revise handbook', 'Pending', 1, 4, 2),
('Backend API', 'Develop REST APIs', 'In Progress', 3, 7, 5),
('UI Design', 'Create UI mockups', 'Completed', 2, 8, 6),
('Buissness Logic Optimisation', 'Optimise Buissness Logic of the App', 'Completed', 2, 9, 6),
('Social Media Ads', 'Design ad creatives', 'In Progress', 4, 12, 10),
('Ad Copywriting', 'Write ad content', 'Pending', 4, 20, 11),
('SEO Optimisation', 'Ensure Ads are optimised for Search Engines', 'Pending', 4, 19, 11),
('Report Generation', 'Create financial reports', 'In Progress', 5, 15, 13),
('Power BI Dashboard', 'Create Dashboard Summary', 'In Progress', 5, 17, 14),
('Review Payroll', 'Review Payroll is completed for some employees', 'In Progress', 5, 16, 13);

-- Example timelog
INSERT INTO time_logs (log_date, start_time, end_time, total_time_spent, employee_id, task_id) VALUES
('2025-06-01', '2025-06-01 09:00', '2025-06-01 11:00', '2 hours', 1, 1),
('2025-06-01', '2025-06-01 11:00', '2025-06-01 13:00', '2 hours', 5, 3);


-- Attendance (1 week sample for 3 employees)
INSERT INTO attendance (check_in_time, check_out_time, total_hours, worked_day, remarks, employee_id)
SELECT 
    TIMESTAMP '2025-06-01 09:00' + i * INTERVAL '1 day',
    TIMESTAMP '2025-06-01 17:00' + i * INTERVAL '1 day',
    '8 hours',
    DATE '2025-06-01' + i,
    CASE WHEN i=2 THEN 'Leave' ELSE 'Present' END,
    e_id
FROM generate_series(0,6) i, (SELECT unnest(ARRAY[1,5,10]) AS e_id) sub;

-- Payroll
INSERT INTO payroll (payroll_id, month_year, gross_salary, income_tax, loan_repayment, insurance, other_deductions, bonus_rewards, net_salary, payment_status, payment_date, employee_id)
SELECT
    employee_id,
    '2025-06-01',
    80000,
    8000,
    2000,
    1000,
    500,
    3000,
    71500,
    'Paid',
    '2025-06-05',
    employee_id
FROM employees;

-- Feedback
INSERT INTO manager_feedback (feedback_date, comments, rating, manager_id, employee_id) VALUES
('2025-06-01', 'Great teamwork!', 5, 2, 2),
('2025-06-01', 'Very punctual.', 4, 1, 3),
('2025-06-01', 'Needs improvement in communication.', 3, 6, 6),
('2025-06-01', 'Excellent performance.', 5, 10, 11),
('2025-06-01', 'Helpful and friendly.', 4, 13, 14);

-- Employee Projects

INSERT INTO employee_projects (employee_id, project_id)
VALUES (1,1),(2,1),(3,1),(4,1),(5,2),(6,2),(6,3),(7,2),(7,3),
(8,2),(8,3),(9,2),(9,3),(10,2),(10,4),(11,4),(12,4),(13,5),(14,5),
(15,5),(16,5),(17,5),(19,4),(20,4);
