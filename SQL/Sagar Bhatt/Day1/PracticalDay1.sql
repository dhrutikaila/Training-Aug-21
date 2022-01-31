CREATE DATABASE Day1
USE Day1
--DROP DATABASE Day1

--Practical 1
CREATE TABLE Countries(
	CountryId INT NOT NULL,
	CountryName VARCHAR(20) NOT NULL CONSTRAINT CHK_Countries_CountryName CHECK(CountryName IN('Italy', 'India', 'China')),
	RegionId INT NOT NULL,
	CONSTRAINT PK_Countries PRIMARY KEY(CountryId, RegionId),
)

INSERT INTO Countries(CountryId, CountryName, RegionId) VALUES(1, 'India', 1)
INSERT INTO Countries(CountryId, CountryName, RegionId) VALUES(1, 'India', 2)

SELECT CountryId, CountryName, RegionId FROM Countries
--DROP TABLE Countries

--Practical 2
CREATE TABLE JobHistory(
	EmployeeId INT CONSTRAINT PK_JobHistory PRIMARY KEY IDENTITY(1,1),
	StartDate DATE NOT NULL,
	End_Eate DATE NOT NULL,
	Job_Id INT NOT NULL,
	Department_Id INT NOT NULL,
)

INSERT INTO JobHistory(StartDate, End_Eate, Job_Id, Department_Id) VALUES('1-1-1998', '1-9-1998', 1, 1)

SELECT EmployeeId, FORMAT(StartDate, 'dd-MM-yyyy'), DATENAME(dd, End_Eate) + SPACE(1) + DATENAME(MM, End_Eate) + DATENAME(yyyy, End_Eate), Job_Id, Department_Id from JobHistory

--Practical 3

CREATE TABLE Jobs(
	JobId INT CONSTRAINT PK_Jobs PRIMARY KEY IDENTITY(1,1),
	JobTitle VARCHAR(20) CONSTRAINT DF_Jobs_JobTitle DEFAULT '',
	MinSalary MONEY CONSTRAINT DF_Jobs_MinSalary DEFAULT 8000 CONSTRAINT CHK_Jobs_MinSalary CHECK (MinSalary >= 8000),
	MaxSalary MONEY CONSTRAINT DF_Jobs_MaxSalary DEFAULT 8000,
)

INSERT INTO Jobs(JobTitle, MinSalary, MaxSalary) VALUES('Developer', 8000, 8000)

SELECT * FROM Jobs

--Practical 4

CREATE TABLE Departments(
	DepartmentId INT NOT NULL CONSTRAINT PK_Departments_DepartmentId PRIMARY KEY IDENTITY(1,1),
	Dept_Name VARCHAR(20)
)

INSERT INTO Departments VALUES('HR')
INSERT INTO Departments VALUES('Accounts')
INSERT INTO Departments VALUES('Development')
INSERT INTO Departments VALUES('Designing')

SELECT * FROM Departments

CREATE TABLE Employees(
	Employee_Id INT NOT NULL CONSTRAINT PK_Employees_EmployeeId PRIMARY KEY IDENTITY(1,1),
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	Email VARCHAR(255) NOT NULL CONSTRAINT UQ_Employees_Email UNIQUE CONSTRAINT chk_email CHECK(Email LIKE '%_@__%.__%'),
	PhoneNumber NUMERIC(10) NOT NULL CONSTRAINT CHK_Employees_PhoneNumber CHECK(PhoneNumber BETWEEN 1000000000 AND 9999999999),
	Hire_Date DATE NOT NULL,
	Job_Id INT NOT NULL,
	Salary MONEY NOT NULL,
	Commission VARCHAR(30) NOT NULL,
	Department_Id INT NOT NULL,
	CONSTRAINT FK_Jobs_Employees FOREIGN KEY (Job_Id) REFERENCES Jobs(JobId) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FK_Departments_Employees FOREIGN KEY (Department_Id) REFERENCES Departments(DepartmentId) ON DELETE CASCADE ON UPDATE CASCADE
)

SELECT * FROM Employees

--Assignment

CREATE TABLE CarDepartments(
	DepartmentId INT NOT NULL CONSTRAINT PK_CarDepartments PRIMARY KEY IDENTITY(1,1),
	DepartmentName VARCHAR(20)
)
--DROP TABLE CarDepartments

