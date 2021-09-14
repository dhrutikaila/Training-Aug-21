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
EmployeeNo INT CONSTRAINT emp_fkForeig REFERENCES B_Employee(Employee_Id) on UPDATE NO ACTION,
ItemNo INT CONSTRAINT item_fkForeig REFERENCES Inventory(Item_id) on UPDATE NO ACTION,
SaleQty INT NOT NULL
)


INSERT INTO B_Employee VALUES ('SHREYA','THAKKAR','shreya@gmail.com','9987690990',1000)
INSERT INTO B_Employee VALUES ('Barkha','Mahajan','barkha@ymail.com','9870056789',2000)
INSERT INTO B_Employee VALUES ('Shasaa','hsdgjs','shsasas@gmail.com','9870076990',3000)
INSERT INTO Inventory VALUES ('chips',100)
INSERT INTO Inventory VALUES ('Coke',50)
INSERT INTO Inventory VALUES ('Chocolate',30)
INSERT INTO sales VALUES (1,1,20)
INSERT INTO sales VALUES (2,2,30)
INSERT INTO sales VALUES (2,3,10)

SELECT * FROM B_Employee
SELECT * FROM Inventory
SELECT * FROM sales


SELECT * INTO Comission FROM
(SELECT sum(sales.SaleQty) as TotalSale,B_Employee.Employee_Id ,comission=sum(sales.SaleQty)*0.1
FROM B_Employee , sales WHERE B_Employee.Employee_Id=sales.EmployeeNo
GROUP BY B_Employee.Employee_Id) com

SELECT * FROM Comission
