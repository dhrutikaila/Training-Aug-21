
/*You have been hired to create a relational database to support a car sales business. 
You need to store information on the business’s employees, inventory, and completed sales.
You also need to account for the fact that each salesperson receives a different percentage of their 
sales in commission. What tables and columns would you create in your relational database,
and how would you link the tables?*/

CREATE DATABASE Assignment1

USE Assignment1

CREATE TABLE Employee
(
 EmployeeId int CONSTRAINT PkEmpId PRIMARY KEY IDENTITY(1,1),
 EmployeeName varchar(50) CONSTRAINT EmpNmNotNull NOT NULL
 );

ALTER TABLE Employee CHANGE COLUMN EmploeeName TO EmployeeName;

 CREATE TABLE Inventory
 (
 CarId int CONSTRAINT PkCarId PRIMARY KEY IDENTITY(1,1),
 CarName varchar(25) CONSTRAINT CarNmNotNull NOT NULL,
 Company varchar(25) CONSTRAINT CompanyNotNull NOT NULL
 );

 CREATE TABLE Sales
 (
 SaleId int CONSTRAINT PkSaleId PRIMARY KEY IDENTITY(1,1),
 Emp_ID int CONSTRAINT FkEmp_ID FOREIGN KEY REFERENCES Employee(EmployeeId) ON DELETE SET NULL ON UPDATE CASCADE,
 Car_ID int CONSTRAINT FkCar_ID FOREIGN KEY REFERENCES Inventory(CarId) ON DELETE SET NULL ON UPDATE CASCADE
 );

 CREATE TABLE Commission
 (
 CommissionId int CONSTRAINT PkCommissionId PRIMARY KEY IDENTITY(1,1),
 Commission int CONSTRAINT DefCommissionNull DEFAULT NULL
 );


 INSERT INTO Employee VALUES ('Vishal'),('Himmat'),('Arjun'),('Haresh'),('Pankaj');

 INSERT INTO Inventory VALUES ('Carnival','KIA'),('Balleno','MarutiSuzuki'),('Sonet','KIA'),('Innova','Toyota'),('Nexon','TATA');

 SELECT * FROM Employee;
 SELECT * FROM Inventory;

 INSERT INTO Sales VALUES (1,2),(2,3),(3,1),(4,5),(5,4),(4,2),(3,3),(3,5),(1,4),(1,1),(5,1),(5,2),(2,5),(2,4),(1,4),(1,3),(5,4),(5,2),(3,4);

 DECLARE @var1 int;
 SET @var1 = 1;
 WHILE @var1<6
 BEGIN;
 INSERT INTO Commission(Commission) SELECT COUNT(Emp_ID)*500 FROM Sales WHERE Emp_ID=@var1;
 SET @var1 = @var1 +1;
 END;


 SELECT * FROM Employee;
 SELECT * FROM Inventory;
 SELECT * FROM Sales;
 SELECT * FROM Commission;
 SELECT e.EmployeeId, e.EmployeeName , c.Commission FROM Employee AS e JOIN Commission AS c ON e.EmployeeId=c.CommissionId;
