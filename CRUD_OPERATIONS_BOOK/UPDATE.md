# UPDATE OPERATIONS

## Updating any Employee Details

```sql
UPDATE employees 
SET first_name = <new_first_name>,
	last_name = <new_last_name>,
	personal_mobile = <new_personal_mobile>,
	work_mobile = <new_work_mobile>,
	personal_email = <new_personal_email>,
	work_email = <new_work_email>,
	dob = <new_dob>,
	martial_status = <new_martial_status>,
	dept_id = <new_dept_id>,         --Foreign Key
	project_id = <new_project_id>,      --Foreign Key
	wlocation_id = <new_wlocation_id>     --Foreign Key
WHERE employee_id = <requested_employee_id>;
```
The backend can choose what to be updated or not and update the table accordingly.


## Updating Department Details

```sql
UPDATE department 
SET dept_name = <new_dept_name>,
	no_of_members = <new_no_of_members>,
	manager_id = <new_manager_id>    --Foreign Key
WHERE dept_id = <requested_dept_id>;
```

## Updating Project Details

```sql 
UPDATE projects 
SET project_name = <new_project_name>,
	project_start_date = <new_project_start_date>,
	project_end_date = <new_project_end_date>,
	project_notes = <new_project_notes>,
	project_completion_date = <new_completion_date>,
	project_status = <new_project_status>
WHERE project_id = <requested_project_id>
```

## Updating Tasks

```sql 
UPDATE tasks
SET task_name = <new_task_name>,
	task_description = <new_task_description>,
	status = <new_task_status>
WHERE task_id = <requested_task_id>
```


## Updating Time Logs

```sql
UPDATE time_logs 
SET log_date = <new_log>,
	start_time = <new_start_time>,
	end_time = <new_end_time>,
	total_time_spent = <new_total_time_spent>,
	task_id = <new_task_id>       --Foreign Key
WHERE log_id = <requested_log_id>
```

## Updating Time Sheets

```sql 
UPDATE time_sheet
SET month_year = <new_month_year>,
	hours_spent = <new_hours_spent>,
	remarks = <new_remarks>,
	task_id = <new_task_id>     --Foreign Key
WHERE sheet_id = <requested_sheet_id>;
```

## Updating Attendance

```sql
UPDATE attendance
SET check_in_time = <new_check_in_time>,
	check_out_time = <new_check_out_time>,
	total_hours = <new_total_hours>,
	worked_day = <new_worked_day>,
	remarks = <new_remarks>
WHERE attendance_id = <requested_attendance_id>;
```

## Updating Feedback

```sql
UPDATE feedback
SET feedback_date = <new_feedback_date>,
	comments = <new_comments>,
	rating = <new_rating>
WHERE feedback_id = <requested_feedback_id>
```

## Updating Payroll

```sql
UPDATE payroll
SET month_year = <new_month_year>,
	gross_salary = <new_gross_salary>,
	income_tax = <new_income_tax>,
	loan_repayment = <new_loan_repayment>,
	insurance = <new_insurance>,
	other_deductions = <new_other_deductions>,
	bonus_rewards = <new_bonus_rewards>,
	net_salary = <new_net_salary>,
	payment_status = <new_payment_status>,
	payment_date = <new_payment_date>
WHERE payroll_id = <requested_payroll_id>
```

## Updating Work Location

```sql
UPDATE work_location
SET w_address = <new_w_address>,
	city = <new_city>,
	state = <new_state>,
	country = <new_country>,
	pincode = <new_pincode>
WHERE wlocation_id = <new_wlocation_id>
```