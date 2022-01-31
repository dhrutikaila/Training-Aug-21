
/* query1 */

CREATE TABLE inc(
id int primary key,
EmpID int,
incentiveDate date,
incentiveAmount int,
Foreign key(EmpID) REFERENCES Employees(EmployeeID)
)
use master
CREATE TABLE Incentive(
	EmployeeID Decimal(6,0) CONSTRAINT emp_fk REFERENCES Employees(EmployeeID)
	,IncentiveDate DATE NOT NULL
	,IncentiveAmount MONEY NOT NULL
)

INSERT INTO Incentive2
 VALUES (100, '1987-08-17', 5000)
	,(101, '1987-08-18', 3000)
	,(102, '1987-08-19', 4000)
	,(102, '1987-08-20', 2000)
	,(102, '1987-08-21', 6000)
	,(102, '1987-08-22', 3000)

SELECT * FROM Employees

sp_rename 'Employees.HireDate', 'JoiningDate','COLUMN';

CREATE TABLE incentive1(
Id int primary key,
EmployeeID decimal(6, 0),
incentiveDate DATE,
incentiveAmount INT,
Foreign key(EmployeeID) REFERENCES Employees(EmployeeID)
);


/* Get difference between JOINING_DATE and INCENTIVE_DATE FROM employee and incentives TABLE */
SELECT datediff(mm,e.JoiningDate,i.IncentiveDate) as Differncebtwdates FROM employees e join Incentive2 i on e.EmployeeID=i.EmployeeID;

/* query2 */
/* SELECT first_name, incentive amount FROM employee and incentives TABLE for those employees who have incentives and incentive amount greater than 3000 */

SELECT e.EmployeeID
	,e.FirstName
	,i.IncentiveAmount
FROM Employees AS e
	INNER JOIN Incentive2 AS i ON e.EmployeeID=i.EmployeeID
WHERE i.IncentiveAmount > 3000

/* query3 */
/*SELECT first_name, incentive amount FROM employee and incentives TABLE for all employees even if they didn’t get incentives.*/

SELECT e.FirstName,i.IncentiveAmount FROM employees e left join Incentive2 i on e.EmployeeID=i.EmployeeID;

/* query4 */

/* SELECT EmployeeName, ManagerName FROM the employee TABLE. */
SELECT e.FirstName as EmployeeName,m.FirstName as ManagerName FROM Employees e left join Employees m on e.EmployeeID=m.EmployeeID;

/* query5 */
/* SELECT first_name, incentive amount FROM employee and incentives TABLE for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives. */
SELECT e.EmployeeID
	,e.FirstName
	,ISNULL(i.IncentiveAmount,0)
FROM Employees AS e
	LEFT OUTER JOIN Incentive2 AS i ON e.EmployeeID=i.EmployeeID;


/* Additional task */

/* query1 */
/* 1. Find the names of all salespeople who have ever worked for the company at any dealership. */
/* query2 */
/* 2. List the Name, Street Address, and City of each customer who lives in Ahmedabad. */
SELECT name,address,city FROM customer1 where city ='Ahmedabad';

/* query3 */
/* 3. List the VIN, make, model, year, and mileage of all cars in the inventory of the dealership named "Hero Honda Car World". */
SELECT vin,make,model,year,mileage FROM car1 where vin=(SELECT vin FROM dealership where name='Hero Honda Car World');

/* query4 */
/* 
4. List names of all customers who have ever bought cars FROM the dealership named "Concept Hyundai". */


CREATE DATABASE carSalesDB

USE carSalesDB

CREATE TABLE car (
	id INT NOT NULL,
	vid VARCHAR(50) NOT NULL PRIMARY KEY,
	make VARCHAR(50),
	model VARCHAR(50),
	year VARCHAR(50),
	mileage DECIMAL(2,0),
	askPrice VARCHAR(10),
	invoicePrice VARCHAR(10)
)

