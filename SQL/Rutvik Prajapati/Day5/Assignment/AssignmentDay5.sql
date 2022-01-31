USE SampleDB;
--Assignment:

--1.Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
	SELECT DATEDIFF(MM,E.HireDate,I.IncentiveDate) AS 'DiffInDate' FROM Employees AS E
	INNER JOIN Incentives AS I on E.EmployeeID=I.EmployeeID

--2.Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
    SELECT E.EmployeeID,E.FirstName,I.IncentiveAmount FROM Employees AS E
	INNER JOIN Incentives AS I on E.EmployeeID=I.EmployeeID
	where I.IncentiveAmount > 3000

--3.Select first_name, incentive amount from employee and incentives table for all employees even if they didn�t get incentives.
    SELECT E.EmployeeID,E.FirstName,I.IncentiveAmount FROM Employees AS E
	LEFT JOIN Incentives AS I on E.EmployeeID=I.EmployeeId

--4.Select EmployeeName, ManagerName from the employee table.
    SELECT E.EmployeeID,E.FirstName AS EmployeeName,M.FirstName,M.EmployeeID
	FROM Employees AS E 
	LEFT JOIN Employees AS M ON E.ManagerID = M.EmployeeID

--Select first_name, incentive amount from employee and incentives table for all employees even if they didn�t get incentives and set incentive amount as 0 for those employees who didn�t get incentives.
    SELECT E.FirstName,COALESCE(I.IncentiveAmount,0) as 'Incentive Amount'
	FROM Employees AS E
	LEFT JOIN Incentives AS I ON E.EmployeeID = I.EmployeeID


--Car Dealerships DATABASE
CREATE DATABASE CarDealerships

--i. car (carid, vin, make, model, year, mileage, askprice, invoiceprice)
CREATE TABLE Car(
CarId INT PRIMARY KEY NOT NULL, 
VIN VARCHAR(50), 
Make VARCHAR(20), 
Model VARCHAR(25), 
Year DATE, 
Mileage INT, 
Askprice MONEY, 
Invoiceprice MONEY
);

INSERT INTO Car VALUES('1','JH4DA9360NS008662','Maruti Suzuki','Maruti Swift',2005,25,387000,350000),
					('2','JH4DC4350RS001835','Maruti Suzuki','Honda Amaze',2016,27,541000,500000),
					('3','1FTPW145X4KA09727','Maruti Suzuki','Maruti Vitara Brezza',2016,23,751000,600000),
					('4','JH4KA8150MC012098','Hyundai','Hyundai Creta',2020,21,1016000,1000000),
					('5','1FVACWDU1BHBB3474','Hyundai','Hyundai i20',20020,25,691000,650000),
					('6','JH4KA7650RC007283','Hyundai','Hyundai Grand i10 Nios',2019,20,528000,500000),
					('7','1HGCT2B88DA000025','Toyota','Toyota Glanza',2019,21,734000,650000),
					('8','WP0CA29972S650104','Toyota','Toyota Vellfire',2020,19,8787000,8500000),
					('9','3VWSB81H8WM210368','Toyota','Toyota Yaris',2021,18,987000,850000)

--ii. dealership (dealershipid, name, address, city, state)
CREATE TABLE Dealership(
DealershipId INT PRIMARY KEY NOT NULL, 
Name VARCHAR(30), 
Address VARCHAR(50), 
City VARCHAR(20), 
State VARCHAR(20)
);

INSERT INTO Dealership VALUES(1,'oncept Hyundai','A-5, Block A, Green Park Extension, Green Park','Haryana','Faridabad'),
							(2,'concept Hyundai','A-4, Block B, Green Park Extension, Green Park','Haryana','Gurugram'),
							(3,'COMPETENT AUTOMOBILES CO. LTD.','A-6, Block C, Green Park Extension, Green Park','Gujarat','Modasa'),
							(4,'BAGGA LINK MOTORS (P) LTD','A-9, Block R, Green Park Extension, Green Park','Gujart','Gandhinagar'),
							(5,'Infinium Toyota','A-1, Block Q, Green Park Extension, Green Park','Keral','Thiruvananthapuram')

						
--iii. salesperson (salespersonid, name)
CREATE TABLE SalePerson(
SalesPersonId INT PRIMARY KEY NOT NULL, 
Name VARCHAR(25)
);

