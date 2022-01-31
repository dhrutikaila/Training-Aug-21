--1. Write a SQL statement to create a simple table countries including columns country_id,country_name and region_id. make sure that the column country_id will be unique and store an auto incremented value.
CREATE TABLE Countries
	(
	CountryId INT IDENTITY(1,1) PRIMARY KEY ,
	CountryName NVARCHAR(60),
	RegionId INT
	)

--2. Write a SQL statement to create a simple table countries including columns country_id, country_name and region_id which is already exists.
CREATE TABLE Countries
	(
	CountryId INT IDENTITY(1,1) PRIMARY KEY ,
	CountryName NVARCHAR(60) NOT NULL UNIQUE CHECK ( country_name in('india','china','italy')),,
	RegionId INT
	)

--3. Write a SQL statement to create the structure of a table dup_countries similar to countries.
SELECT * INTO DupCountries FROM (SELECT * FROM Countries) DUP WHERE 6=4

--4. Write a SQL statement to create a duplicate copy of countries table including structure and data by name dup_data_countries.
SELECT * INTO DupDataCountries FROM (SELECT * FROM Countries) DupD

--5. Write a SQL statement to create a table countries set a constraint NULL.
CREATE TABLE Countries
	(
	CountryId INT IDENTITY(1,1) PRIMARY KEY ,
	CountryName NVARCHAR(60),
	RegionId INT NULL
	)

--6. Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary, max_salary and check whether the max_salary amount exceeding the upper limit 25000.
CREATE TABLE Jobs
	(
	JobId INT PRIMARY KEY IDENTITY(1,1),
	JobTitle VARCHAR(30),
	MinSalary DECIMAL(6),
	MaxSalary DECIMAL (6)
	CHECK (MaxSalary>=25000)
	)
	
--7. Write a SQL statement to create a table named countries including columns country_id, country_name and region_id and make sure that no countries except Italy, India and China will be entered in the table. and combination of columns country_id and region_id will be unique.
CREATE TABLE Countries
	(
	CountryId INT IDENTITY(1,1) PRIMARY KEY ,
	CountryName NVARCHAR(60) NOT NULL UNIQUE CHECK ( CountryName IN ('India','China','Italy')),
	RegionId INT
	)
	
--8. Write a SQL statement to create a table named job_history including columns employee_id, start_date, end_date, job_id and department_id and make sure that the value against column end_date will be entered at the time of insertion to the format like '--/--/----'.
CREATE TABLE job_history
	(
	EmployeeId INT PRIMARY KEY IDENTITY(1,1),
	JobStartDate Date NOT NULL,
	JobEndDate Date CHECK (end_date LIKE '--/--/----'), 
	JobId INT NOT NULL,
	DepartmentId INT
	)

--9. Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary and max_salary, and make sure that, the default value for job_title is blank and min_salary is 8000 and max_salary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.
CREATE TABLE Jobs
	(
	JobId INT PRIMARY KEY IDENTITY(1,1),
	JobTitle VARCHAR(20) DEFAULT(' '),
	MinSalary DECIMAL(6) DEFAULT 8000,
	MaxSalary DECIMAL (6) DEFAULT NULL
	)

--10. Write a SQL statement to create a table job_history including columns employee_id, start_date, end_date, job_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion and the foreign key column job_id contain only those values which are exists in the jobs table.
--Here is the structure of the table jobs;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| JOB_ID     | varchar(10)  | NO   | PRI |         |       |
| JOB_TITLE  | varchar(35)  | NO   |     | NULL    |       |
| MIN_SALARY | decimal(6,0) | YES  |     | NULL    |       |
| MAX_SALARY | decimal(6,0) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
CREATE TABLE JobHistory
	(
	EmployeeId INT IDENTITY(1,1) PRIMARY KEY,
	JobStartDate Date,
	JobEndDate Date,
	JobId INT,
	DepartmentId INT,
	CONSTRAINT FKJobHistory FOREIGN KEY (JobId) REFERENCES Jobs(JobId)
	)
	
--11. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion and the foreign key columns combined by department_id and manager_id columns contain only those unique combination values, which combinations are exists in the departments table.
--Assume the structure of departments table below.

+-----------------+--------------+------+-----+---------+-------+
| Field           | Type         | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| DEPARTMENT_ID   | decimal(4,0) | NO   | PRI | 0       |       |
| DEPARTMENT_NAME | varchar(30)  | NO   |     | NULL    |       |
| MANAGER_ID      | decimal(6,0) | NO   | PRI | 0       |       |
| LOCATION_ID     | decimal(4,0) | YES  |     | NULL    |       |
+-----------------+--------------+------+-----+---------+-------+
CREATE TABLE employees
	(
	employee_id INT PRIMARY KEY IDENTITY(1,1),
	first_name VARCHAR (25),
	last_name VARCHAR (25),
	email VARCHAR (20),
	phone_number VARCHAR (10),
	hire_date DATE,
	job_id INT,
	salary DECIMAL (7),
	commission DECIMAL (5),
	manager_id INT NOT NULL,
	department_id INT NOT NULL,
	CONSTRAINT FKDepMgrEmp FOREIGN KEY (department_id,manager_id) REFERENCES departments(department_id,manager_id)
	)

--12. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column department_id, reference by the column department_id of departments table, can contain only those values which are exists in the departments table and another foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table. 
--Assume that the structure of two tables departments and jobs.

+-----------------+--------------+------+-----+---------+-------+
| Field           | Type         | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| DEPARTMENT_ID   | decimal(4,0) | NO   | PRI | 0       |       |
| DEPARTMENT_NAME | varchar(30)  | NO   |     | NULL    |       |
| MANAGER_ID      | decimal(6,0) | YES  |     | NULL    |       |
| LOCATION_ID     | decimal(4,0) | YES  |     | NULL    |       |
+-----------------+--------------+------+-----+---------+-------+
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| JOB_ID     | varchar(10)  | NO   | PRI |         |       |
| JOB_TITLE  | varchar(35)  | NO   |     | NULL    |       |
| MIN_SALARY | decimal(6,0) | YES  |     | NULL    |       |
| MAX_SALARY | decimal(6,0) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
CREATE TABLE employees
	(
	employee_id INT PRIMARY KEY IDENTITY(1,1),
	first_name VARCHAR (25),
	last_name VARCHAR (25),
	email VARCHAR (20),
	phone_number VARCHAR (10),
	hire_date DATE,
	JobId INT,
	salary DECIMAL (7),
	commission DECIMAL (5),
	manager_id INT NOT NULL,
	department_id INT NOT NULL,
	CONSTRAINT FKDepEmp FOREIGN KEY (department_id) REFERENCES departments(department_id),
	CONSTRAINT FKJobsEmp FOREIGN KEY (JobId) REFERENCES Jobs(JobId),
	)