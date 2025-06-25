-- Database: HRMS

-- DROP DATABASE IF EXISTS "HRMS";

-- CREATE DATABASE "HRMS"
--     WITH
--     OWNER = postgres
--     ENCODING = 'UTF8'
--     LC_COLLATE = 'English_India.1252'
--     LC_CTYPE = 'English_India.1252'
--     LOCALE_PROVIDER = 'libc'
--     TABLESPACE = pg_default
--     CONNECTION LIMIT = -1
--     IS_TEMPLATE = False;



-- Creating Employee Table
CREATE TABLE employees(
	employee_id SERIAL PRIMARY KEY,
	employee_no VARCHAR UNIQUE,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	personal_mobile VARCHAR(15),
	work_mobile VARCHAR(15) NOT NULL,
	personal_email VARCHAR,
	work_email VARCHAR NOT NULL,
	dob DATE NOT NULL,
	martial_status VARCHAR NOT NULL,
	dept_id INT,         --Foreign Key
	wlocation_id INT     --Foreign Key
);


-- CREATE Department Table

CREATE TABLE department(
	dept_id SERIAL PRIMARY KEY,
	dept_name VARCHAR,
	no_of_members INT NOT NULL,
	dept_head_id INT,
	FOREIGN KEY (dept_head_id) REFERENCES employees(employee_id) ON DELETE SET NULL
);


-- CREATE Projects Table

CREATE TABLE projects(
	project_id SERIAL PRIMARY KEY,
	project_name VARCHAR NOT NULL,
	project_start_date DATE NOT NULL,
	project_end_date DATE,
	project_notes TEXT,
	project_completion_date DATE,
	project_status VARCHAR,
	dept_id INT NOT NULL,
	manager_id INT,
	FOREIGN KEY (dept_id) REFERENCES department(dept_id) ON DELETE CASCADE,
	FOREIGN KEY (manager_id) REFERENCES employees(employee_id) ON DELETE SET NULL
);

-- CREATE Employee Projects Table

CREATE TABLE employee_projects(
	employee_id INT,
	project_id INT,
	start_date DATE NOT NULL,
	end_date DATE,
	PRIMARY KEY (employee_id, project_id),
	FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE,
	FOREIGN KEY (project_id) REFERENCES projects(project_id) ON DELETE CASCADE
);


-- CREATE Work Location Table

CREATE TABLE work_location(
	wlocation_id SERIAL PRIMARY KEY,
	w_type VARCHAR DEFAULT 'On-Site',
	w_address TEXT NOT NULL,
	city VARCHAR NOT NULL,
	state VARCHAR NOT NULL,
	country VARCHAR NOT NULL,
	pincode INT NOT NULL
);


-- CREATE Payroll Table

CREATE TABLE payroll(
	payroll_id SERIAL PRIMARY KEY,
	month_year DATE NOT NULL,
	gross_salary BIGINT NOT NULL,
	income_tax FLOAT NOT NULL,
	loan_repayment BIGINT,
	insurance BIGINT,
	other_deductions BIGINT,
	bonus_rewards BIGINT,
	net_salary BIGINT NOT NULL,
	payment_status VARCHAR NOT NULL,
	payment_date DATE,
	employee_id INT,
	FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE
);


-- CREATE Tasks Table

CREATE TABLE tasks(
	task_id SERIAL PRIMARY KEY,
	task_name TEXT NOT NULL,
	task_description TEXT,
	status VARCHAR NOT NULL,
	project_id INT NOT NULL,
	assigned_to INT,
	created_by INT,
	FOREIGN KEY (project_id) REFERENCES projects(project_id) ON DELETE CASCADE,
	FOREIGN KEY (assigned_to) REFERENCES employees(employee_id) ON DELETE SET NULL, 
	FOREIGN KEY (created_by) REFERENCES employees(employee_id) ON DELETE SET NULL
);


-- CREATE Time Logs Table

CREATE TABLE time_logs(
	log_id SERIAL PRIMARY KEY,
	log_date DATE NOT NULL,
	start_time TIMESTAMP,
	end_time TIMESTAMP,
	total_time_spent INTERVAL NOT NULL,
	employee_id INT NOT NULL,
	task_id INT NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE,
	FOREIGN KEY (task_id) REFERENCES tasks(task_id) ON DELETE CASCADE
);


-- CREATE Attendance Table

CREATE TABLE attendance(
	attendance_id SERIAL PRIMARY KEY,
	check_in_time TIMESTAMP NOT NULL,
	check_out_time TIMESTAMP NOT NULL,
	total_hours INTERVAL NOT NULL,
	worked_day DATE NOT NULL,
	remarks TEXT,
	employee_id INT NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE
);


-- CREATE Manager Feedback Table

CREATE TABLE manager_feedback(
	feedback_id SERIAL PRIMARY KEY,
	feedback_date DATE NOT NULL,
	comments TEXT NOT NULL,
	rating INT NOT NULL,
	manager_id INT,
	employee_id INT NOT NULL,
	FOREIGN KEY (manager_id) REFERENCES employees(employee_id) ON DELETE CASCADE,
	FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE
);


-- Adding Foreign Keys to Employee Table

ALTER TABLE employees 
ADD FOREIGN KEY(dept_id)
REFERENCES department(dept_id)
ON DELETE SET NULL;

ALTER TABLE employees
ADD FOREIGN KEY(wlocation_id)
REFERENCES work_location(wlocation_id)
ON DELETE SET NULL;