INSERT INTO SalePerson VALUES(1,'Mayank'),
							(2,'Kuldip'),
							(3,'Parth'),
							(4,'Rita'),
							(5,'Laxman'),
							(6,'Sara')

--iv. customer (customerid, name, address, city, state)
CREATE TABLE Customer(
CustomerId INT PRIMARY KEY NOT NULL, 
Name VARCHAR(20) , 
Address VARCHAR(30), 
City VARCHAR(20), 
State VARCHAR(20)
);

INSERT INTO Customer VALUES(1,'Rajan','A-5, Block A,green park','Modasa','Gujarat'),
							(2,'Dhruv','A-3, Block B,RED park','Wankaner','Gujarat'),
							(3,'Karan','A-2, Block C,BLUE park','Modasa','Gujarat'),
							(4,'Hardik','A-1, Block D,YELLOW park','Gandhinagar','Gujarat'),
							(5,'kartik','A-7, Block E,green park','Amd','Gujarat')

--v. reportsto (reportstoid, salespersonid, managingsalespersonid)
CREATE TABLE Reportsto(
ReportstoId INT PRIMARY KEY NOT NULL, 
SalesPersonId INT CONSTRAINT FK_SalesPerson_Id FOREIGN KEY (SalesPersonId) REFERENCES SalePerson(SalesPersonId), 
ManagingSalesPersonId INT CONSTRAINT FK_Managing_SalesPerson_Id FOREIGN KEY (ManagingSalesPersonId) REFERENCES SalePerson(SalesPersonId)
);

INSERT INTO Reportsto VALUES(1,1,4),
					        (2,2,4),
							(3,2,1),
							(4,4,2),
							(5,4,3),
							(6,6,3)

--vi. worksat (worksatid, salespersonid, dealershipid, monthworked, basesalaryformonth)
CREATE TABLE Worksat(
WorksatId INT PRIMARY KEY NOT NULL, 
SalesPersonId INT CONSTRAINT FK_Sales_Person_Id FOREIGN KEY (SalesPersonId) REFERENCES SalePerson(SalesPersonId), 
DealershipId INT CONSTRAINT FK_Dealership_Id FOREIGN KEY (DealershipId) REFERENCES Dealership(DealershipId), 
MonthWorked INT, 
BaseSalaryForMonth MONEY
);

INSERT INTO Worksat VALUES(1,1,2,12,12000),
						(2,1,1,11,12000),
						(3,2,1,10,24000),
						(4,2,1,12,22000),
						(5,3,2,14,20000),
						(6,3,2,16,11000),
						(7,5,3,11,8000),
						(8,5,3,10,30000),
						(9,6,4,17,29000),
						(10,6,5,10,40000)

--vii. inventory (inventoryid, vin, dealershipid)
CREATE TABLE Inventory(
InventoryId INT PRIMARY KEY NOT NULL, 
VIN VARCHAR(50), 
DealershipId INT CONSTRAINT FK_Inventory_Dealership_Id FOREIGN KEY (DealershipId) REFERENCES Dealership(DealershipId), 
);


INSERT INTO Inventory VALUES(1,'JH4DA9360NS008662',1),
							(2,'JH4DC4350RS001835',1),
							(3,'FTPW145X4KA09727',2),
							(4,'JH4KA8150MC012098',2),
							(5,'FVACWDU1BHBB3474',3),
							(6,'WP0CA29972S650104',3),
							(7,'JH4DA9360NS008662',4),
							(8,'JH4KA7650RC007283',5)


--viii. sale (saleid, vin, customerid, salespersonid, dealershipid, saleprice, saledate)
CREATE TABLE Sale(
SaleId INT PRIMARY KEY NOT NULL, 
VIN VARCHAR(50), 
CustomerId INT CONSTRAINT FK_Customer_Id FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId), 
SalesPersonId INT CONSTRAINT FK_Sale_Person_Id FOREIGN KEY (SalesPersonId) REFERENCES SalePerson(SalesPersonId), 
DealershipId INT CONSTRAINT FK_Dealer_ship_Id FOREIGN KEY (DealershipId) REFERENCES Dealership(DealershipId), 
SalePrice MONEY, 
SaleDate DATE
);

