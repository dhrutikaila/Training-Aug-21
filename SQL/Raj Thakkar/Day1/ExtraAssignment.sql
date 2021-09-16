--You have been hired to create a relational database to support a car sales business. 
--You need to store information on the business’s employees, inventory, and completed sales.
--You also need to account for the fact that each salesperson receives a different percentage of their sales in commission. 
--What tables and columns would you create in your relational database, and how would you link the tables?

CREATE TABLE Employees
(
Employee_Id INT PRIMARY KEY IDENTITY(1,1),
FirstName VARCHAR(30) NOT NULL,
LastName VARCHAR(30) NOT NULL,
Email VARCHAR(100) CONSTRAINT Chk_Email CHECK(Email LIKE '%__@_%.com') UNIQUE,
PhoneNumber VARCHAR(10) NOT NULL CONSTRAINT Chk_Number CHECK(PhoneNumber LIKE '[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
Hire_Date DATE NOT NULL,
Salary MONEY,
Commission INT,
)

CREATE TABLE Inventory
(
Car_Id INT PRIMARY KEY IDENTITY(1,1),
Model_Name VARCHAR(50),
Price MONEY NOT NULL,
)

CREATE TABLE Sales
(
    Sales_Id INT PRIMARY KEY IDENTITY(1,1),
	Employee_Id  INT CONSTRAINT FK_Employee_Id FOREIGN KEY (Employee_Id) REFERENCES Employees(Employee_Id),
	Car_Id INT CONSTRAINT FK_CAR_Id FOREIGN KEY REFERENCES Inventory(Car_Id),
	Sales_Date DATE NOT NULL,
	SalesQty INT NOT NULL,

)



SELECT * INTO Comission FROM 
(
SELECT SUM(Sales.SalesQty) AS Total_sale
,      Employee_Id
,      ComissionTab=SUM(Sales.SalesQty)*0.10
FROM Sales
)C

