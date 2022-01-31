CREATE DATABASE DB_ExtraQueries

USE DB_ExtraQueries

SELECT * FROM sys.tables

--1. Write a SQL statement to create a simple table countries including columns country_id,country_name and region_id. make sure that the column country_id will be unique and store an auto incremented value.

CREATE TABLE Region(
	RegionID INT IDENTITY(1,1)
	, RegionName VARCHAR(20)
	, CONSTRAINT PK_Region_RegionID PRIMARY KEY(RegionID)
)

CREATE TABLE Countries(
	CountryID INT IDENTITY(1,1)
	, CountryName VARCHAR(30)
	, RegionID INT 
	, CONSTRAINT PK_Contries_CountryID PRIMARY KEY(CountryID)
	, CONSTRAINT FK_Countries_Region FOREIGN KEY(RegionID) REFERENCES Region(RegionID)
)

--2. Write a SQL statement to create a simple table countries including columns country_id, country_name and region_id which is already exists.

CREATE TABLE Region(
	RegionID INT IDENTITY(1,1)
	, RegionName VARCHAR(20)
	, CONSTRAINT PK_Region_RegionID PRIMARY KEY(RegionID)
)

CREATE TABLE Countries(
	CountryID INT IDENTITY(1,1)
	, CountryName VARCHAR(30)
	, RegionID INT 
	, CONSTRAINT PK_Countries_CountryID PRIMARY KEY(CountryID)
	, CONSTRAINT FK_Countries_Region FOREIGN KEY(RegionID) REFERENCES Region(RegionID)
	, CONSTRAINT UQ_Countries_CountryName UNIQUE(CountryName)
)

--3. Write a SQL statement to create the structure of a table dup_countries similar to countries.

SELECT * 
INTO Dup_Countries 
FROM Countries
WHERE 1 = 0


--4. Write a SQL statement to create a duplicate copy of countries table including structure and data by name dup_data_countries.

SELECT * 
INTO Dup_Data_Countries 
FROM Countries

SELECT *
FROM Dup_Data_Countries

--5. Write a SQL statement to create a table countries set a constraint NULL.

CREATE TABLE Countries(
	CountryID INT IDENTITY(1,1) NOT NULL
	, CountryName VARCHAR(30) NOT NULL
	, RegionID INT 
	, CONSTRAINT PK_Countries_CountryID PRIMARY KEY(CountryID)
	, CONSTRAINT FK_Countries_Region FOREIGN KEY(RegionID) REFERENCES Region(RegionID)
	, CONSTRAINT UQ_Countries_CountryName UNIQUE(CountryName)
)

--6. Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary, max_salary and check whether the max_salary amount exceeding the upper limit 25000.

CREATE TABLE Jobs(
	JobID INT NOT NULL  IDENTITY(1,1)
	, JobTitle VARCHAR(15)
	, MinSalary Money
	, MaxSalary Money
	, CONSTRAINT PK_Jobs_JobID PRIMARY KEY(JobID)
	, CONSTRAINT CHK_Jobs_MaxSalary CHECK(Maxsalary <= 25000)
)

--7. Write a SQL statement to create a table named countries including columns country_id, country_name and region_id and make sure that no countries except Italy, India and China will be entered in the table. and combination of columns country_id and region_id will be unique.

CREATE TABLE Countries(
	CountryID INT IDENTITY(1,1) NOT NULL
	, CountryName VARCHAR(30) NOT NULL
	, RegionID INT 
	, CONSTRAINT PK_Countries PRIMARY KEY(CountryID,RegionID)
	, CONSTRAINT FK_Countries_Region FOREIGN KEY(RegionID) REFERENCES Region(RegionID)
	, CONSTRAINT CHK_Countries_CountryName CHECK(CountryName IN ('Italy', 'India', 'China'))
)

--8. Write a SQL statement to create a table named job_history including columns employee_id, start_date, end_date, job_id and department_id and make sure that the value against column end_date will be entered at the time of insertion to the format like '--/--/----'.

CREATE TABLE JobHistory(
	EmployeeID INT NOT NULL
	, StartDate VARCHAR(10) NOT NULL
	, EndDate VARCHAR(10) NOT NULL
	, JobID INT NOT NULL
	, DepartmentID INT NOT NULL
	, CONSTRAINT CHK_JobHistory_StartDate CHECK(StartDate LIKE '[0-3][0-9]/[0-1][0-9]/[0-9][0-9][0-9][0-9]')
	, CONSTRAINT CHK_JobHistory_EndDate CHECK(EndDate LIKE '[0-3][0-9]/[0-1][0-9]/[0-9][0-9][0-9][0-9]')
)

