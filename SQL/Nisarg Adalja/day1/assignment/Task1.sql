
CREATE DATABASE sqltraining;
USE sqltraining;
CREATE TABLE countries
(
CountryId INT NOT NULL,
CountryName VARCHAR(100) NOT NULL,
RegionId INT,
CONSTRAINT UC_Person UNIQUE (CountryId,RegionId),
CONSTRAINT chkCountryName CHECK (CountryName IN('Italy','India','China')).
);
CREATE TABLE countries(
CountryId INT UNIQUE,
CountryName VARCHAR(100) CHECK(CountryName IN('Italy','India','China')),
RegionId INT UNIQUE
);

/*
CREATE TABLE CUSTOMERS(
   ID   INT              NOT NULL,
   NAME VARCHAR (20)     NOT NULL,
   AGE  INT              NOT NULL CHECK (AGE >= 18),
   ADDRESS  CHAR (25) ,
   SALARY   DECIMAL (18, 2),       
   PRIMARY KEY (ID)
);*/
DROP TABLE jobhistory1;

CREATE TABLE JobHistory2(
EmployeeId INT PRIMARY KEY,
StartDate DATE,
End_date DATE,
Job_Id INT UNIQUE,
Department_Id INT UNIQUE
);
INSERT INTO JobHistory2 VALUES(6,'08-08-21','29-01-21',6,6);

CREATE TABLE  jobs(
JobId INT PRIMARY KEY,
JobTitle VARCHAR(100) DEFAULT "",
MinSalary INT DEFAULT 8000,
MaxSalary INT
);

CREATE TABLE Departments(
DepartmentId INT PRIMARY KEY,
DeaprtmentName VARCHAR(100)
);
CREATE TABLE employees(
Employee_Id INT PRIMARY KEY,
FirstName VARCHAR(200),
LastName VARCHAR(200),
Email VARCHAR(500),
PhoneNumber VARCHAR(10),
Hire_Date DATE,
Job_Id INT,
FOREIGN KEY(Job_Id) REFERENCES jobs(JobId),
Salary INT,
Commission INT,
manager_Id INT UNIQUE,
Department_Id INT,
FOREIGN KEY(Department_Id) REFERENCES Departments(DepartmentId)
);

ALTER TABLE jobhistory ADD CONSTRAINT fkjob1 FOREIGN KEY(Job_Id) REFERENCES jobs(JobId);

ALTER TABLE jobhistory
DROP CONSTRAINT fkjob;

ALTER TABLE JobHistory ADD COLUMN location INT;



CREATE TABLE EmployeesB
(
	EmployeeID INT PRIMARY KEY,
	Department VARCHAR(10) NOT NULL,
	FirstName VARCHAR(15) NOT NULL,
	LastName VARCHAR(15) NOT NULL,
	PhoneNo NUMERIC(10) NOT NULL,
	Email VARCHAR(50),
	JoiningDate DATE NOT NULL,
	Commission INT
)
CREATE TABLE Inventory
(
	CarID INT PRIMARY KEY,
	CarCompany VARCHAR(10),
	CarName VARCHAR(10) NOT NULL,
	Stock INT NOT NULL,
	MRP INT NOT NULL,
	Discount INT
);

CREATE TABLE Sales
(
	EmployeeID INT NOT NULL, 
	CarID INT NOT NULL,
	SaleID INT PRIMARY KEY,
	SaleDate DATE NOT NULL,
	SaleAmt INT NOT NULL,
	PaymentMethod VARCHAR(10) NOT NULL,
	CustomerName VARCHAR(30) NOT NULL,
	CONSTRAINT fk_CarID FOREIGN KEY(CarID) REFERENCES Inventory(CarID)
)
ALTER TABLE Sales
ADD CONSTRAINT fk_empid FOREIGN KEY (EmployeeID) REFERENCES EmployeesB(EmployeeID)