insert INTO car (id, vid, make, model, year, mileage, askPrice,invoicePrice) values (1, 'KNDMG4C74E6877866', 'Dodge', 'Dakota', 2005, 7, '$19500.00','$18500.00');
insert INTO car (id, vid, make, model, year, mileage, askPrice,invoicePrice) values (2, '1G6AR5S30F0408203', 'Subaru', 'XT', 1989, 39, '$49000.00','$48500.00');
insert INTO car (id, vid, make, model, year, mileage, askPrice,invoicePrice) values (3, '1G6KD57Y14U741149', 'Honda', 'Civic Si', 2003, 35, '$72500.00','$72500.00');
insert INTO car (id, vid, make, model, year, mileage, askPrice,invoicePrice) values (4, 'WAUEH78E87A279822', 'Ford', 'Explorer Sport Trac', 2009, 10, '$10600.69','$10200.00');
insert INTO car (id, vid, make, model, year, mileage, askPrice,invoicePrice) values (5, '3D73Y3HL5AG100250', 'Ford', 'Ranger', 1998, 14, '$35500.00','$35300.00');
insert INTO car (id, vid, make, model, year, mileage, askPrice,invoicePrice) values (6, 'WAUAFAFL5AN015461', 'Subaru', 'Impreza', 2002, 35, '$11400.00','$11000.00');
insert INTO car (id, vid, make, model, year, mileage, askPrice,invoicePrice) values (7, '5FPYK1F22EB682018', 'Audi', 'riolet', 1994, 19, '$55300.00','$55000.00');
insert INTO car (id, vid, make, model, year, mileage, askPrice,invoicePrice) values (8, '1G4PS5SK1D4830033', 'Ford', 'Bronco', 1984, 38, '$39700.00','$39700.00');
insert INTO car (id, vid, make, model, year, mileage, askPrice,invoicePrice) values (9, 'WAUYGAFCXCN635527', 'GMC', 'Savana', 2006, 42, '$18500.00','$18000.00');
insert INTO car (id, vid, make, model, year, mileage, askPrice,invoicePrice) values (10, '3VWPG3AG3AM113797', 'Land Rover', 'Sterling', 1991, 19, '$37800.00','$37200.00');

SELECT * FROM car

CREATE TABLE dealership (
	dealershipid INT NOT NULL PRIMARY KEY,
	name VARCHAR(50),
	Address VARCHAR(50),
	city VARCHAR(50),
	state VARCHAR(50)
);
insert INTO dealership (dealershipid, name, Address, city, state) values (1, 'Ford Cargo', '10 5th Pass', 'Springfield', 'Massachusetts');
insert INTO dealership (dealershipid, name, Address, city, state) values (2, 'Chevrolet Exotica', '1 Schmedeman Point', 'Oklahoma City', 'Oklahoma');
insert INTO dealership (dealershipid, name, Address, city, state) values (3, 'Volkswagen DasAuto', '4113 Buhler Place', 'Chicago', 'Illinois');
insert INTO dealership (dealershipid, name, Address, city, state) values (4, 'Pontiac palace', '9 Anthes Way', 'San Antonio', 'Texas');
insert INTO dealership (dealershipid, name, Address, city, state) values (5, 'Land Rover garden', '0736 Maple Wood Alley', 'Chicago', 'Illinois');
insert INTO dealership (dealershipid, name, Address, city, state) values (6, 'Infiniti emrald', '53389 Browning Pass', 'Tampa', 'Florida');


CREATE TABLE salesperson (
	salesPersonID INT NOT NULL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);
insert INTO salesperson (salesPersonID, name) values (1, 'Papagena Bridal');
insert INTO salesperson (salesPersonID, name) values (2, 'Kristan Gingles');
insert INTO salesperson (salesPersonID, name) values (3, 'Delilah Lapides');
insert INTO salesperson (salesPersonID, name) values (4, 'Therese Ferrini');
insert INTO salesperson (salesPersonID, name) values (5, 'Raphaela Tolan');
insert INTO salesperson (salesPersonID, name) values (6, 'Tasia Melody');
insert INTO salesperson (salesPersonID, name) values (7, 'Marlena Florez');
insert INTO salesperson (salesPersonID, name) values (8, 'Salaidh Mellor');
insert INTO salesperson (salesPersonID, name) values (9, 'Gusta Spong');
insert INTO salesperson (salesPersonID, name) values (10, 'Madalyn Jedrzej');
insert INTO salesperson (salesPersonID, name) values (10, 'Dagmar Kidstoun');