--9. Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary and max_salary, and make sure that, the default value for job_title is blank and min_salary is 8000 and max_salary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.

CREATE TABLE Jobs(
	JobID INT NOT NULL  IDENTITY(1,1)
	, JobTitle VARCHAR(15) CONSTRAINT DF_Jobs_JobTitle DEFAULT ' '
	, MinSalary Money
	, MaxSalary Money CONSTRAINT DF_Jobs_MaxSalary DEFAULT 8000
	, CONSTRAINT PK_Jobs_JobID PRIMARY KEY(JobID)
	, CONSTRAINT CHK_Jobs_MinSalary CHECK(Maxsalary >= 8000)
	, CONSTRAINT CHK_Jobs_MaxSalary CHECK(Maxsalary <= 25000)
)

--10. Write a SQL statement to create a table job_history including columns employee_id, start_date, end_date, job_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion and the foreign key column job_id contain only those values which are exists in the jobs table.

CREATE TABLE JobHistory(
	EmployeeID INT NOT NULL
	, StartDate DATE 
	, EndDate DATE 
	, JobID INT NOT NULL
	, DepartmentID INT NOT NULL
	, CONSTRAINT PK_JobHistory PRIMARY KEY(EmployeeID,JobID)
	, CONSTRAINT FK_JobHistory_JobID FOREIGN KEY(JobID) REFERENCES Jobs(JobID)
)

--11. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion and the foreign key columns combined by department_id and manager_id columns contain only those unique combination values, which combinations are exists in the departments table.

CREATE TABLE Departments(
	DepartmentID INT IDENTITY(1,1)
	, DepartmentName VARCHAR(20)
	, ManagerID INT
	, LocationID INT 
	, CONSTRAINT PK_Departments PRIMARY KEY(DepartmentID)
)

CREATE TABLE Employees(
	EmployeeId INT IDENTITY(1,1)
	, FirstName VARCHAR(20) NOT NULL
	, LastName VARCHAR(20) NOT NULL
	, Email VARCHAR(50)  NOT NULL
	, PhoneNumber NUMERIC(10) NOT NULL
	, HireDate DATE NOT NULL
	, Jobid INT  NOT NULL
	, Salary MONEY  NOT NULL
	, Commission MONEY
	, ManagerID INT  
	, DepartmentID INT  NOT NULL
	, CONSTRAINT PK_Employees PRIMARY KEY(EmployeeId,ManagerID,DepartmentID)
	, CONSTRAINT FK_Employees_Departments FOREIGN KEY(DepartmentID) REFERENCES Departments(DepartmentID)
	, CONSTRAINT UQ_Employees_EmployeeID UNIQUE(EmployeeId)
)

--12. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column department_id, reference by the column department_id of departments table, can contain only those values which are exists in the departments table and another foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table. 

CREATE TABLE Jobs(
	JobID INT NOT NULL  IDENTITY(1,1)
	, JobTitle VARCHAR(15) CONSTRAINT DF_Jobs_JobTitle DEFAULT ' '
	, MinSalary Money
	, MaxSalary Money CONSTRAINT DF_Jobs_MaxSalary DEFAULT 8000
	, CONSTRAINT PK_Jobs_JobID PRIMARY KEY(JobID)
	, CONSTRAINT CHK_Jobs_MinSalary CHECK(Maxsalary >= 8000)
	, CONSTRAINT CHK_Jobs_MaxSalary CHECK(Maxsalary <= 25000)
)

CREATE TABLE Departments(
	DepartmentID INT IDENTITY(1,1)
	, DepartmentName VARCHAR(20)
	, ManagerID INT
	, LocationID INT 
	, CONSTRAINT PK_Departments PRIMARY KEY(DepartmentID)
)

CREATE TABLE Employees(
	EmployeeId INT IDENTITY(1,1)
	, FirstName VARCHAR(20) NOT NULL
	, LastName VARCHAR(20) NOT NULL
	, Email VARCHAR(50)  NOT NULL
	, PhoneNumber NUMERIC(10) NOT NULL
	, HireDate DATE NOT NULL
	, JobID INT  NOT NULL
	, Salary MONEY  NOT NULL
	, Commission MONEY
	, ManagerID INT  
	, DepartmentID INT  NOT NULL
	, CONSTRAINT PK_Employees PRIMARY KEY(EmployeeId,ManagerID,DepartmentID)
	, CONSTRAINT FK_Employees_Jobs FOREIGN KEY(JobID) REFERENCES Jobs(JobID)
	, CONSTRAINT FK_Employees_Departments FOREIGN KEY(DepartmentID) REFERENCES Departments(DepartmentID)
	, CONSTRAINT UQ_Employees_EmployeeID UNIQUE(EmployeeId)
)
