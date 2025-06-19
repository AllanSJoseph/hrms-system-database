# HRMS DATABASE DESIGN

## HRMS System Overview.

HRMS stands for **Human Resorurce Management System**. It is a software that helps organisations to digitalize, automate and centralize common HR processes, such as employee data storage, recruitment, time and attendance, payroll, performance management and analysis, etc.

### Main Requirements

- Employee Data Storage and Management
- Time and Attendance
- Performance Management and Analysis
- Payroll, Benefits and Compensation

## Design (ER Diagram)

![image](./ER_DIAGRAMS/HRMS%20ER%20Diagram%201.png)

## Implementation

### Tools Used

- PostgreSQL (Database Management System used)
- Docker  (Containerisation of the DB)


## Try it Out!

I containerised the DB for ease of deploying using a ```postgres:16-alpine``` docker image. This database is containerised using docker. I have made the Dockerfile, setup procedure and compose method as below. 

Follow the below steps to run this database using Docker.

### Prerequisites
1. Install Docker Desktop.
2. [Optional] Install PostgresSQL DB or pull  ```postgres:16-alpine``` docker image.

### Building the Docker Image

**Step 1:** Download or clone this github repository.

**Step 2:** Open the project location in your terminal/powershell.

**Step 3:** Build the image using this command.
```sh
docker build -t hrms-demo-db .
```

**Step 4:** Run the container from the image by below command or through Docker Desktop.

**Docker Desktop Method**.

 After creating the image, open Docker Desktop and find your created image.

 Then run the image and fill in the details in optional settings,
 - Give a container name of your choice. Eg: ```hrms-db```
 - Use Port 5431 if postgres is already installed and running to avoid port conflict. Else you can use original postgres port 5432.
 - Make sure to fill in the Environment Variables:
 ```js
POSTGRES_USER = hrmadmin
POSTGRES_PASSWORD = hrm123
POSTGRES_DB = hrmsDB
POPULATE_DEMO = false // true if you want tables to be populated with demo values
 
 ``` 

**Command line method**. Copy the below command.
```sh

docker run --name hrms-demoDB -e POSTGRES_PASSWORD=hrm123 -e POSTGRES_USER=hrmadmin -e POSTGRES_DB=hrmsDB -e POPULATE_DEMO="true" -p 5431:5432 -d postgres

```
 
 
 - ```POPULATE_DEMO``` environment variable is for checking whether you want to populate the tables with demo data or not. There is a sql file that populates the tables with some sample data to test some quereies and connections. if you want, you can set this variable to ```true``` so the tables will be populated.

**Step 5:** Have a cup of coffee or tea while the database container is setting up on your container. Keep note of the logs while the container is creating. Make sure. ```Finished setting up!!``` is shown.

**Step 6:** Acess the database through interactive terminal using the docker execute and try out the queries.
```sh
docker exec -it <container_name> psql -U myuser -d mydatabase
```
Eg:
```sh
docker exec -it postgres-db psql -U myuser -d mydatabase
```

You can also connect the database through pgAdmin through Query Tool Workspace, open the test_queries.sql from queries folder and try each queries.