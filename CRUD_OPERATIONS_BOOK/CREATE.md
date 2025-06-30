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
	<w_type>, 
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


## Assigning Projects for employees

```sql
INSERT INTO employee_projects VALUES(
	<employee_id>,		--Reference: employees
	<project_id>,		--Reference: Projects
	<start_date>,
	<end_date>
);
```
**Note:** ```employee_id``` and ```project_id``` are composite keys, make sure the combination of employee and project id's should be unique.


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


## Inserting Manager Feedbacks into DB
```sql
INSERT INTO manager_feedback VALUES(
	<feedback_date>,
	<comments>,
	<rating>,
	<manager_id>,        --Reference: employees
	<employee_id>,          --Reference: employees
);
```
**Note:** ```manager_id``` and ```employee_id``` are foreign keys, so while inputting the id value must exist on ```employees``` table. 

```manager_id``` is the employee who is giving the feedback. ```employee_id``` is the feedback of the receipient employee. 

