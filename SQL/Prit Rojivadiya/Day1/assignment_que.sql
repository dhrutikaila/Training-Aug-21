/*
You have been hired to create a relational database to support a car sales business. You need to store information 
on the business’s employees, inventory, and completed sales. You also need to account for the fact that each salesperson 
receives a different percentage of their sales in commission. What tables and columns would you create in your relational 
database, and how would you link the tables?
*/

use demo;

CREATE TABLE Employees (
EmployeeID int not null PRIMARY KEY IDENTITY (1,1),
FirstName varchar(20) not null,
LastName varchar(20) not null,
Phone Numeric(10) CONSTRAINT chk_num CHECK(Phone LIKE '[6-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
Email varchar(50) CONSTRAINT chk_mail CHECK(Email LIKE '%_@__%.__%'),
)


CREATE TABLE Cars(
CarId int not null PRIMARY KEY IDENTITY (1,1),
CarName varchar(15) not null,
CarModel varchar(15) not null,
CarPrice Money not null,
)


CREATE TABLE sales(
salesId int not null PRIMARY KEY IDENTITY (1,1) ,
EmployeeNo int CONSTRAINT emp_fk REFERENCES Employees(EmployeeID) ON UPDATE CASCADE ON DELETE CASCADE,
CarNo int CONSTRAINT car_fk REFERENCES Cars(CarId) ON UPDATE CASCADE ON DELETE CASCADE,
SaleQty int not null
)


CREATE TABLE Commision(
commisionId int not null PRIMARY KEY IDENTITY(1,1),
empID int CONSTRAINT empfk REFERENCES Employees(EmployeeID) ON UPDATE CASCADE ON DELETE CASCADE,
commision int DEFAULT null,
)


INSERT INTO Employees VALUES 
('Prit','Rojivadiya','9925973311','prit@gmail.com'),
('Man','Patel','9925983311','man@gmail.com'),
('Tirth','Mistry','9924973311','tirth@gmail.com');

INSERT INTO Cars VALUES 
('BMW','b1',1500000),
('Audi','a1',1700000),
('Kia','k1',1300000);

INSERT INTO sales VALUES 
(1,1,10),
(2,2,20),
(3,3,30);

INSERT INTO Commision(empID,commision) SELECT EmployeeNo,SUM(SaleQty)*5000 FROM sales GROUP BY EmployeeNo;