INSERT INTO Sale VALUES	(2,'JH4DC4350RS001835',1,1,4,11000,'2020-01-12'),
						(3,'FTPW145X4KA09727',2,2,4,10000,'2020-01-13'),
						(4,'JH4KA8150MC012098',3,2,1,15000,'2020-01-14'),
						(5,'FVACWDU1BHBB3474',3,3,1,20000,'2020-01-15'),
						(6,'WP0CA29972S650104',2,4,2,22000,'2020-01-16'),
						(7,'JH4DA9360NS008662',4,4,2,80000,'2020-01-17'),
						(8,'JH4KA7650RC007283',4,6,3,45000,'2020-01-18')
	
--=========================================================================================
--QUERIES :
--=========================================================================================

--1. Find the names of all salespeople who have ever worked for the company at any dealership.
SELECT DISTINCT SP.Name
FROM SalePerson AS SP 
INNER JOIN Sale AS S ON SP.SalesPersonId = S.SalesPersonId

--2. List the Name, Street Address, and City of each customer who lives in Ahmedabad.
SELECT Name,Address AS 'Street Address',City
FROM Customer
WHERE City = 'Amd'

--3. List the VIN, make, model, year, and mileage of all cars in the inventory of the dealership named "Hero Honda Car World".
SELECT C.VIN,C.Make,C.Model,C.Year,C.Mileage
FROM Inventory AS I
INNER JOIN Car AS C ON I.VIN = C.VIN
INNER JOIN Dealership AS D ON I.DealershipId = D.DealershipId
WHERE D.Name = 'Hero Honda Car World'

--4. List names of all customers who have ever bought cars from the dealership named "Concept Hyundai".
SELECT C.Name AS 'CustomerName'
FROM Sale AS S
INNER JOIN Customer AS C ON C.CustomerId = S.CustomerId
INNER JOIN Dealership AS D ON D.DealershipId = S.DealershipId
WHERE D.Name = 'concept Hyundai'

--5. For each car in the inventory of any dealership, list the VIN, make, model, and year of the car, along with the name, city, and state of the dealership whose inventory contains the car.
SELECT C.VIN,C.Make,C.Model,C.Year,D.Name,d.City,D.State
FROM Inventory AS I
INNER JOIN Car AS C ON I.VIN = C.VIN
INNER JOIN Dealership AS D ON I.DealershipId = D.DealershipId

--6. Find the names of all salespeople who are managed by a salesperson named "Adam Smith".
SELECT SP.Name
FROM Reportsto AS R 
INNER JOIN SalePerson AS SP ON R.SalesPersonId = SP.SalesPersonId
WHERE R.ManagingSalesPersonId = (SELECT SalesPersonId FROM SalePerson WHERE Name = 'Adam Smith')

--7. Find the names of all salespeople who do not have a manager.
SELECT SP.Name
FROM  SalePerson AS SP
LEFT JOIN Reportsto AS R  ON R.SalesPersonId = SP.SalesPersonId
WHERE R.ManagingSalesPersonId IS NULL

--8. Find the total number of dealerships.
SELECT COUNT(DealershipId) AS 'Total_Num_of_Dealerships'
FROM Dealership

--9. List the VIN, year, and mileage of all "Toyota Camrys" in the inventory of the dealership named "Toyota Performance". (Note that a "Toyota Camry" is indicated by the make being "Toyota" and the model being "Camry".)
SELECT C.VIN,C.Make,C.Model,C.Year,C.Mileage,D.Name
FROM Inventory AS I 
INNER JOIN Car AS C ON I.VIN = C.VIN
INNER JOIN Dealership AS D ON I.DealershipId = D.DealershipId
WHERE D.Name = 'Toyota Performance' AND C.Model = 'Toyota Camrys'

      --for dealership name 'oncept Hyundai' car model 'Maruti Swift'
	  SELECT I.InventoryId,I.VIN,C.VIN,C.Make,C.Model,C.Year,C.Mileage
		FROM Inventory AS I 
		INNER JOIN Car AS C ON I.VIN = C.VIN
		INNER JOIN Dealership AS D ON I.DealershipId = D.DealershipId
		WHERE D.Name = 'oncept Hyundai' AND C.Model = 'Maruti Swift'

