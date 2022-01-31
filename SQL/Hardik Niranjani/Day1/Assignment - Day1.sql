

CREATE TABLE Business_Employee
(
EmployeeId INT CONSTRAINT BusinessEmployee_EmployeeId_PK PRIMARY KEY IDENTITY(1,1), 
FirstName varchar(20) NOT NULL, 
LastName varchar(20) NOT NULL,
Age INT NOT NULL, 
PhoneNumber varchar(15) NOT NULL,
EmpAddress varchar(45) NOT NULL,
Job_Id INT NOT NULL,
Department_Id INT NOT NULL,
)

CREATE TABLE car_inventory
(
IteamId INT CONSTRAINT carinventory_IteamId_PK PRIMARY KEY IDENTITY(1,1), 
IteamName varchar(20) NOT NULL, 
IteamPrice NUMERIC(6) DEFAULT NULL, 
IteamQty INT DEFAULT NULL
)

CREATE TABLE car_sales
(
SrNo INT CONSTRAINT carsales_SrNo_PK PRIMARY KEY IDENTITY(1,1),
EmpNo INT,
ItemNo INT,
 FOREIGN KEY (EmpNo) REFERENCES Business_Employee(EmployeeId),
 FOREIGN KEY (ItemNo) REFERENCES car_inventory(IteamId)
)



SELECT * FROM Business_Employee
SELECT * FROM car_inventory
SELECT * FROM car_sales


INSERT INTO Business_Employee 
VALUES ('Hadik','Nirnjani',23,'76856258','Rajkt',21,2)

INSERT INTO car_inventory (IteamName,IteamPrice,IteamQty) VALUES('Battery',500,3),('Display',7850,8),('Speker',10000,15)
INSERT INTO car_sales (EmpNo,ItemNo) VALUES(1,1)

 
