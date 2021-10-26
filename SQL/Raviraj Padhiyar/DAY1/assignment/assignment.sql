CREATE DATABASE CarSalesDB

USE CarSalesDB

CREATE TABLE Employees (
	EmployeeID INT PRIMARY KEY IDENTITY(1,1),
	FirstName VARCHAR(10) NOT NULL,
	LASTNAME VARCHAR(10) NOT NULL,
	Email VARCHAR(20) UNIQUE CONSTRAINT chkEmail CHECK(Email LIKE '%@%.___'),
	PhoneNumber NUMERIC(10) UNIQUE CONSTRAINT ckPhoneNumber CHECK(PhoneNumber BETWEEN 1000000000 AND 9999999999),
	Salary MONEY NOT NULL
)

INSERT INTO Employees 
VALUES ('Raviraj','Padhiayar','rvrjpdhr@gmail.com',9265914306,10000),
('Sagar','Padhiayar','sg.pdhr@gmail.com',9265914307,12000),
('Yuvraj','Padhiyar','uv.pdhr@gmail.com',9265914308,8000)

SELECT * FROM Employees

CREATE TABLE Inventory(
	ItemID INT PRIMARY KEY IDENTITY(1,1),
	ItemName VARCHAR(20) NOT NULL,
	ItemQty INT NOT NULL,
)

ALTER TABLE Inventory
ADD Price INT NOT NULL

INSERT INTO Inventory
Values('i10',5,30000),
('i20',10,40000),
('verna',7,50000),
('creta',10,45000)

SELECT * FROM Inventory

CREATE TABLE Sales (
	Sno INT PRIMARY KEY IDENTITY (1,1),
	CustomerID INT UNIQUE,
	CustomerName VARCHAR(10) NOT NULL,
	EmployeeID INT CONSTRAINT fkEmpID FOREIGN KEY REFERENCES dbo.Employees(EmployeeID),
	ItemID INT CONSTRAINT fkItemID FOREIGN KEY REFERENCES dbo.Inventory(ItemID),
	SalesQty INT NOT NULL
)

INSERT INTO Sales
VALUES(1,'Rahul',3,2,1),
(2,'Abhi',1,4,2),
(3,'Mohil',2,1,1)

SELECT * FROM Sales



