/*You have been hired to create a relational database to support a car sales business. You need to store information on the business’s 
employees, inventory, and completed sales. You also need to account for the fact that each salesperson receives a different percentage of 
their sales in commission. What tables and columns would you create in your relational database, and how would you link the tables? */



CREATE TABLE Employees
(
	EmployeeId INT PRIMARY KEY,
	FirstName VARCHAR(20) NOT NULL,
	Emp_LastName VARCHAR(20) NOT NULL,
	Emp_MiddleName VARCHAR(20) NOT NULL,
	Email VARCHAR(30) DEFAULT NULL UNIQUE CONSTRAINT Ck_Email CHECK (Email LIKE '%@%.___'),
	PhoneNumber DECIMAL(10) NOT NULL UNIQUE CONSTRAINT Ck_Phone CHECK (PhoneNumber BETWEEN 1000000000 AND 9999999999),
	HireDate DATE NOT NULL,
	Salary DECIMAL(10,2) NOT NULL,

)

CREATE TABLE Carsale
(
	SaleId INT PRIMARY KEY,
	Commission int,
	EmployeeId INT  FOREIGN KEY (EmployeeId)
	REFERENCES Employees(EmployeeId),
	
	Carid INT FOREIGN KEY (Carid)
	REFERENCES Carinfo(Carid)
	
)

CREATE TABLE Carinfo
(
	Carid INT PRIMARY KEY,
	Company_name varchar(55),
	Company_model varchar(55),
	price int
)