CREATE TABLE customers (
	customerID INT NOT NULL PRIMARY KEY,
	name VARCHAR(50),
	address VARCHAR(50),
	city VARCHAR(50),
	state VARCHAR(50)
);
insert INTO customers (customerID, name, address, city, state) values (1, 'Hulda Shelsher', '46850 Norway Maple Point', 'Dayton', 'Ohio');
insert INTO customers (customerID, name, address, city, state) values (2, 'Ciel Sammons', '1244 Hayes Terrace', 'Houston', 'Texas');
insert INTO customers (customerID, name, address, city, state) values (3, 'Dagmar Kidstoun', '125 Buhler Lane', 'Austin', 'Texas');
insert INTO customers (customerID, name, address, city, state) values (4, 'Donnamarie Stoppe', '35961 Golden Leaf Point', 'Wilmington', 'North Carolina');

CREATE TABLE reportsto (
	reportstoID INT NOT NULL,
	salespersonID INT NOT NULL CONSTRAINT fkSid FOREIGN KEY REFERENCES salesperson(salespersonID),
	ManagingSalesPersonId INT CONSTRAINT fkMSid FOREIGN KEY REFERENCES salesperson(salespersonID)
)

insert INTO reportsTO (reportsToid, salespersonID) values (1, 1);
insert INTO reportsTO (reportsToid, salespersonID, ManagingSalesPersonId) values (2, 2, 1);
insert INTO reportsTO (reportsToid, salespersonID, ManagingSalesPersonId) values (3, 3, 1);
insert INTO reportsTO (reportsToid, salespersonID, ManagingSalesPersonId) values (4, 4, 2);
insert INTO reportsTO (reportsToid, salespersonID, ManagingSalesPersonId) values (5, 5, 3);
insert INTO reportsTO (reportsToid, salespersonID, ManagingSalesPersonId) values (6, 6, 3);
insert INTO reportsTO (reportsToid, salespersonID, ManagingSalesPersonId) values (7, 7, 3);
insert INTO reportsTO (reportsToid, salespersonID, ManagingSalesPersonId) values (8, 8, 2);
insert INTO reportsTO (reportsToid, salespersonID, ManagingSalesPersonId) values (9, 9, 2);
insert INTO reportsTO (reportsToid, salespersonID, ManagingSalesPersonId) values (10, 10, 1);


CREATE TABLE WorkSat (
	workSatID INT NOT NULL,
	salespersonID INT NOT NULL CONSTRAINT fkWSid FOREIGN KEY REFERENCES salesperson(salespersonID),
	dealershipID INT NOT NULL CONSTRAINT fkWDid FOREIGN KEY REFERENCES dealership(dealershipID),
	monthWorked TINYINT NOT NULL,
	baseSalaryForMONTH INT NOT NULL,
)

insert INTO workSat (workSatid, salesPersonID, dealershipID, monthWorked, baseSalaryForMONTH) values (1, 1, 1, 13, 2118);
insert INTO workSat (workSatid, salesPersonID, dealershipID, monthWorked, baseSalaryForMONTH) values (2, 2, 1, 16, 2915);
insert INTO workSat (workSatid, salesPersonID, dealershipID, monthWorked, baseSalaryForMONTH) values (3, 3, 4, 18, 2790);
insert INTO workSat (workSatid, salesPersonID, dealershipID, monthWorked, baseSalaryForMONTH) values (4, 4, 6, 3, 3638);
insert INTO workSat (workSatid, salesPersonID, dealershipID, monthWorked, baseSalaryForMONTH) values (5, 5, 5, 8, 8894);
insert INTO workSat (workSatid, salesPersonID, dealershipID, monthWorked, baseSalaryForMONTH) values (6, 6, 1, 2, 2799);
insert INTO workSat (workSatid, salesPersonID, dealershipID, monthWorked, baseSalaryForMONTH) values (7, 7, 2, 10, 3388);
insert INTO workSat (workSatid, salesPersonID, dealershipID, monthWorked, baseSalaryForMONTH) values (8, 8, 3, 23, 4411);
insert INTO workSat (workSatid, salesPersonID, dealershipID, monthWorked, baseSalaryForMONTH) values (9, 9, 3, 25, 6781);
insert INTO workSat (workSatid, salesPersonID, dealershipID, monthWorked, baseSalaryForMONTH) values (10, 10, 6, 23, 3390);



