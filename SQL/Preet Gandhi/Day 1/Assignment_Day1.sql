USE Day1_SQL

--You have been hired to create a relational database to support a car sales business. 
--You need to store information on the business’s employees, inventory, and completed sales. 
--You also need to account for the fact that each salesperson receives a different percentage of their sales in commission. 
--What tables and columns would you create in your relational database, and how would you link the tables?


CREATE TABLE Employee
(
	EmpId INT PRIMARY KEY IDENTITY(1,1),
	EmpName VARCHAR(20) NOT NULL,
	Email VARCHAR(25) ,
	EmpPhone NUMERIC(10) NOT NULL,
	EmpSalary NUMERIC(7) NOT NULL,
	EmpAge TINYINT,
	CONSTRAINT chk_mail CHECK(Email LIKE '%__@_%.com'),
	CONSTRAINT chk_phone CHECK ( EmpPhone LIKE '[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)


CREATE TABLE Inventory
(
	CarId INT PRIMARY KEY IDENTITY(1,1),
	CarName VARCHAR(20) NOT NULL,
	CarPrice DECIMAL(10,2)
)

CREATE TABLE Sales
(
	SaleId INT PRIMARY KEY IDENTITY(1,1),
	SaleQuantity INT,
	Emp_Id INT NOT NULL ,
	Car_Id INT NOT NULL,
	EmpCommision NUMERIC(5) DEFAULT NULL,
	CONSTRAINT chk_saleEmp FOREIGN KEY(Emp_Id) REFERENCES Employee(EmpId) ON UPDATE CASCADE,
	CONSTRAINT chk_SaleCar FOREIGN KEY(Car_Id) REFERENCES Inventory(CarId) ON UPDATE CASCADE
)



INSERT INTO Employee VALUES ('Dhaval', 'dhaval@gmail.com', 9375577497, 25000, 25), ('Jay', 'jay@gmail.com', 9463758497, 20000, 27)
SELECT * FROM Employee

INSERT INTO Inventory VALUES ('Car',500000), ('Bike',100000)
SELECT * FROM Inventory

INSERT INTO Sales VALUES (2,1,1,5000), (1,2,2,2500)
SELECT * FROM Sales