INSERT INTO CarDepartments VALUES('Sales'),('Account')
SELECT * FROM CarDepartments

CREATE TABLE CarEmployees(
	EmployeeId INT NOT NULL CONSTRAINT PK_CarEmployees PRIMARY KEY IDENTITY(1,1),
	FirstName VARCHAR(20) NOT NULL,
	LastName VARCHAR(20) NOT NULL,
	Email VARCHAR(255) NOT NULL CONSTRAINT UQ_CarEmployees_Email UNIQUE CONSTRAINT CHK_CarEmployees_Email CHECK(Email LIKE '%_@__%.__%'),
	PhoneNumber VARCHAR(10) NOT NULL CONSTRAINT UQ_CarEmployees_PhoneNumber UNIQUE CONSTRAINT CHK_CarEmployees_PhoneNumber CHECK(PhoneNumber LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	JoinDate DATE NOT NULL,
	Salary MONEY NOT NULL,
	Commission VARCHAR(30),
	DepartmentId INT NOT NULL CONSTRAINT FK_CarDepartments_CarEmployees FOREIGN KEY (DepartmentId) REFERENCES CarDepartments(DepartmentId) ON DELETE CASCADE ON UPDATE CASCADE
)
--DROP TABLE CarEmployees

INSERT INTO CarEmployees(FirstName, LastName, Email, PhoneNumber, JoinDate, Salary, DepartmentId)
	VALUES('sagar', 'bhatt', 'bhattsagar112@gmail.com', '7600608432', '11-2-2021', 100000, 1),('harsh', 'bhatt', 'harshbhatt@gmail.com', '7600000100', '11-11-2008', 200000, 2)
SELECT * FROM CarEmployees

CREATE TABLE CarInventory(
	CarId INT NOT NULL CONSTRAINT PK_CarInventory PRIMARY KEY IDENTITY(1,1),
	CarBrand VARCHAR(30) NOT NULL,
	CarModel VARCHAR(50) NOT NULL,
	Price  MONEY NOT NULL,
	Stock INT NOT NULL
)
--DROP TABLE CarInvenotry

INSERT INTO CarInventory VALUES('BMW', 'BMW01', 1000000, 100), ('Audi', 'Audi01', 1000000, 100)
SELECT * FROM CarInventory

CREATE TABLE CarCustomer(
	CustomerId INT NOT NULL CONSTRAINT PK_CarCustomer PRIMARY KEY IDENTITY(1,1),
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	Email VARCHAR(255) NOT NULL CONSTRAINT UQ_CarCustomer_Email UNIQUE CONSTRAINT CHK_CarCustomer_Email CHECK(Email LIKE '%_@__%.__%'),
	PhoneNumber VARCHAR(10) NOT NULL CONSTRAINT CHK_CarCustomer_PhoneNumber CHECK(PhoneNumber LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
)
--DROP TABLE CarCustomer

INSERT INTO CarCustomer VALUES('Sagar', 'Bhatt', 'sagar@gmail.com', '7600608432'), ('Harsh', 'Bhatt', 'harsh@gmail.com', '7600000001')
SELECT * FROM CarCustomer

CREATE TABLE CarSales(
	SalesId INT NOT NULL CONSTRAINT PK_CarSales PRIMARY KEY IDENTITY(1,1),
	EmployeeId  INT NOT NULL CONSTRAINT FK_CarEmployees_CarSales FOREIGN KEY (EmployeeId) REFERENCES CarEmployees(EmployeeId) ON DELETE CASCADE ON UPDATE CASCADE,
	CarId INT NOT NULL CONSTRAINT FK_CarInventory_CarSales FOREIGN KEY (CarId) REFERENCES CarInventory(CarId) ON DELETE CASCADE ON UPDATE CASCADE,
	CustomerId INT NOT NULL CONSTRAINT FK_CarCustomer_CarSales FOREIGN KEY (CustomerId) REFERENCES CarCustomer(CustomerId) ON DELETE CASCADE ON UPDATE CASCADE,
	SoldOn Date NOT NULL,
)
--DROP TABLE CarSales
--SP_HELP CarSales

INSERT INTO CarSales VALUES(1, 1, 1, '10-08-2021')
SELECT * FROM CarSales