--10. Find the name of all customers who bought a car at a dealership located in a state other than the state in which they live.
SELECT DISTINCT C.Name
FROM Sale AS S
INNER JOIN Dealership AS D ON S.DealershipId = D.DealershipId
INNER JOIN Customer AS C ON S.CustomerId = C.CustomerId
WHERE D.State != C.State

--11. Find the name of the salesperson that made the largest base salary working at the dealership named "Ferrari Sales" during January 2010.
SELECT D.Name,SP.Name AS 'SalesPersonName'
FROM Worksat AS W
INNER JOIN SalePerson AS SP ON SP.SalesPersonId = W.SalesPersonId
INNER JOIN Dealership AS D ON D.DealershipId = W.DealershipId
WHERE W.BaseSalaryForMonth = (SELECT MAX(W.BaseSalaryForMonth) FROM Worksat AS W 
INNER JOIN Dealership AS D ON D.DealershipId = W.DealershipId 
WHERE D.Name = 'Ferrari Sales')


--12. List the name, street address, city, and state of any customer who has bought more than two cars from all dealerships combined since January 1, 2010.
SELECT TBL.Name,TBL.Address,TBL.City,TBL.State 
FROM (SELECT * ,count(S.CustomerId)AS TOTAL FROM Customer AS C
	  INNER JOIN Sale AS S ON C.CustomerId=S.CustomerId
	   WHERE S.SaleDate>'01/01/2001'
	   GROUP BY S.CustomerId)TBL
WHERE TBL.TOTAL>=2 ;

--13. List the name, salesperson ID, and total sales amount for each salesperson who has ever sold at least one car. The total sales amount for a salesperson is the sum of the sale prices of all cars ever sold by that salesperson.
SELECT * FROM Sale
SELECT SP.Name,SP.SalesPersonId,SUM(SalePrice) AS TOTAL
FROM Sale AS S
INNER JOIN SalePerson AS SP ON S.SalesPersonId = SP.SalesPersonId
GROUP BY SP.Name,SP.SalesPersonId

--14. Find the names of all customers who bought cars during 2010 who were also salespeople during 2010. For the purpose of this query, assume that no two people have the same name.
SELECT C.Name
FROM Sale AS S
INNER JOIN Customer AS C ON S.CustomerId = C.CustomerId
WHERE DATENAME(YYYY,S.SaleDate)='2010' AND C.Name IN (SELECT Name FROM SalePerson)


--15. Find the name and salesperson ID of the salesperson who sold the most cars for the company at dealerships located in Gujarat between March 1, 2010 and March 31, 2010.
SELECT TBL.Name,TBL.SalesPersonId
FROM (SELECT *,dense_rank() OVER(ORDER BY count(Sale.SalesPersonId)DESC)AS RANK FROM SalePerson
			 INNER JOIN Sale ON SalePerson.SalesPersonId=Sale.SalesPersonId 
			 INNER JOIN Dealership ON Sale.DealershipId=Dealership.DealershipId
			 WHERE Sale.SaleDate BETWEEN '2010-03-01' AND '2010-03-31' AND Dealership.City='AHMEDABAD'
			 GROUP BY Sale.SalesPersonId)TBL
WHERE TBL.RANK=1;


--16. Calculate the payroll for the month of March 2010.
--	* The payroll consists of the name, salesperson ID, and gross pay for each salesperson who worked that month.
--        * The gross pay is calculated as the base salary at each dealership employing the salesperson that month, along with the total commission for the salesperson that month.
--        * The total commission for a salesperson in a month is calculated as 5% of the profit made on all cars sold by the salesperson that month.
--        * The profit made on a car is the difference between the sale price and the invoice price of the car. (Assume, that cars are never sold for less than the invoice price.)

SELECT SP.Name,SP.SalesPersonId,(W.BaseSalaryForMonth +(PROFIT_MADE*0.05))AS GROSS_PAY 
FROM (SELECT S.SalesPersonId AS S1, (S.SalePrice-C.InvoicePrice) AS PROFIT_MADE FROM Sale AS S JOIN Car AS C ON S.VIN=C.VIN)T2 
INNER JOIN Worksat AS W ON T2.S1=W.SalesPersonId 
INNER JOIN SalePerson AS SP ON W.SalesPersonId=SP.SalesPersonId 
WHERE W.MonthWorked='MARCH 2010';