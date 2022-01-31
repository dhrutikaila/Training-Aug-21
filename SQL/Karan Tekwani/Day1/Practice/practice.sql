CREATE DATABASE TRAINING

/* 1. Write a SQL statement to create a table named countries including columns CountryId, 
CountryName and RegionId and make sure that no countries except Italy, India and China will be 
-entered in the table. and combination of columns CountryId and RegionId will be unique.*/

CREATE TABLE countries
(
		CountryId int NOT NULL, 
		CountryName char(20) NOT NULL CHECK (CountryName IN ('Italy','India','China ')),
		RegionId varchar(8) NOT NULL,
		CONSTRAINT country_region_unique UNIQUE(RegionId,CountryName)
)	

/*2.  Write a SQL statement to create a table named JobHistory including columns EmployeeId, 
StartDate, End_Eate, Job_Id and Department_Id and make sure that the value against column 
EndDate will be entered at the time of insertion to the format like ‘–/–/—-‘.   */

CREATE TABLE JobHistory
(
	EmployeeId int PRIMARY KEY NOT NULL,
	StartDate date NOT NULL,
	End_Date date NOT NULL,
	Job_Id int NOT NULL UNIQUE,
	Department_Id int NOT NULL ,
)

/*3.  Write a SQL statement to create a table named jobs including columns JobId,
JobTitle, MinSalary and MaxSalary, and make sure that, the default value for JobTitle 
is blank and MinSalary is 8000 and MaxSalary is NULL will be entered automatically at the time of 
insertion if no value assigned for the specified columns.  */

CREATE TABLE jobs 
(
	JobId int NOT NULL PRIMARY KEY,
	JobTitle char(50) DEFAULT '',
	MinSalary numeric(7) DEFAULT '8000',
	MaxSalary numeric(7) DEFAULT NULL
)

/* 4.  Write a SQL statement to create a table employees including columns Employee_Id, FirstName, 
LastName, Email, PhoneNumber, Hire_Date, Job_Id, Salary, Commission, Manager_Id and Department_Id and
make sure that, the Employee_Id column does not contain any duplicate value at the time of insertion, 
and the foreign key column DepartmentId, reference by the column DepartmentId of Departments table, can 
contain only those values which are exists in the Department table and another foreign key column JobId, 
referenced by the column JobId of jobs table, can contain only those values which are exists in the jobs 
table.  */

CREATE TABLE employees 
(
	Employee_Id int PRIMARY KEY,
	FirstName char(20),
	LastName char(20),
	Email varchar(70),
	PhoneNumber numeric(10),
	Hire_Date date,
	Job_Id int NOT NULL UNIQUE FOREIGN KEY REFERENCES jobs_employee(JobId),
	Salary numeric(7),
	Commission numeric(7),
	Manager_Id int ,
	Department_Id int NOT NULL FOREIGN KEY REFERENCES Departments(DepartmentId),
)
