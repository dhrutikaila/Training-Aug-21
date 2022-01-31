CREATE DATABASE Additional_Practice
USE Additional_Practice

--Exr.1 - CREATE Table--

--1)Write a SQL statement to create a simple table countries including columns country_id,country_name and region_id. 
--  make sure that the column country_id will be unique and store an auto incremented value.
CREATE TABLE Countries
(
	Country_Id INT PRIMARY KEY IDENTITY(1,1),
	Country_Name VARCHAR(20) NOT NULL,
	Region_Id SMALLINT
)

--2)Write a SQL statement to create a simple table countries including columns country_id, country_name and region_id which is already exists.
CREATE TABLE Countries
(
	Country_Id INT PRIMARY KEY IDENTITY(1,1),
	Country_Name VARCHAR(20) NOT NULL,
	Region_Id SMALLINT
)

--3)Write a SQL statement to create the structure of a table dup_countries similar to countries.
SELECT * INTO Duplicate_Countries FROM Countries WHERE 0=1
SELECT * FROM Duplicate_Countries

--4)Write a SQL statement to create a duplicate copy of countries table including structure and data by name dup_data_countries
SELECT * INTO dup_data_countries FROM Countries WHERE 1=1
SELECT * FROM dup_data_countries


--5)Write a SQL statement to create a table countries set a constraint NULL.
CREATE TABLE Countries_Constraint
(
	Country_Id INT NULL,
	Country_Name VARCHAR(20) NULL,
	Region_Id SMALLINT NULL
)

--6)Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary, max_salary and check whether the max_salary amount exceeding the upper limit 25000.
CREATE TABLE Jobs
( 
	Job_Id INT PRIMARY KEY ,
	Job_Title VARCHAR(20) NOT NULL,
	Min_Salary DECIMAL(5,0),
	Max_Salary DECIMAL(5,0),
	CONSTRAINT chk_maxSalary CHECk(Max_Salary<=25000)
)
INSERT INTO Jobs
	(1,'Software Engineer',22000,25000)
SELECT * FROM Jobs

--7)Write a SQL statement to create a table named countries including columns country_id, country_name and region_id and make sure that no countries except Italy, India and China will be entered in the table. and combination of columns country_id and region_id will be unique
CREATE TABLE Countries_3
(
	Country_Id SMALLINT PRIMARY KEY,
	Country_Name VARCHAR(20) NOT NULL,
	Region_Id SMALLINT NOT NULL ,
	CONSTRAINT chk_countryName CHECK(Country_Name IN ('India','Italy','China')),
	CONSTRAINT chk_regionId UNIQUE(Region_Id)
)
INSERT INTO Countries_3 VALUES
	(1,'India',5),
	(2,'Italy',10)
SELECT * FROM Countries_3

--8)Write a SQL statement to create a table named job_history including columns employee_id, start_date, end_date, job_id and department_id and make sure that the value against column end_date will be entered at the time of insertion to the format like '--/--/----'.
CREATE TABLE Job_History
(
	Employe_Id INT PRIMARY KEY,
	[Start_Date] DATE NOT NULL,
	End_Date VARCHAR(10),
	Job_Id INT NOT NULL,
	Department_Id INT NOT NULL,
	CONSTRAINT chk_endDate CHECK(End_Date LIKE '__/__/____')
)

INSERT INTO Job_History VALUES
	(1,'02/08/2021','03/08/2021',5,10)
	SELECT * FROM Job_History


--9)Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary and max_salary, and make sure that, the default value for job_title is blank and min_salary is 8000 and max_salary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.
CREATE TABLE Jobs2
(
	Job_Id INT PRIMARY KEY,
	Job_Title VARCHAR(20) DEFAULT '' NOT NULL,
	Min_Salary DECIMAL(5,0) DEFAULT 8000,
	Max_Salary DECIMAL(6,0) DEFAULT NULL
)
INSERT INTO Jobs2 (Job_Title) VALUES ('Developer')
INSERT INTO Jobs2 (Min_Salary) VALUES (25000)
SELECT * FROM Jobs2

