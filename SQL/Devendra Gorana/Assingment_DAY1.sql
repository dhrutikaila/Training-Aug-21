

CREATE TABLE Employees1
(
EmployeeID1 INT PRIMARY KEY IDENTITY(1,1),
Firstname VARCHAR(40) NOT NULL,
Lastname VARCHAR(40) NOT NULL,
Email VARCHAR(20) UNIQUE CONSTRAINT chkEmail CHECK(Email like'%@%.___'),
Phonenumber NUMERIC(10) UNIQUE CONSTRAINT ckphonenumber CHECK(Phonenumber between 1000000000 and 9999999999),
Salary MONEY NOT NULL
)

INSERT INTO Employees1 
VALUES ('Devendra','Gorana','dev@gmail.com',9638427015,9000),
('Saurabh','sharma','saurabhsharma@gmail.com',9909913073,11000),
('sanjay','vasita','dkg@gmail.com',7600197208,10000)
SELECT *FROM Employees1

CREATE TABLE Inventory
(
  ItemID INT PRIMARY KEY IDENTITY(1,1),
  Itemname VARCHAR(20) NOT NULL,
  Itemqty INT NOT NULL
)

ALTER TABLE Inventory
ADD Price INT NOT NULL

INSERT INTO Inventory values('samsung',20,100000)
INSERT INTO Inventory values('oppo',80,200000)
INSERT INTO Inventory values('vivo',90,20000)
SELECT *FROM Inventory

CREATE TABLE Sales
(
Sno INT PRIMARY KEY IDENTITY(1,1),
CustomerID INT UNIQUE,
Customername VARCHAR(20) NOT NULL,
EmployeeID1 INT CONSTRAINT fkEmpid FOREIGN KEY REFERENCES dbo.Employees1(EmployeeID1),
ItemID INT CONSTRAINT fkItemID FOREIGN KEY REFERENCES dbo.Inventory(ItemID),
Salesqty INT NOT NULL
)

INSERT INTO Sales VALUES(1,'Ravi',3,2,1)
INSERT INTO Sales VALUES(2,'saurabh',1,3,2)
INSERT INTO Sales VALUES(3,'DEV',2,1,1)
SELECT *FROM Sales

