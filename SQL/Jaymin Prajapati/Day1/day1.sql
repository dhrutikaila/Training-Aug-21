use newDB


CREATE TABLE B_Employee (
Employee_Id INT PRIMARY KEY IDENTITY(1,1),
FirstName VARCHAR(10) NOT NULL,
LastName VARCHAR(10) NOT NULL,
Email VARCHAR(20) UNIQUE CONSTRAINT ckEmail CHECK (Email LIKE '%@%.___') ,
PhoneNumber NUMERIC(10) UNIQUE CONSTRAINT ckMobile CHECK (PhoneNumber BETWEEN 1000000000 AND 9999999999),
Salary MONEY NOT NULL,
)
CREATE TABLE Inventory(
Item_id INT PRIMARY KEY IDENTITY (1,1),
Item_Name VARCHAR(15) NOT NULL,
Item_qty INT NOT NULL
)
CREATE TABLE sales(
srno INT PRIMARY KEY IDENTITY (1,1) ,
EmployeeNo INT CONSTRAINT emp_fkForeig REFERENCES B_Employee(Employee_Id) on update NO ACTION,
ItemNo INT CONSTRAINT item_fkForeig REFERENCES Inventory(Item_id) on update NO ACTION,
SaleQty INT NOT NULL
)
INSERT INTO B_Employee VALUES ('SHREE','THAKKAR','shreDa@gmail.com','9988556622',1000)
INSERT INTO B_Employee VALUES ('JAY','Mahajan','JAY@ymail.com','9998565457',2000)
INSERT INTO B_Employee VALUES ('RAJ','hsdgjs','RAJ@gmail.com','6352012345',3000)
INSERT INTO Inventory VALUES ('I 20',100)
INSERT INTO Inventory VALUES ('VERNA',50)
INSERT INTO Inventory VALUES ('SWIFT',30)
INSERT INTO sales VALUES (1,1,20)
INSERT INTO sales VALUES (2,2,30)
INSERT INTO sales VALUES (2,3,10)
select * from B_Employee
select * from Inventory
select * from sales
