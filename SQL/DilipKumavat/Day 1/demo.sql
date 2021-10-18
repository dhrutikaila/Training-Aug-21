CREATE DATABASE rxweb_DilipKumavat

USE rxweb_DilipKumavat

---practise 1---

CREATE TABLE Countries 
(
  CountryId INT PRIMARY KEY IDENTITY(1,1),
  CountryName VARCAHR(25) CONSTRAINT chk_country_name CHECK (CountryName IN ('India','China','Italy')) NOT NULL,
  RegionId INT NOT NULL
)

---practise 2---

CREATE TABLE JobHistory 
(
	EmployeeId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE CONSTRAINT chk_end_date CHECK (EndDate LIKE '--/--/----') NOT NULL,
	Job_Id INT NOT NULL,
	Department_Id INT NOT NULL
)

---practise 3---

CREATE TABLE Jobs 
(
  JobId INT PRIMARY KEY IDENTITY(1,1),
  JobTitle VARCHAR(10) DEFAULT '' NOT NULL,
  MinSalary DECIMAL(6,0) DEFAULT 8000,
  MaxSalary DECIMAL(7,0) DEFAULT NULL
)

---practise 4---

CREATE TABLE Employees
(
	EmployeeId INT PRIMARY KEY IDENTITY(1,1),
	FirstName VARCHAR(15) NOT NULL,
	LastName VARCHAR(15) NOT NULL,
	PhoneNumber NUMERIC(10),
	Email VARCHAR(25) DEFAULT NULL,
	Hire_Date DATE NOT NULL,
	JobId INT FOREIGN KEY REFERENCES Jobs(JobId),
	Salary NUMERIC NOT NULL,
	Commission NUMERIC DEFAULT NULL,
	DepartmentId INT FOREIGN KEY REFERENCES Department(DepartmentId)
)

CREATE TABLE Department 
(
	DepartmentId INT PRIMARYKEY IDENTITY(1,1) NOT NULL,
	DepartmentName VARCHAR(15) NOT NULL
)
