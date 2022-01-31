/*You have been hired to create a relational database to support a car sales business.You need to store information on the business’s employees, inventory, and completed sales. 
 You also need to account for the fact that each salesperson receives a different percentage of their sales in commission. What tables and columns would you create in your relational database,and how would you link the tables?*/

CREATE TABLE Employee 
(
	Employee_Id INT PRIMARY KEY IDENTITY(1,1),
	Employee_Name VARCHAR(10) NOT NULL,
	Employee_Email VARCHAR(25) NULL ,
	Employee_PhoneNo INT NOT NULL,
	Employee_AGE INT NULL,
)

CREATE TABLE Inventory
(
	id INT PRIMARY KEY IDENTITY (1,1),
	Car_Name VARCHAR(15),
	Item_qty INT,
	Price money not null,
	Commission_Percentage int,
)


CREATE TABLE Customer
(
	Customer_Id INT NOT NULL CONSTRAINT PKCustomer_Id PRIMARY KEY IDENTITY(1,1), 
	Customer_Name VARCHAR(50) NOT NULL,
	Customer_Email VARCHAR(255) NOT NULL ,
	Customer_PhoneNumber NUMERIC(12) NOT NULL,
)

CREATE TABLE Sales
(
	Sales_id INT NOT NULL PRIMARY KEY IDENTITY (1,1) ,
	EMP_ID INT NOT NULL CONSTRAINT emp_forend REFERENCES Employee(Employee_Id) ,
	ID INT NOT NULL CONSTRAINT inven_forend REFERENCES Inventory(id) ,
	Customer_Id  INT NOT NULL  CONSTRAINT FKCustomer_Id REFERENCES Customer(Customer_Id) ,
)


INSERT INTO Employee VALUES('Vraj','TEST@TEST.COM',99999,20),('BRIJEN','B@B.COM',88888,22)
SELECT * FROM Employee
INSERT INTO Inventory VALUES('i10',3,400000,10),('120',1,350000,23)
SELECT * FROM Inventory
SELECT * FROM Customer 
INSERT INTO Customer VALUES('shreaysh','s@s.com',22222),('shivang','sm@sm.com',11111)
INSERT INTO sales VALUES(1,1,1)
SELECT * FROM sales