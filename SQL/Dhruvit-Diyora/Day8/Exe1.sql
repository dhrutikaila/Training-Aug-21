--task-1. Write a SQL statement to create a simple table countries including columns country_id,country_name and region_id. make sure that the column country_id will be unique and store an auto incremented value.
CREATE TABLE Countries(
	CountryId INT PRIMARY KEY IDENTITY(1,1),
	CountryName VARCHAR (30),
	RegionId INT
)

--task-2. Write a SQL statement to create a simple table countries including columns country_id, country_name and region_id which is already exists.
IF NOT EXISTS
   (  SELECT [name]
      FROM sys.tables
      WHERE [name] = 'Countries'
   )
   CREATE TABLE Countries(
	CountryId INT PRIMARY KEY IDENTITY(1,1),
	CountryName VARCHAR (30),
	RegionId INT
)

--task-3. Write a SQL statement to create the structure of a table dup_countries similar to countries.
SELECT * INTO Dup_Countries FROM Countries WHERE 1 = 0

--task-4. Write a SQL statement to create a duplicate copy of countries table including structure and data by name dup_data_countries.
SELECT * INTO Dup_Data_Countries FROM Countries

--task-5. Write a SQL statement to create a table countries set a constraint NULL.
CREATE TABLE Countries(
	CountryId INT PRIMARY KEY IDENTITY(1,1) ,
	CountryName VARCHAR (30) NULL,
	RegionId INT NULL
)

--task-6. Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary, max_salary and check whether the max_salary amount exceeding the upper limit 25000.
CREATE TABLE Jobs
(
JobId INT PRIMARY KEY IDENTITY(1,1),
JobTitle VARCHAR(30) ,
MinSalary DECIMAL(6,2),
MaxSalary DECIMAL (6,2) CONSTRAINT CK_MaxSalary CHECK (MaxSalary>=25000)
)

--task-7. Write a SQL statement to create a table named countries including columns country_id, country_name and region_id and make sure that no countries except Italy, India and China will be entered in the table. and combination of columns country_id and region_id will be unique.
CREATE TABLE Countries (
CountryID VARCHAR(10) NOT NULL UNIQUE DEFAULT '',
CountryName VARCHAR(40) UNIQUE NULL CHECK(CountryName IN('Italy','India','China')) ,
RegionId VARCHAR(2) UNIQUE NOT NULL,
PRIMARY KEY (CountryID,RegionId));


--task-8. Write a SQL statement to create a table named job_history including columns employee_id, start_date, end_date, job_id and department_id and make sure that the value against column end_date will be entered at the time of insertion to the format like '--/--/----'.
CREATE TABLE JobHistory(
EmployeeID INT PRIMARY KEY Identity(1,1),
StartDate Date Not null,
EndDate Date not null,
CONSTRAINT CHK_Person check (EndDate Like '--/--/----'),
JobID int not null,
DepartmentId int
);
INSERT INTO JobHistory values ('2021-02-08','08-05-2021',2,4);

--task-9. Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary and max_salary, and make sure that, the default value for job_title is blank and min_salary is 8000 and max_salary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.
CREATE TABLE Jobs( 
JobId INT PRIMARY KEY Identity(1,1), 
JobTitle VARCHAR(35) DEFAULT ' ', 
MinSalary decimal(6,0) DEFAULT 8000, 
MaxSalary decimal(6,0) DEFAULT NULL
);
insert INTO Jobs (MinSalary,MaxSalary) VALUES ('Manager',1000,2000),('Developer',500,1000)
SELECT * FROM Jobs


--task-10. Write a SQL statement to create a table job_history including columns employee_id, start_date, end_date, job_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion and the foreign key column job_id contain only those values which are exists in the jobs table.

--Here is the structure of the table jobs;

