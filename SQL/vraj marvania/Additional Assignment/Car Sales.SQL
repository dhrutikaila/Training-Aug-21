USE CARDATA

CREATE TABLE Car
(
	CarId INT  NOT NULL, 
	Vin INT CONSTRAINT Car_PK_Vin PRIMARY KEY NOT NULL, 
	Make varchar(60) NOT NULL,
	Model varchar(60) NOT NULL,
	Year NUMERIC(4) NOT NULL,
	Mileage NUMERIC(10) NOT NULL,
	AskPrice MONEY NOT NULL,
	InvoicePrice MONEY NOT NULL,
) 

CREATE TABLE Dealership 
(
	 DealershipId INT CONSTRAINT PK_Dealershipid PRIMARY KEY NOT NULL,
	 Name varchar(60),
	 Address varchar(170),
	 City varchar(30),
	 State varchar(30),
) 

CREATE TABLE SalesPerson 
(
	  SalesPersonid  int CONSTRAINT PK_salespersonid PRIMARY KEY NOT NULL,
	  Name  varchar(60) not null,
)

  CREATE TABLE Customer
(
	   Customerid   int CONSTRAINT PK_Customerid PRIMARY KEY NOT NULL,
	   Name  varchar(60),
	   Address  varchar(300),
	   City  varchar(60),
	   State varchar(60),
)

CREATE TABLE ReportsTo
(
	   Reportstoid   int CONSTRAINT PK_Reportstoid PRIMARY KEY NOT NULL,
	   Salespersonid int CONSTRAINT fk_Salespersonid foreign key  REFERENCES  SalesPerson(SalesPersonid) not null,
	   Managingsalespersonid  int 
)

CREATE TABLE Worksat 
(
	   Worksatid   int CONSTRAINT PK_worksatid PRIMARY KEY NOT NULL,
	   Salespersonid  int CONSTRAINT fk_Salespersoni FOREIGN KEY  REFERENCES  Salesperson(SalesPersonid) not null,
	   Dealershipid   INT  CONSTRAINT fk_dealership FOREIGN KEY  REFERENCES  Dealership(DealershipId) not null, 
	   Monthworked    INT,
	   Basesalaryformonth MONEY
)

CREATE TABLE inventory 
(
	 Inventoryid   int CONSTRAINT PK_inventoryid PRIMARY KEY NOT NULL,
	 Vin  int  CONSTRAINT fk_Vin foreign key  REFERENCES  Car(Vin) not null,
	 Dealershipid   int CONSTRAINT fk_Dealershipid foreign key  REFERENCES  Dealership(Dealershipid) not null,
)

CREATE TABLE Sale
(
	 Saleid   int CONSTRAINT PK_Saleid PRIMARY KEY NOT NULL,
	 Vin int CONSTRAINT Sale_fk_Vin foreign key  REFERENCES  Car(Vin) not null,
	 Customerid  int CONSTRAINT fk_Customerid foreign key  REFERENCES customer(Customerid) not null,
	 Salespersonid  int CONSTRAINT fk_Salesperson_id foreign key  REFERENCES  Salesperson(SalesPersonid) null,
	 Dealershipid    int CONSTRAINT fk_Dealership_id foreign key  REFERENCES  dealership(Dealershipid) not null,
	 Saleprice money,
	 Saledate date ,
)


INSERT INTO Car VALUES 
(1,1,'BMW','C23',2010,7,18000.00,18000.00),
(2,2,'GT','LS',2019,9,17000.00,17000.00),
(3,3,'BMW','ES',2020,7,20000.00,20000.00)


INSERT INTO Dealership values
(1,'NOVA','univercity road','GANDHINAGER','GUJARAT'),
(2,'GM','raiya road','GANDHINAGER','GUJRAT')

INSERT INTO SalesPerson VALUES
(1,'VIJAY'),
(2,'RAVI')

INSERT INTO Customer VALUES
(1,'SHIVANG','harinager','RAJKOT','GUJRAT'),
(2,'BRIJEN','kalavad road','JUNAGAD','GUJRAT')

INSERT INTO ReportsTo VALUES
(1,2,1),
(2,2,2)

INSERT INTO Worksat VALUES 
(1,1,1,2,20000.00),
(2,2,2,2,30000.00)

INSERT INTO inventory VALUES
(1,2,1),
(2,2,2)

INSERT INTO Sale  VALUES
(1,1,1,1,1,20000.00,'2020-02-02'),
(2,2,2,2,2,19000.00,'2020-02-03'),
(3,1,2,2,1,20000.00,'2020-02-02'),
(4,2,2,1,2,19000.00,'2020-02-04')



