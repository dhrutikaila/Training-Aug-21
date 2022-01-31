--You have been hired to create a relational database to support a car sales business. You need to store information on the business’s employees, inventory, and completed sales. You also need to account for the fact that each salesperson receives a different percentage of their sales in commission. What tables and columns would you create in your relational database, and how would you link the tables?

CREATE TABLE Inventory(
ProductId INT PRIMARY KEY Identity(1,1),
ProdName VARCHAR(50) NOT NULL,
ProdPrice DECIMAL(8,2) NOT NULL,
);
CREATE TABLE Sales(
SalesId INT PRIMARY KEY Identity(1,1),
SalesPerson INT NOT NULL,
ProductId INT NOT NULL,
SaleDate DATE NOT NULL,
CONSTRAINT FK_SalesPerson FOREIGN KEY (SalesPerson) REFERENCES Employee(EmployeeId),
CONSTRAINT FK_ItemId FOREIGN KEY (ProductId) REFERENCES Inventory(ProductId),
);
CREATE TABLE Employee(
EmployeeId INT PRIMARY KEY Identity(1,1), 
EmpName VARCHAR(50) NOT NULL,
EmpLastName VARCHAR(50) NOT NULL,
EmpType VARCHAR(10) NOT NULL,
Email VARCHAR(50) CONSTRAINT ckEmail CHECK(Email LIKE '_%@__%.__%'),
CommisionPer DECIMAL(4,2) NULL
);
INSERT INTO Inventory VALUES ('Audi',835689.00),('TATA',296588.00),('Hyundai',895672.00),('Suzuki',589742.00),('Tesla',85285);

INSERT INTO Employee VALUES ('dhruvit','diyora','Sales',12.20),('leo','messi','Manager',10.00),('sergio','ramos','marketing',2.20),('kylian','mbappe','Sales',12.20);

INSERT INTO Sales VALUES (2,3),(2,2),(3,2),(2,5);