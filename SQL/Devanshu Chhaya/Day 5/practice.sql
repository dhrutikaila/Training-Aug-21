
USE [AdventureWorksLT2017]

SELECT * FROM [SalesLT].[Product]
SELECT * FROM [SalesLT].[ProductCategory]
SELECT * FROM [SalesLT].[Customer]
SELECT * FROM [SalesLT].[CustomerAddress]

SELECT c.FirstName,c.CustomerID,a.CustomerID,a.AddressID 
FROM [SalesLT].[Customer] AS c LEFT JOIN [SalesLT].[CustomerAddress] AS a 
ON a.customerid=c.customerid


SELECT c.FirstName,c.CompanyName,a.AddressType,a.CustomerID,c.CustomerID 
FROM [SalesLT].[Customer] AS c LEFT JOIN [SalesLT].[CustomerAddress] AS a 
ON c.customerid=a.customerid

SELECT c.AddressID ,a.FirstName,a.CustomerID,c.CustomerID 
FROM [SalesLT].[CustomerAddress] AS c RIGHT JOIN [SalesLT].[Customer] AS a 
ON a.customerid=c.customerid

SELECT a.AddressID ,c.FirstName 
FROM [SalesLT].[Customer] AS c FULL JOIN [SalesLT].[CustomerAddress] AS a 
ON a.customerid=c.customerid


----- Self Join


CREATE TABLE EMPLOYEE_
(	ID INT PRIMARY KEY,
   FULLNAME VARCHAR(20),
   SALARY INT,
   MANAGERID INT

)
DROP TABLE EMPLOYEE
INSERT INTO EMPLOYEE_ VALUES 
(1,'DEV CHHAYA',25000,null),
(2,'RAJ',25000,1),
(3,'MEET',20000,1),
(4,'JAY',23000,2),
(5,'DEEP',24000,2);

SELECT * FROM EMPLOYEE_

SELECT e.ID,e.FullName,e.managerID,m.fullname AS'ManagerName' FROM EMPLOYEE_ e JOIN EMPLOYEE_ m ON e.managerid=m.ID

SELECT e.ID,e.FullName,e.managerID,m.fullname AS'ManagerName' FROM EMPLOYEE_ e LEFT JOIN EMPLOYEE_ m ON e.managerid=m.ID

SELECT e.ID,e.FullName,e.managerID,m.fullname AS'ManagerName' FROM EMPLOYEE_ e RIGHT JOIN Employee_ m ON e.managerid=m.ID


----- CROSS JOIN

CREATE TABLE Meals(MealName VARCHAR(100))

CREATE TABLE Drinks(DrinkName VARCHAR(100))

INSERT INTO Drinks
VALUES('Orange Juice'), ('Tea'), ('Cofee')

INSERT INTO Meals
VALUES('Pitzza'), ('Sand wich'), ('Barger')

SELECT * FROM Meals

SELECT * FROM Drinks

SELECT * FROM Meals 
CROSS JOIN Drinks

SELECT CONCAT_WS('-',MealName,DrinkName) AS MenuList
FROM Meals CROSS JOIN 
Drinks