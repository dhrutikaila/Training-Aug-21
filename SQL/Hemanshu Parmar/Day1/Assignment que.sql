Task:
You have been hired to create a relational database to support a car sales business. You need to store information on the business’s employees, inventory, and completed sales. You also need to account for the fact that each salesperson receives a different percentage of their sales in commission. What tables and columns would you create in your relational database, and how would you link the tables?

Soln:

create table Inventory(
ProductId INT PRIMARY KEY Identity(1,1),
ProdName varchar(30) NOT NULL,
ProdPrice decimal(8,2) NOT NULL,

)
create table Sales(
SalesId INT PRIMARY KEY Identity(1,1),
SalesPerson int NOT NULL,
ProductId int NOT NULL,
SaleDate date NOT NULL,
CONSTRAINT FK_SalesPerson FOREIGN KEY (SalesPerson) REFERENCES Employee(EmployeeId),
CONSTRAINT FK_ItemId FOREIGN KEY (ProductId) REFERENCES Inventory(ProductId),
)
create table Employee(
EmployeeId INT PRIMARY KEY Identity(1,1), 
EmpName varchar(30) NOT NULL,
EmpLastName varchar(30) NOT NULL,
EmpType varchar(10) NOT NULL,
Email varchar(50) CONSTRAINT check_Email CHECK(Email LIKE '_%@__%.__%'),
CommisionPer decimal(4,2) NULL
)

insert into Inventory values ('Audi',835689.00),('TATA',296588.00),('Hyundai',895672.00),('Suzuki',589742.00),('Tesla',85285)

insert into Employee values ('Hemanshu','Parmar','Sales',14.20),('Hemant','Patel','Manager',10.00),('Shubh','Patel','marketing',6.20),('Denish','Richhie','Sales',12.20)

insert into Sales values(1,001,2021-08-05),(2,002,2021-07-05)