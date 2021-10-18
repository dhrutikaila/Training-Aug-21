--- First 

CREATE DATABASE Practical

USE Practical

CREATE TABLE Contries(
	CountryId INT NOT NULL, 
	CountryName VARCHAR(50) NOT NULL CHECK(CountryName IN('Italy', 'India', 'China')),
	RegionId INT NOT NULL,
	CONSTRAINT CK_CR PRIMARY KEY(CountryId,RegionId)
)

SELECT * FROM Contries

INSERT INTO Contries VALUES(2,'India',2)

--- First/ Differnce between 2 tables

CREATE TABLE Contry(
	CountryId INT NOT NULL, 
	CountryName VARCHAR(50) NOT NULL CHECK(CountryName IN('Italy', 'India', 'China')),
	RegionId INT NOT NULL
)
INSERT INTO Contry VALUES(2,'India',2)
SELECT * FROM Contry



--- Second 
CREATE TABLE JobHistory(
	EmployeeId INT NOT NULL, 
	StartDate DATE NOT NULL,
	End_Date DATE NOT NULL,
	Job_Id INT NOT NULL,
	Department_Id INT NOT NULL
)

Alter TABLE JobHistory
ADD CONSTRAINT chk_date CHECK(END_DATE >= Startdate)

INSERT INTO JobHistory VALUES(1,'10/08/2021','09/08/2021',1,1)

SELECT * FROM JobHistory

TRUNCATE TABLE JobHistory


--- Third

CREATE TABLE Jobs(
	JobId INT NOT NULL CONSTRAINT  pk_job PRIMARY KEY IDENTITY(1,1), 
	JobTitle VARCHAR(50) DEFAULT '',
	MinSalary MONEY DEFAULT 8000 CONSTRAINT chk_min_sal CHECK(MinSalary >= 8000),
	MaxSalary MONEY DEFAULT 8000
)

INSERT INTO Jobs (JobTitle) VALUES('job-3')
INSERT INTO Jobs (MinSalary) VALUES(10000)

SELECT * FROM Jobs

DROP TABLE Jobs


--- Fourth

CREATE TABLE Departments(
	DepartmentId INT NOT NULL CONSTRAINT PK_dpt PRIMARY KEY IDENTITY(1,1), 
	Dept_Name VARCHAR(30)
)

INSERT INTO Departments VALUES('HR')
INSERT INTO Departments VALUES('Accounts')
INSERT INTO Departments VALUES('Development')
INSERT INTO Departments VALUES('Designing')

SELECT * FROM Departments

CREATE TABLE Employees(
	Employee_Id INT NOT NULL CONSTRAINT PK_dpt_id PRIMARY KEY IDENTITY(1,1), 
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	Email VARCHAR(255) NOT NULL CONSTRAINT UQ_Email UNIQUE CONSTRAINT chk_email CHECK(Email LIKE '%_@__%.__%'),
	PhoneNumber NUMERIC(10) NOT NULL CONSTRAINT CHK_Number CHECK(PhoneNumber BETWEEN 1000000000 AND 9999999999),
	Hire_Date DATE NOT NULL,
	Job_Id INT NOT NULL,
	Salary MONEY NOT NULL,
	Commission VARCHAR(30) NOT NULL,
	Department_Id INT NOT NULL,
	CONSTRAINT FK_Job_emp FOREIGN KEY (Job_Id) REFERENCES Jobs(JobId) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FK_dpt_emp FOREIGN KEY (Department_Id) REFERENCES Departments(DepartmentId) ON DELETE CASCADE ON UPDATE CASCADE
)

SELECT * FROM Employees


