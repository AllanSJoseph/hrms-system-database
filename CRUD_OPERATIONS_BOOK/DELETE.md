# DELETE OPERATIONS

## Deleting an Employee (MASTER Table)

Suppose an Employee has left the company, so we may have to delete the Employee from the database.

```sql
DELETE FROM employees WHERE employee_id = <employee_id>;
```

The employee Table is the ```Master Table``` in the database. It has connections with all the tables in the database so when an employee is deleted, the changes that happen is below:

#### Department Table:
An Employee can be a manager of a department: since in the department table I have set a constraint ```ON DELETE SET NULL``` for the ```mgr_id``` field (foreign key referencing employees table), so the department won't be deleted from database.

Another thing to consider is ```no_of_members``` field which dosen't have a direct connection but have to be decremented from the backend. (Yet to Implement Trigger function)

#### On other Tables

**```ON DELETE CASCADE```** constraint is added on the foreign-keys referencing to ```employees``` on the following tables, so deleting the employee will remove the rows which reference to that ```employee_id``` will also be deleted:

+ ```payroll``` Table
+ ```time_logs``` Table
+ ```time_sheet``` Table
+ ```attendance``` Table
+ ```feedback``` Table (if the deleted employee is the one receiving feedback)

**```ON DELETE SET NULL```** constraint is added on the foreign-keys referencing to ```employees``` on the following tables, so deleting the employee will set the value ```NULL``` to the fields of the rows which reference to that ```employee_id```:

+ ```department``` Table (discussed above)
+ ```feedback``` Table (if the employee is the one giving the feedback, it is set null and the feedback is considered anonymous feedback)
+ ```tasks``` Table (if the creator of the task is deleted, won't delete the task.)



## Deleting a Department

Department has direct connection between employees and projects tables.

+ **```ON DELETE SET NULL```** is given for ```employees``` so the ```employees``` under that ```department``` won't be deleted.
+ **```ON DELETE CASCADE```** is given for ```projects``` so if the ```department``` is deleted, the ```projects``` under it is also deleted.

## Deleting a Project

Project has direct connection to employees and tasks.

+ **```ON DELETE SET NULL```** is given for ```employees``` so the ```employees``` under that ```project``` won't be deleted.
+ **```ON DELETE CASCADE```** is given for ```tasks``` so if a  ```project``` is deleted, the ```tasks``` under it is also deleted.

**Note:** Projects are not expected to be deleted when they are completed, for that there is a field ```project_status``` which shows whether the project is completed or not.

## Deleting a Work Location

Work location has only one connection which is with the employees table. The employee's ```wlocation_id``` reference is given **```ON DELETE SET NULL```** constraint so deleting a work location will not delete the employees at that work location since they can be relocated. 

## Deleting a Task
Tasks has connection with ```time_logs``` and ```time_sheet``` table. The employee's wlocation_id reference is given **```ON DELETE CASCADE```** constraint so deleting a task will delete the time logs and time sheets which the employee did. So a backup maybe needed for proper Performance Analysis.

**Note:** Tasks are not expected to be deleted when they are completed, for that there is a field ```status``` which shows whether a task is completed or not.

## Deleting Values on other tables.

Deleting rows on other tables aside from the above tables won't bring any drastic changes. 