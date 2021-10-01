CREATE DATABASE testDB

USE testDB

CREATE TABLE countries(
	CountryId varchar(10) NOT NULL,
	RegionID INT NOT NULL,
	PRIMARY KEY(CountryID,RegionID),
	CountryName varchar(20) NOT NULL CONSTRAINT chkCountryName CHECK (CountryName IN ('China','India','Italy'))
)

INSERT INTO countries (CountryId, CountryName,RegionID)
VALUES ('IND','India',1),
('CHN','China',2),
('ILY','Italy',3),
('IND','India',4)

SELECT * FROM countries


CREATE TABLE JobHistory (
	EmployeeID INT NOT NULL PRIMARY KEY,
	StartDate date NOT NULL,
	EndDate varchar(10) CONSTRAINT chkEndDate CHECK (EndDate like '__/__/____'),
	JobID int NOT NULL,
	DepartmentID int 
)

INSERT INTO JobHistory
VALUES(1,'2021-08-15','15/02/2024',1,1)

SELECT * FROM JobHistory

CREATE TABLE Jobs (
	JobID INT PRIMARY KEY IDENTITY(1,1),
	JobTitle varchar(40) DEFAULT '',
	MinSalary int DEFAULT 8000,
	MaxSalary int DEFAULT NULL
)


INSERT INTO Jobs (JobTitle) values('Trainee')
INSERT INTO Jobs (JobTItle,MinSalary)
VALUES ('NodeJs Developer',10000),
('Java Developer',20000),
('dotnet Developer', 8000)

SELECT * FROM Jobs

CREATE TABLE Departments(
	DepartmentID int PRIMARY KEY IDENTITY(1,1),
	DepartmentName varchar(40)
)

INSERT INTO Departments
Values('Nodejs Developer'),
('Java Developer'),
('DotNet Developer')

SELECT * FROM Departments

CREATE TABLE employees (
	Employee_id INT PRIMARY KEY IDENTITY(1,1),
	FirstName varchar(40),
	Lastname varchar(40),
	Email varchar(40) UNIQUE CONSTRAINT chkEmail CHECK(Email LIKE '%@%.___'),
	PhoneNumber NUMERIC(10) UNIQUE CONSTRAINT chkPhoneNumber CHECK (PhoneNumber BETWEEN 1000000000 AND 9999999999),
	Hire_Date DATE,
	JobID INT,
	Salary MONEY,
	Commission INT,
	Manager_ID INT,
	Department_ID INT
)

INSERT INTO employees 
VALUES ('Raviraj','Padhiyar','rvrjpdhr@gmail.com',9265914306,'2021-08-15',1,20000,2000,1,1)

SELECT * FROM employees