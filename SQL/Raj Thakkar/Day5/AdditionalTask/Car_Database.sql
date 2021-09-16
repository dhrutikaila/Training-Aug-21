CREATE TABLE Car
(
Car_id INT PRIMARY KEY IDENTITY(1,1),
Vin INT NOT NULL UNIQUE,
Make VARCHAR(30) NOT NULL,
Model VARCHAR(30),
[Year] DATE,
Mileage DECIMAL(10,2) NOT NULL,
AskPrice MONEY NOT NULL,
InvoicePrice MONEY NOT NULL
)

SELECT * FROM Car
INSERT INTO Car VALUES (1,'Toyota','Camry','2021',4,3700000,3600000),
                       (2,'Toyota','Yaris','2021',18,1400000,900000),
                       (3,'Toyota','Glanza','2021',20,900000,700000),
                       (4,'Toyota','Innova','2021',11,1800000,1600000),
                       (5,'Honda','City','2021',18,1400000,1200000),
                       (6,'Ferrari','Roma','2021',8.93,38000000,37000000)

CREATE TABLE Dealership
(
Dealership_Id INT PRIMARY KEY IDENTITY(1,1),
Name VARCHAR(30) NOT NULL,
Address VARCHAR(50) NOT NULL,
City VARCHAR(30) NOT NULL,
State VARCHAR(30) NOT NULL
)

INSERT INTO Dealership VALUES('Hero Honda Car World','Ranip','Ahmedabad','Gujarat'),
                              ('Concept Hyundai','Dharavi','Mumbai','Maharashtra'),
							  ('Toyota Performance','Ranip','Ahmedabad','Gujarat'),
							  ('Ferrari Sale','Dugh','Palampur','Himachal')

CREATE TABLE Salesperson
(
Salesperson_Id INT PRIMARY KEY IDENTITY(1,1), 
Name VARCHAR(30) NOT NULL
)

INSERT INTO Salesperson VALUES('Adam Smith'),
                               ('John Smith'),
							   ('Ben Smith')

CREATE TABLE Car_Customer
(
Customer_Id INT PRIMARY KEY IDENTITY(1,1), 
Name VARCHAR(30) NOT NULL,
Address VARCHAR(100) NOT NULL,
City VARCHAR(30) NOT NULL,
State VARCHAR(30) NOT NULL
)

INSERT INTO Car_Customer Values('Jay','Ranip','Ahmedabad','Gujarat'),
                               ('Ann','Laban','Shillong','Meghalaya'),
							   ('Ashi','Malan','Palampur','Himachal'),
							   ('Sanvi','Ranip','Ahmedabad','Gujarat')

CREATE TABLE Reportsto
(
Reportsto_id INT PRIMARY KEY IDENTITY(1,1),
Salesperson_id  INT CONSTRAINT fk_SALESPERSON FOREIGN KEY (Salesperson_Id) REFERENCES Salesperson(Salesperson_Id) ON DELETE CASCADE ON UPDATE CASCADE,
ManagingSalesperson_Id INT
)

INSERT INTO Reportsto VALUES(1,NULL),
                            (2,1),
							(3,1)
							

CREATE TABLE Worksat
(
Worksat_Id INT PRIMARY KEY IDENTITY(1,1),
Salesperson_id  INT CONSTRAINT FK1_SALESPERSON FOREIGN KEY (Salesperson_Id) REFERENCES Salesperson(Salesperson_Id) ON DELETE CASCADE ON UPDATE CASCADE,
ManagingSalesperson_Id INT,
Dealership_Id INT CONSTRAINT FK_dealershipid FOREIGN KEY (Dealership_Id) REFERENCES Dealership(Dealership_Id) ON DELETE CASCADE ON UPDATE CASCADE,
MonthWorked DATE,
BaseSalaryForMonth MONEY NOT NULL
)

INSERT INTO Worksat VALUES(1,1,4,'January 2010',20000),
                          (2,2,2,'Feb 2010',20000),
						  (3,3,3,'Mar 2010',20000),
						  (1,1,4,'Apr 2010',20000),
						  (2,2,1,'June 2010',20000)
						  TRUNCATE TABLE worksat
CREATE TABLE Inventory
(
Inventory_Id INT PRIMARY KEY IDENTITY(1,1),
Vin INT CONSTRAINT FK_vin FOREIGN KEY (Vin) REFERENCES Car(Vin) ON DELETE CASCADE ON UPDATE CASCADE,
Dealership_Id INT CONSTRAINT FK1_dealershipid FOREIGN KEY (Dealership_Id) REFERENCES Dealership(Dealership_Id) ON DELETE CASCADE ON UPDATE CASCADE
)