CREATE TABLE inventory(
	inventoryID INT NOT NULL,
	vID VARCHAR(50) NOT NULL CONSTRAINT fkIvID FOREIGN KEY REFERENCES car(vID),
	dealershipID INT NOT NULL CONSTRAINT fkIDid FOREIGN KEY REFERENCES dealership(dealershipID)
)

INSERT INTO inventory
VALUES (1,'WAUEH78E87A279822',1)
	,(2,'3VWPG3AG3AM113797',6)
	,(3,'WAUEH78E87A279822',1)
	,(4,'5FPYK1F22EB682018',3)
	,(5,'KNDMG4C74E6877866',2)
	,(6,'WAUAFAFL5AN015461',6)

CREATE TABLE sales (
	salesID INT NOT NULL,
	vID VARCHAR(50) NOT NULL CONSTRAINT fkSvID FOREIGN KEY REFERENCES car(vID),
	customerID INT NOT NULL CONSTRAINT fkSCID FOREIGN KEY REFERENCES customers(customerID),
	salespersonID INT NOT NULL CONSTRAINT fkSSid FOREIGN KEY REFERENCES salesperson(salespersonID),
	dealershipID INT NOT NULL CONSTRAINT fkSDid FOREIGN KEY REFERENCES dealership(dealershipID),
	salePrice VARCHAR(10) NOT NULL,
	saleDate DATE NOT NULL
)

insert INTO sales (salesID, vID, customerID, salesPersonID, dealerShipID, salePrice, saleDate) values (1, '1G6AR5S30F0408203', 1, 5, 6, '$50000.00', '2020/08/15');
insert INTO sales (salesID, vID, customerID, salesPersonID, dealerShipID, salePrice, saleDate) values (2, '1G6KD57Y14U741149', 2, 10, 4, '$75000.00', '2020/08/17');
insert INTO sales (salesID, vID, customerID, salesPersonID, dealerShipID, salePrice, saleDate) values (3, 'WAUYGAFCXCN635527', 3, 6, 2, '$20000.00', '2020/08/22');
insert INTO sales (salesID, vID, customerID, salesPersonID, dealerShipID, salePrice, saleDate) values (4, '1G4PS5SK1D4830033', 4, 3, 1, '$42000.00', '2020/08/27');
insert INTO sales (salesID, vID, customerID, salesPersonID, dealerShipID, salePrice, saleDate) values (5, 'WAUYGAFCXCN635527', 2, 6, 6, '$11400.00', '2020/08/29');



--querys

--query1
/* 1. Find the names of all salespeople who have ever worked for the company at any dealership. */

SELECT name
FROM salesperson

--query2
/* 2. List the Name, Street Address, and City of each customer who lives in Ahmedabad. */
SELECT p.name,d.Address,d.city
FROM salesperson p
	INNER JOIN WorkSat w ON p.salesPersonID = w.salespersonID
	INNER JOIN dealership d ON d.dealershipid = w.dealershipID
WHERE city = 'chicago'
--used chicago instead of ahemdabad

--query3
/* 3. List the VIN, make, model, year, and mileage of all cars in the inventory of the dealership named "Hero Honda Car World". */
--will be using'ford cargo instead of hero honda  car world
SELECT c.vid,c.make,c.model,c.year,c.mileage
FROM inventory i
	INNER JOIN dealership d ON i.dealershipID = d.dealershipid
	INNER JOIN car c ON i.vID = c.vid
WHERE d.name = 'Ford Cargo'

--query4
/*4. List names of all customers who have ever bought cars FROM the dealership named "Concept Hyundai".*/ 
--using 'Chevrolet Exotica' instead of concept HYndai
SELECT c.name
FROM sales s
	INNER JOIN customers c ON s.customerID = c.customerID
	INNER JOIN dealership d ON s.dealershipID = d.dealershipid
WHERE d.name = 'Chevrolet Exotica'

--query5
/* 
5. For each car in the inventory of any dealership, list the VIN, make, model, and year of the car, along with the name, city, and state of the dealership whose inventory contains the car. */
SELECT i.vID,c.make,c.model,c.year,d.name,d.city,d.state
FROM inventory i
	INNER JOIN dealership d ON i.dealershipID = d.dealershipid
	INNER JOIN car c ON i.vID = c.vID


