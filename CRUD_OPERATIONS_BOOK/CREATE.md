# CREATE OPERATIONS


## Inserting Employee Data

```sql
INSERT INTO employees VALUES(
    <first_name>,
    <last_name>,
	<personal_mobile>,
	<work_mobile>,
	<personal_email>,
	<work_email>,
	<dob>,
	<martial_status>,
	<dept_id>,         --Reference: department
	<project_id>,      --Reference: projects
	<wlocation_id>     --Reference: work_location
);
```
**Note:** ```dept_id```, ```project_id``` and ```wlocation_id``` are foreign keys, so while inputting the id value must exist on their respective tables.


## Inserting Department Data
```sql
INSERT INTO department VALUES(
	<dept_name>,
	<no_of_members>,
	<manager_id>,
);
```

**Note:** ```project_id``` is a foreign key, so while inputting the id value must exist on ```projects``` table.


## Inserting Projects Data

```sql
INSERT INTO projects VALUES(
	<project_name>,
	<project_start_date>,
	<project_end_date>,
	<project_notes>,
	<project_completion_date>,
	<project_status>,
	<dept_id>,          --Reference: department
);
```

**Note:** ```dept_id``` is a foreign key, so while inputting the id value must exist on ```department``` table.


## Inserting Work Location Data
```sql
INSERT INTO work_location VALUES(
	<w_address>,
	<city>,
	<state>,
	<country>,
	<pincode>
);
```

## Inserting Payroll Data
```sql
INSERT INTO payroll VALUES(
	<month_year>,
	<gross_salary>,
	<income_tax>,
	<loan_repayment>,
	<insurance>,
	<other_deductions>,
	<bonus_rewards>,
	<net_salary>,
	<payment_status>,
	<payment_date>,
	<employee_id>,      --Reference: employees
);
```


**Note:** ```employee_id``` is a foreign key, so while inputting the id value must exist on ```employees``` table.

## Adding Tasks for each Project - Inserting into Tasks Table

```sql
INSERT INTO tasks VALUES(
    <task_name>,
	<task_description>,
	<status>,
	<project_id>,
	<created_by>,       --Reference: employees
);
```
**Note:** ```created_by``` is a foreign key referencing ```employee_id``` at ```employees```, so while inputting the id value must exist on ```employees``` table.

## Adding Timelogs to the DB

```sql
INSERT INTO time_logs VALUES(
	<log_date>,
	<start_time>,
	<end_time>,
	<total_time_spent>,
	<employee_id>,      --Reference: employees
	<task_id>,          --Reference: tasks
);
```
**Note:** ```task_id``` is a foreign key, so while inputting the id value must exist on ```tasks``` table.


## Adding created Timesheets to DB

```sql
INSERT INTO time_sheet VALUES(
    <month_year>,
	<hours_spent>,
	<remarks>,
	<employee_id>,      --Reference: employees
	<task_id>,          --Reference: tasks
);
```
**Note:** ```task_id``` is a foreign key, so while inputting the id value must exist on ```tasks``` table.


## Inserting Attendance Data
```sql
INSERT INTO attendance VALUES(
	<check_in_time>,
	<check_out_time>,
	<total_hours>,
	<worked_day>,
	<remarks>,
	<employee_id>,      --Reference: employees
);
```
**Note:** ```employee_id``` is a foreign key, so while inputting the id value must exist on ```employees``` table.


## Inserting Employee Feedbacks into DB
```sql
INSERT INTO feedback VALUES(
	<feedback_date>,
	<comments>,
	<rating>,
	<feedbacker_id>,        --Reference: employees
	<employee_id>,          --Reference: employees
);
```
**Note:** ```feedbacker_id``` and ```employee_id``` are foreign keys, so while inputting the id value must exist on ```employees``` table. 

```feedbacker_id``` is the employee who is giving the feedback. ```employee_id``` is the feedback of the receipient employee. 

```feedbacker_id``` can be null, the system should consider it as anonymous feedback, incase the feedbacker wanted to stay so.