INSERT INTO Inventory VALUES(1,3),
                            (2,2),
							(1,3),
							(4,4),
							(5,1),
							(6,1)
CREATE TABLE Sale
(
Sale_Id INT PRIMARY KEY IDENTITY(1,1),
Vin INT CONSTRAINT FK1_vin FOREIGN KEY (Vin) REFERENCES Car(Vin) ON DELETE CASCADE ON UPDATE CASCADE,
Customer_Id INT CONSTRAINT FK_customerid FOREIGN KEY (Customer_Id) REFERENCES Car_Customer(Customer_Id) ON DELETE CASCADE ON UPDATE CASCADE,
Salesperson_Id INT CONSTRAINT FK2_salespersonid FOREIGN KEY (Salesperson_Id) REFERENCES salesperson(Salesperson_Id) ON DELETE CASCADE ON UPDATE CASCADE,
Dealership_Id INT CONSTRAINT FK2_dealershipid FOREIGN KEY (Dealership_Id) REFERENCES Dealership(Dealership_Id) ON DELETE CASCADE ON UPDATE CASCADE, 
SalePrice MONEY not null, 
SaleDate  DATE,
)

INSERT INTO Sale VALUES(6,4,3,4,900000,'January 1 2010'),
                       (5,3,3,3,1600000,'Mar 1 2010'),
					   (4,2,2,4,1200000,'January 1 2021'),
					   (3,1,2,3,37000000,'January 1 2021'),
					   (2,4,1,2,700000,'Mar 1 2021'),
					   (1,3,1,1,900000,'Mar 30 2021')
					   

--1. Find the names of all salespeople who have ever worked for the company at any dealership.
SELECT Name FROM Salesperson

--2. List the Name, Street Address, and City of each customer who lives in Ahmedabad.
SELECT Name
,      Address
,      City 
FROM Car_Customer 
WHERE city = 'Ahmedabad'

--3. List the VIN, make, model, year, and mileage of all cars in the inventory of the dealership named "Hero Honda Car World".
SELECT C.Vin
,      C.Make
,      C.Model
,      C.[Year]
,      C.Mileage 
FROM Car C 
     JOIN Inventory I 
     ON C.Vin = I.Vin 
	 JOIN Dealership D  
	 ON I.Dealership_Id = D.Dealership_Id 
WHERE D.Name= 'Hero Honda Car World' 

--4. List names of all customers who have ever bought cars from the dealership named "Concept Hyundai".
SELECT C.Name 
FROM Car_Customer C 
     JOIN Sale s 
	 ON C.Customer_Id = S.Customer_Id 
     JOIN Dealership D 
	 ON S.Dealership_Id = D.Dealership_Id 
WHERE D.Name= 'Concept Hyundai' 

--5. For each car in the inventory of any dealership, list the VIN, make, model, and year of the car, along with the name, city, and state of the dealership whose inventory contains the car.
SELECT C.Vin
,      C.Make 
,      C.Model
,      C.[Year]
,      D.Name 
,      D.City
,      D.State 
FROM Car C 
     JOIN inventory I 
	 ON C.Vin = I.Vin
     JOIN Dealership D 
	 ON  I.Dealership_Id = D.Dealership_Id 

--6. Find the names of all salespeople who are managed by a salesperson named "Adam Smith".
SELECT S.Name 
FROM Salesperson S 
     JOIN Reportsto R 
	 ON S.Salesperson_Id = R.Salesperson_id
WHERE (
       SELECT Salesperson_id 
	   FROM Salesperson 
	   WHERE Name = 'Adam Smith'
	  ) = R.ManagingSalesperson_Id 

--7. Find the names of all salespeople who do not have a manager.
SELECT S.Name 
FROM Salesperson S 
     RIGHT JOIN Reportsto R 
	 ON S.Salesperson_Id = R.Salesperson_id
WHERE R.ManagingSalesperson_Id IS NULL

--8. Find the total number of dealerships.
SELECT COUNT(Dealership_Id)
FROM Dealership

--9. List the VIN, year, and mileage of all "Toyota Camrys" in the inventory of the dealership named "Toyota Performance". 
SELECT C.Vin
,      C.[Year]
,      C.Mileage 
FROM Car C 
     JOIN Inventory I  
	 ON C.Vin = I.vin 
	 JOIN Dealership D  
	 ON I.Dealership_Id = D.Dealership_Id
