USE Day1_SQL

--1) Write a SQL statement to create a table named countries including columns CountryId, CountryName and RegionId 
--   and make sure that no countries except Italy, India and China will be entered in the table. 
--   and combination of columns CountryId and RegionId will be unique.


CREATE TABLE Countries 
(
	CountryId INT PRIMARY KEY IDENTITY(1,1),
	CountryName VARCHAR(20) NOT NULL CONSTRAINT coun_name CHECK (CountryName IN ('Italy','India','China')),
	RegionId INT NOT NULL UNIQUE
)

INSERT INTO Countries VALUES ('India',10);
INSERT INTO Countries VALUES ('Italy',20), ('China',30)

SELECT * FROM Countries


--2) Write a SQL statement to create a table named JobHistory including columns 
--   EmployeeId, StartDate, End_Eate, Job_Id and Department_Id and make sure that the 
--   value against column EndDate will be entered at the time of insertion to the format like ‘--/--/----‘.


CREATE TABLE JobHistory
(
	EmployeeId INT PRIMARY KEY IDENTITY(1,1),
	StartDate DATE NOT NULL,
	End_Date VARCHAR(10) CONSTRAINT chk_endDate CHECK(End_Date LIKE '__/__/____'),
	Job_Id INT NOT NULL,
	Department_Id INT NOT NULL
)

INSERT INTO JobHistory VALUES ('02/08/2021','03/08/2021',5,10)

SELECT * FROM JobHistory


--3) Write a SQL statement to create a table named jobs including columns 
--   JobId, JobTitle, MinSalary and MaxSalary, and make sure that, the default value 
--   for JobTitle is blank and MinSalary is 8000 and MaxSalary is NULL will be entered automatically 
--   at the time of insertion if no value assigned for the specified columns.


CREATE TABLE Jobs 
(
	JobId INT PRIMARY KEY IDENTITY(1,1),
	JobTitle VARCHAR(20) NOT NULL DEFAULT '',
	MinSalary DECIMAL(5,0) DEFAULT 8000,
	MaxSalary DECIMAL(5,0) DEFAULT NULL
)

INSERT INTO Jobs (JobTitle) VALUES ('Developer')
INSERT INTO Jobs (MinSalary) VALUES (25000)

SELECT * FROM Jobs


--4) Write a SQL statement to create a table employees including columns 
--   Employee_Id, FirstName, LastName, Email, PhoneNumber, Hire_Date, Job_Id, Salary, Commission, Manager_Id and Department_Id 
--   and make sure that, the Employee_Id column does not contain any duplicate value at the time of insertion, and the 
--   foreign key column DepartmentId, reference by the column DepartmentId of Departments table, can contain only those values 
--   which are exists in the Department table and another foreign key column JobId, referenced by the column JobId of jobs table, 
--   can contain only those values which are exists in the jobs table.


CREATE TABLE Department 
(
	Department_Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Department_Name VARCHAR(20) NOT NULL
)

INSERT INTO Department VALUES ('Development')
SELECT * FROM Department

CREATE TABLE Employees
(
	Employee_Id INT PRIMARY,
	First_Name VARCHAR(20) NOT NULL,
	Last_Name VARCHAR(20) NOT NULL,
	Email VARCHAR(15) ,
	Phone_Number DECIMAL(10,0) NOT NULL,
	Hire_Date DATE ,
	Job_Id INT NOT NULL ,
	Salary DECIMAL(6,0) ,
	Commission DECIMAL(5,0),
	Manager_Id DECIMAL(6,0) NOT NULL,
	Department_Id INT NOT NULL,
	CONSTRAINT chk_Email CHECK(Email LIKE '%__@_%.com'),
	CONSTRAINT chk_PhoneNumber CHECK(Phone_Number LIKE '[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	CONSTRAINT chk_JobId FOREIGN KEY(Job_Id) REFERENCES Jobs(JobId),
	CONSTRAINT chk_DepartmentId FOREIGN KEY(Department_Id) REFERENCES Department(Department_Id)
)

INSERT INTO Employees (Employee_Id,First_Name,Last_Name,Phone_Number,Job_Id,Manager_Id,Department_Id) 
VALUES (1,'Preet','Gandhi','3857383658',1,1,1)

SELECT * FROM Employees


--ALTER TABLE

--1) Write a SQL statement to add a foreign key constraint named fk_job_id on JobId column of JobHistory table 
--   referencing to the primary key JobId of jobs table.

ALTER TABLE JobHistory ADD CONSTRAINT fk_job_id FOREIGN KEY(Job_Id) REFERENCES Jobs(JobId)

--2)Write a SQL statement to drop the existing foreign key fk_job_id from JobHistory table on JobId column 
--  which is referencing to the JobId of jobs table.

ALTER TABLE JobHistory DROP CONSTRAINT fk_job_id

--3)Write a SQL statement to add a new column named location to the JobHistory table.

ALTER TABLE JobHistory ADD Location VARCHAR(20)