--+------------+--------------+------+-----+---------+-------+
--| Field      | Type         | Null | Key | Default | Extra |
--+------------+--------------+------+-----+---------+-------+
--| JOB_ID     | varchar(10)  | NO   | PRI |         |       |
--| JOB_TITLE  | varchar(35)  | NO   |     | NULL    |       |
--| MIN_SALARY | decimal(6,0) | YES  |     | NULL    |       |
--| MAX_SALARY | decimal(6,0) | YES  |     | NULL    |       |
--+------------+--------------+------+-----+---------+-------+
CREATE TABLE JobHistory
    (
    EmployeeId INT PRIMARY KEY IDENTITY(1,1),
    JobStartDate Date NOT NULL,
    JobEndDate Date NOT NULL,
    JobId INT,
    DepartmentId INT,
    CONSTRAINT FKJobHistory FOREIGN KEY (JobId) REFERENCES Jobs(JobId)
    )


--task-11. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion and the foreign key columns combined by department_id and manager_id columns contain only those unique combination values, which combinations are exists in the departments table.

--Assume the structure of departments table below.

--+-----------------+--------------+------+-----+---------+-------+
--| Field           | Type         | Null | Key | Default | Extra |
--+-----------------+--------------+------+-----+---------+-------+
--| DEPARTMENT_ID   | decimal(4,0) | NO   | PRI | 0       |       |
--| DEPARTMENT_NAME | varchar(30)  | NO   |     | NULL    |       |
--| MANAGER_ID      | decimal(6,0) | NO   | PRI | 0       |       |
--| LOCATION_ID     | decimal(4,0) | YES  |     | NULL    |       |
--+-----------------+--------------+------+-----+---------+-------+
    CREATE TABLE Employees
    (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR (25),
    LastName VARCHAR (25),
    Email VARCHAR (20),
    PhoneNumber VARCHAR (10),
    HireDate DATE,
    JobId INT,
    Salary DECIMAL (7),
    Commission DECIMAL (5),
    ManagerId INT NOT NULL,
    DepartmentId INT NOT NULL,
    CONSTRAINT FK_Dep_Mgr_Emp FOREIGN KEY (DepartmentId,ManagerId) REFERENCES Departments(DepartmentId,ManagerId)
    )

--task-12. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column department_id, reference by the column department_id of departments table, can contain only those values which are exists in the departments table and another foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table. 


--Assume that the structure of two tables departments and jobs.

--+-----------------+--------------+------+-----+---------+-------+
--| Field           | Type         | Null | Key | Default | Extra |
--+-----------------+--------------+------+-----+---------+-------+
--| DEPARTMENT_ID   | decimal(4,0) | NO   | PRI | 0       |       |
--| DEPARTMENT_NAME | varchar(30)  | NO   |     | NULL    |       |
--| MANAGER_ID      | decimal(6,0) | YES  |     | NULL    |       |
--| LOCATION_ID     | decimal(4,0) | YES  |     | NULL    |       |
--+-----------------+--------------+------+-----+---------+-------+


--+------------+--------------+------+-----+---------+-------+
--| Field      | Type         | Null | Key | Default | Extra |
--+------------+--------------+------+-----+---------+-------+
--| JOB_ID     | varchar(10)  | NO   | PRI |         |       |
--| JOB_TITLE  | varchar(35)  | NO   |     | NULL    |       |
--| MIN_SALARY | decimal(6,0) | YES  |     | NULL    |       |
--| MAX_SALARY | decimal(6,0) | YES  |     | NULL    |       |
--+------------+--------------+------+-----+---------+-------+

CREATE TABLE Employees ( 
	EmployeeID INT PRIMARY KEY Identity(1,1), 
	FirstName VARCHAR(20) not NULL, 
	LastName VARCHAR(25) NOT NULL, 
	Email VARCHAR(25) NOT NULL, 
	PhoneNumber VARCHAR(20) NOT NULL, 
	HireDate DATE NOT NULL, 
	JobId INT NOT NULL, 
	Salary DECIMAL(8,2) NOT NULL,
	CommisionPer DECIMAL(5,2) NOT NULL,
	ManagerId INT NOT NULL, 
	DepartmentId INT NOT null, 
	CONSTRAINT FK_DepartmentId FOREIGN KEY (DepartmentId) REFERENCES Departments(DepartmentId),
	CONSTRAINT FK_JobId FOREIGN KEY (JobId) REFERENCES Jobs(JobId)
);