--10)Write a SQL statement to create a table job_history including columns employee_id, start_date, end_date, job_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion and the foreign key column job_id contain only those values which are exists in the jobs table.
--Here is the structure of the table jobs;
+------------+--------------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| JOB_ID | varchar(10) | NO | PRI | | |
| JOB_TITLE | varchar(35) | NO | | NULL | |
| MIN_SALARY | decimal(6,0) | YES | | NULL | |
| MAX_SALARY | decimal(6,0) | YES | | NULL | |
+------------+--------------+------+-----+---------+-------+

CREATE TABLE Job_History
(
	Employee_Id INT PRIMARY KEY,
	[Start_Date] DATE NOT NULL,
	End_Date DATE,
	Job_Id VARCHAR(10) NOT NULL,
	Department_Id INT NOT NULL,
	CONSTRAINT chk_jobId FOREIGN KEY(Job_Id) REFERENCES Jobs(Job_Id)
)

--11)Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion and the foreign key columns combined by department_id and manager_id columns contain only those unique combination values, which combinations are exists in the departments table.
--Assume the structure of departments table below.
+-----------------+--------------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| DEPARTMENT_ID | decimal(4,0) | NO | PRI | 0 | |
| DEPARTMENT_NAME | varchar(30) | NO | | NULL | |
| MANAGER_ID | decimal(6,0) | NO | PRI | 0 | |
| LOCATION_ID | decimal(4,0) | YES | | NULL | |
+-----------------+--------------+------+-----+---------+-------

CREATE TABLE Employees
(
	Employee_Id INT PRIMARY KEY,
	First_Name VARCHAR(10) NOT NULL,
	Last_Name VARCHAR(10) NOT NULL,
	Email VARCHAR(15) ,
	Phone_Number DECIMAL(10,0) NOT NULL,
	Hire_Date DATE ,
	Job_Id VARCHAR(10) ,
	Salary DECIMAL(6,0) ,
	Commission DECIMAL(5,0),
	Manager_Id DECIMAL(6,0) NOT NULL,
	Department_Id DECIMAL(4,0) NOT NULL,
	CONSTRAINT chk_Email CHECK(Email LIKE '%__@_%.com'),
	CONSTRAINT chk_PhoneNumber CHECK(Phone_Number LIKE '[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	CONSTRAINT chk_ManagerId FOREIGN KEY(Manager_Id) REFERENCES departments(MANAGER_ID),
	CONSTRAINT chk_DepartmentId FOREIGN KEY(Department_Id) REFERENCES departments(DEPARTMENT_ID)
)

--12)Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column department_id, reference by the column department_id of departments table, can contain only those values which are exists in the departments table and another foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table.
--Assume that the structure of two tables departments and jobs.
+-----------------+--------------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| DEPARTMENT_ID | decimal(4,0) | NO | PRI | 0 | |
| DEPARTMENT_NAME | varchar(30) | NO | | NULL | |
| MANAGER_ID | decimal(6,0) | YES | | NULL | |
| LOCATION_ID | decimal(4,0) | YES | | NULL | |
+-----------------+--------------+------+-----+---------+-------+
+------------+--------------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| JOB_ID | varchar(10) | NO | PRI | | |
| JOB_TITLE | varchar(35) | NO | | NULL | |
| MIN_SALARY | decimal(6,0) | YES | | NULL | |
| MAX_SALARY | decimal(6,0) | YES | | NULL | |
+------------+--------------+------+-----+---------+-------+

CREATE TABLE Employees
(
	Employee_Id INT PRIMARY KEY,
	First_Name VARCHAR(10) NOT NULL,
	Last_Name VARCHAR(10) NOT NULL,
	Email VARCHAR(15) ,
	Phone_Number DECIMAL(10,0) NOT NULL,
	Hire_Date DATE ,
	Job_Id VARCHAR(10) ,
	Salary DECIMAL(6,0) ,
	Commission DECIMAL(5,0),
	Manager_Id DECIMAL(6,0) NOT NULL,
	Department_Id DECIMAL(4,0) NOT NULL,
	CONSTRAINT chk_Email CHECK(Email LIKE '%__@_%.com'),
	CONSTRAINT chk_PhoneNumber CHECK(Phone_Number LIKE '[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	CONSTRAINT chk_JobId FOREIGN KEY(Job_Id) REFERENCES jobs(JOB_ID),
	CONSTRAINT chk_DepartmentId FOREIGN KEY(Department_Id) REFERENCES departments(DEPARTMENT_ID)
)