--query6
/* 6. Find the names of all salespeople who are managed by a salesperson named "Adam Smith". */
--using Kristan Gingles in adam smith
SELECT 
FROM reportsto r
	INNER JOIN salesperson s ON r.ManagingSalesPersonId = s.salespersonID
WHERE name = 'Kristan Gingles'


SELECT name FROM salesperson WHERE name = 'Kristan Gingles'

--query7
/* 7. Find the names of all salespeople who do not have a manager. */
SELECT s.name
FROM reportsto r
	INNER JOIN salesperson s ON r.salespersonID = s.salesPersonID
WHERE ManagingSalesPersonId IS NULL

--query 8
/* 8. Find the total number of dealerships. */
SELECT COUNT(dealershipID) AS 'total number of dealership' 
FROM dealership

--query 9
/* 9. List the VIN, year, and mileage of all "Toyota Camrys" in the inventory of the dealership named "Toyota Performance". (Note that a "Toyota Camry" is indicated by the make being "Toyota" and the model being "Camry".) */
--all "Toyota Camrys" in the inventory of the dealership named "Toyota Performance"
--will be using Ford Explorer Sport Trac and dealership name ford cargo


SELECT * FROM car
WHERE make +' '+model = 'Ford Ranger' 

SELECT c.vid,c.year,c.mileage
FROM car c
	INNER JOIN inventory i ON i.vID = c.vid
	INNER JOIN dealership d ON d.dealershipid = i.dealershipID
WHERE make +' '+model = 'Ford Explorer Sport Trac' AND d.name = 'ford cargo'

--query10

/* 
10. Find the name of all customers who bought a car at a dealership located in a state other than the state in which they live. */
SELECT c.name
FROM customers c
	INNER JOIN sales s ON s.customerID = c.customerID
	INNER JOIN dealership d ON d.dealershipid = s.dealershipID
WHERE c.state <> d.state

--query11
-- will be using ford cargo dealership
/* 
11. Find the name of the salesperson that made the largest base salary working at the dealership named "Ferrari Sales" during January 2010. */
SELECT p.name,MAX(baseSalaryForMONTH)
FROM salesperson p
	INNER JOIN WorkSat w ON p.salesPersonID = w.salespersonID
	INNER JOIN dealership d ON d.dealershipid = w.dealershipID
GROUP BY d.name,p.name
HAVING d.name = 'Ford Cargo'

SELECT * FROM WorkSat


--query12
/* 12. List the name, street address, city, and state of any customer who has bought more than two cars FROM all dealerships combined since January 1, 2010. */
SELECT c.name,c.address,c.city
FROM sales s
	INNER JOIN customers c ON c.customerID = s.customerID


SELECT customerID,COUNT(customerID) AS freq FROM sales
GROUP BY customerID


SELECT customerID FROM (
	SELECT customerID,COUNT(customerID) AS freq FROM sales
	GROUP BY customerID
) AS fre
GROUP BY freq,customerID
HAVING freq = MAX(freq)

SELECT customerID, COUNT(customerID) AS freq
FROM sales
GROUP BY customerID


--query13
/* 13. List the name, salesperson ID, and total sales amount for each salesperson who has ever sold at least one car. The total sales amount for a salesperson is the sum of the sale prices of all cars ever sold by that salesperson. */
SELECT s.salesPersonID,s1.name,sum(s.salePrice) FROM sales s join salesperson s1 on s.salespersonID=s1.salesPersonID;
--query14
/* 14. Find the names of all customers who bought cars during 2010 who were also salespeople during 2010. For the purpose of this query, assume that no two people have the same name. */

--query15
/* 15. Find the name and salesperson ID of the salesperson who sold the most cars for the company at dealerships located in Gujarat between March 1, 2010 and March 31, 2010. */

--query16
/* 
16. Calculate the payroll for the month of March 2010.
	* The payroll consists of the name, salesperson ID, and gross pay for each salesperson who worked that month.
        * The gross pay is calculated as the base salary at each dealership employing the salesperson that month, along with the total commission for the salesperson that month.
        * The total commission for a salesperson in a month is calculated as 5% of the profit made on all cars sold by the salesperson that month.
        * The profit made on a car is the difference between the sale price and the invoice price of the car. (Assume, that cars are never sold for less than the invoice price.) */