WHERE D.name= 'Toyota Performance' 
      AND C.make = 'Toyota' 
	  AND C.model = 'Camry'

--10. Find the name of all customers who bought a car at a dealership located in a state other than the state in which they live.
SELECT DISTINCT(C.name) 
FROM Car_Customer C 
     JOIN Sale S  
	 ON C.Customer_Id = S.Customer_Id 
	 JOIN Dealership D  
	 ON S.Dealership_Id = D.Dealership_Id
WHERE C.state <> D.state

--11. Find the name of the salesperson that made the largest base salary working at the dealership named "Ferrari Sales" during January 2010.
SELECT S.name
,      MAX(W.BaseSalaryForMonth) 
FROM Salesperson S 
     JOIN Worksat W 
	 ON S.Salesperson_Id = W.Salesperson_id 
     JOIN Dealership D 
	 ON W.Dealership_Id = D.Dealership_Id 
WHERE D.name = 'Ferrari Sale' 
      AND DATENAME(MONTH,W.MonthWorked) + ' '+ DATENAME(YEAR,W.monthworked) = 'January 2010' 
GROUP BY S.name

--12. List the name, street address, city, and state of any customer who has bought more than two cars from all dealerships combined since January 1, 2010.
SELECT C.name
,      C.address
,      C.city
,      C.state
FROM Car_Customer C 
     JOIN Sale S 
	 ON C.Customer_Id = S.Customer_Id
WHERE S.Customer_Id > 2 
      AND FORMAT(S.saledate,'MMMM dd, yyyy')  = 'January 1, 2010'

--13. List the name, salesperson ID, and total sales amount for each salesperson who has ever sold at least one car.The total sales amount for a salesperson is the sum of the sale prices of all cars ever sold by that salesperson.
SELECT S.name
,      S.Salesperson_Id
,      SUM(A.SalePrice) AS 'sales amount' 
FROM Salesperson S 
     JOIN Sale A 
	 ON S.Salesperson_Id = A.Salesperson_Id 
GROUP BY S.name,S.Salesperson_Id

--14. Find the names of all customers who bought cars during 2010 who were also salespeople during 2010.For the purpose of this query,assume that no two people have the same name.
SELECT C.name 
FROM Car_Customer C 
     JOIN Sale S 
	 ON C.Customer_Id = S.Customer_Id 
	 JOIN Worksat W 
	 ON S.Salesperson_Id = W.Salesperson_id
WHERE DATENAME(YYYY,S.saledate) = '2010' 
      AND DATENAME(YYYY,W.monthworked) = '2010'

--15. Find the name and salesperson ID of the salesperson who sold the most cars for the company at dealerships located in Gujarat between March 1, 2010 and March 31, 2010.
SELECT A.name
,      A.Salesperson_Id 
FROM Salesperson A 
     JOIN Sale B 
     ON A.Salesperson_Id = A.Salesperson_Id 
     JOIN Dealership D 
	 ON B.Dealership_Id = D.Dealership_Id 
WHERE D.state = 'Gujarat' 
      AND B.saledate BETWEEN '01/03/2021' AND '31/03/2021'

/*16. Calculate the payroll for the month of March 2010.
 * The payroll consists of the name, salesperson ID, and gross pay for each salesperson who worked that month.
 * The gross pay is calculated as the base salary at each dealership employing the salesperson that month, along with the total commission for the salesperson that month.
 * The total commission for a salesperson in a month is calculated as 5% of the profit made on all cars sold by the salesperson that month.
 * The profit made on a car is the difference between the sale price and the invoice price of the car. (Assume, that cars are never sold for less than the invoice price.)*/

SELECT A.Name
,      A.Salesperson_Id
,      SUM(B.SalePrice-C.InvoicePrice*0.05) + D.BaseSalaryForMonth 'Payroll' 
FROM Salesperson A 
     JOIN Sale B 
	 ON A.Salesperson_Id = B.Salesperson_Id
	 JOIN Car C 
	 ON B.Vin = C.Vin 
     JOIN Worksat D 
	 ON B.Salesperson_Id = D.Salesperson_id
WHERE  FORMAT(B.saledate,'MMMM yyyy') = 'March 2010'
       AND  FORMAT(D.monthworked,'MMMM yyyy') = 'March 2010' 
GROUP BY B.Salesperson_Id