/*1. Find the names of all salespeople who have ever worked for the company at any dealership.*/

				  SELECT Name 
				  FROM Salesperson
				  WHERE salespersonid IN (SELECT Salespersonid FROM Sale)

  /*2. List the Name, Street Address, and City of each customer who lives in Ahmedabad.*/

				  SELECT Name,Address,City FROM customer WHERE City='Ahmedabad'


  /*3. List the VIN, make, model, year, and mileage of all cars in the inventory of the dealership named "Hero Honda Car World"*/
   
          
				  SELECT C.Vin,C.Make,C.model,C.YEAR,C.Mileage FROM car AS [C]	
  				  join inventory [I] ON C.Vin=I.Vin
				  join Dealership  [D] ON I.Dealershipid=D.Dealershipid
				  WHERE D.Name='Hero Honda Car World'


  /*4. List names of all customers who have ever bought cars FROM the dealership named "Concept Hyundai".*/

				 SELECT C.NAME 
				 FROM customer AS [C]
				 JOIN Sale AS [S] ON C.Customerid=S.Customerid
				 JOIN dealership AS [D] ON S.Customerid = D.DealershipId
				 WHERE D.Name='Concept Hyundai'

 /*5.For each car in the inventory of any dealership, list the VIN, make, model, and 
	 year of the car, along with the name, city, and state of the dealership whose inventory contains the car.*/

													
				SELECT C.Vin,C.Make,C.model,C.YEAR,D.Name,D.City,D.State 
				FROM inventory	AS [I]	
				JOIN dealership	AS [D]	ON I.Dealershipid = D.Dealershipid
				JOIN Car AS [C] ON I.Vin =C.Vin

  /*6.Find the names of all salespeople who are managed by a salesperson named "Adam Smith".*/

 
				 SELECT * FROM reportsto AS [R] 
				 JOIN Salesperson  AS [S] ON R.Salespersonid= S.Salespersonid  
				 JOIN Salesperson  AS [M] ON R.Managingsalespersonid= M.Salespersonid
				 WHERE M.Name='Adam Smith'


  /*8. Find the total number of dealerships.*/

				 SELECT  count(*) AS 'Total Dealerships' 
				 FROM dealership


/*9. List the VIN, year, and mileage of all "Toyota Camrys" in the inventory of 
   the dealership named "Toyota Performance". 
   (Note that a "Toyota Camry" is indicated
   by the make being "Toyota" and the model being "Camry".)*/


				SELECT C.Vin,C.YEAR,C.Mileage  FROM Car AS [C]
				LEFT JOIN inventory AS [I] ON I.Vin =C.Vin 
				JOIN dealership AS [D] ON D.Dealershipid=I.Dealershipid
				WHERE (C.Make ='Toyota' AND C.model ='Camry'AND D.NAME='Toyota Performance' )

	
 /*10.Find the name of all customers who bought a car at a dealership located in a state other than the state in which they live.*/
   
		
				SELECT C.NAME FROM SALE AS [S] 
				JOIN dealership AS [D] ON D.Dealershipid=S.Dealershipid
				JOIN Customer AS [C] ON C.CustomerID=S.CustomerID 
				WHERE  D.State=c.State

/*11 Find the name of the salesperson that made the largest base salary working 
     --at the dealership named "Ferrari Sales" during January 2010.*/



	   			SELECT S.Name FROM Salesperson S 
				join WorkSat W ON S.salespersonid=W.Salespersonid
				join dealership d ON W.Dealershipid =d.Dealershipid
				WHERE d.Name='Ferrari Sales'
				ORDER bY W.Basesalaryformonth DESC
		


/*13. List the name, salesperson ID, and total sales amount for each salesperson who hAS ever 
	sold at least one car. The total sales amount for a salesperson is the sum of the sale prices 
	of all cars ever sold by that salesperson.*/

				SELECT  SP.Name,SP.salespersonid,sum(Saleprice) AS [Total_Saleprice] 
				FROM Salesperson AS SP 
				JOIN sale AS S ON  SP.salespersonid =S.Salespersonid
				GROUP BY  SP.salespersonid,SP.Name                   
 
/*14. Find the names of all customers who bought cars during 2010 who were also salespeople during 2010. 
  For the purpose of this query, assume that no two people have the same name.*/

			   (SELECT Name FROM  Customer 
				WHERE Customerid in (SELECT Customerid FROM Sale  WHERE  Datepart(year,Saledate)='2020'))
				INTERSECT 
			   (SELECT Name FROM  Salesperson 
				WHERE Salespersonid in ( SELECT Salespersonid FROM Sale  WHERE  Datepart(year,Saledate)='2020'))
   
      


/*15. Find the name and salesperson ID of the salesperson who sold the most cars for the company at 
dealerships located in Gujarat between March 1, 2010 and March 31, 2010.*/



				SELECT top(1) sp.salespersonid,SP.Name  FROM salesperson AS SP JOIN SALE AS SA ON SP.Salespersonid=SA.Salespersonid
				JOIN dealership AS [D] ON D.Dealershipid =SA.Dealershipid
				WHERE (Saledate between '2020-02-02' and '2020-02-03' AND State='GUJRAT' ) 
				GROUP BY sp.salespersonid,SP.Name  

 


/*16. Calculate the payroll for the month of March 2010.
	    * The payroll consists of the name, salesperson ID, and gross pay for each salesperson who worked that month.
        * The gross pay is calculated AS the base salary at each dealership employing the salesperson that month, along with the total commission for the salesperson that month.
		* The total commission for a salesperson in a month is calculated AS 5% of the profit made ON all cars sold by the salesperson that month.
		* The profit made ON a car is the difference between the sale price and the invoice price of the car. (Assume, that cars are never sold for less than the invoice price.)*/
		          
          

		   	 ( SELECT sp.Name,s.Salespersonid,((SUM(s.Saleprice-c.invoiceprice)*.05)+w.Basesalaryformonth) AS [gross pay]
			   FROM CAR AS [c] 
			   Join Sale AS [s] ON c.vin = s.vin
			   JOIN dealership AS [D] ON D.DealershipId =S.Dealershipid
			   join Worksat AS [w] ON W.Salespersonid=s.Salespersonid
			   join Salesperson AS [sp] ON sp.Salespersonid=s.Salespersonid
			   WHERE s.Saledate LIKE '2020-02-%'
			   GROUP BY s.Salespersonid,sp.Name,w.Basesalaryformonth)






        

