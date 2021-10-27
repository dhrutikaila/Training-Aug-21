CREATE TABLE B_Employee
(
Employee_Id INT PRIMARY KEY IDENTITY(1,1),
FirstName VARCHAR(10) NOT NULL,
LastName VARCHAR(10) NOT NULL,
Email VARCHAR(20) CONSTRAINT ckEmail CHECK (Email LIKE '%@%.___') ,
PhoneNumber NUMERIC(10) CONSTRAINT ckMobile CHECK (PhoneNumber BETWEEN 1000000000 AND 9999999999),
Salary MONEY NOT NULL,
)

CREATE TABLE Inventory
(
Item_id INT PRIMARY KEY IDENTITY (1,1),
Item_Name VARCHAR(15) NOT NULL,
Item_qty INT NOT NULL
)

CREATE TABLE sales
(
srno INT PRIMARY KEY IDENTITY (1,1) ,
EmployeeNo INT CONSTRAINT emp_fkForeig REFERENCES B_Employee(Employee_Id) on update NO ACTION,
ItemNo INT CONSTRAINT item_fkForeig REFERENCES Inventory(Item_id) on update NO ACTION,
SaleQty INT NOT NULL
)

SELECT * INTO Comission FROM 
(SELECT sum(sales.SaleQty) as TotalSale,B_Employee.Employee_Id ,comission=sum(sales.SaleQty)*0.1
from B_Employee , sales  WHERE B_Employee.Employee_Id=sales.EmployeeNo 
GROUP BY B_Employee.Employee_Id)com


INSERT INTO B_Employee VALUES ('SHREYA','THAKKAR','shreya@gmail.com','9870090990',100000)
INSERT INTO B_Employee VALUES ('dharal','patel','dharal@gmail.com','9870090990',200000)
INSERT INTO B_Employee VALUES ('bhavya','trivedi','bhavya@gmail.com','9870090990',30000)
INSERT INTO Inventory VALUES  ('Biscuit',100)
INSERT INTO Inventory VALUES  ('Maggi',50)
INSERT INTO Inventory VALUES  ('Atta noodles',30)
INSERT INTO sales VALUES (5,5,10)
INSERT INTO sales VALUES (1,5,20)
INSERT INTO sales VALUES (2,6,30)
SELECT * FROM Comission
SELECT * FROM B_Employee
SELECT * FROM Inventory
SELECT * FROM sales