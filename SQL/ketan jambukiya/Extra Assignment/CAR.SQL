Query 1

--Find the names of all salespeople who have ever worked for the company at any dealership.

SELECT name FROM salesperson s JOIN workset w ON s.salespersonid=w.salespersonid

Query 2

--List the Name, Street Address, and City of each customer who lives in Ahmedabad.

SELECT name,address,city FROM Customer WHERE City = 'ahemedabad'

Query 3

--List the VIN, make, model, year, and mileage of all cars in the inventory of the dealership named "Hero Honda Car World".

SELECT c.vin,c.make,c.model,c.year,c.mileage 
FROM car c JOIN inventory i ON c.vin=i.vin
JOIN dealership d ON i.dealershipid=d.dealershipid
WHERE d.dealershipname='Hero Honda Car World'

Query 4

--List names of all customers who have ever bought cars FROM the dealership named "Concept Hyundai".

SELECT name FROM customer c JOIN sale s on c.customerid=s.customerid
JOIN dealership d ON s.dealershipid=d.dealershipid 
WHERE d.dealershipname='Concept Hyundai'

Query 5

-- For each car in the inventory of any dealership, list the VIN, make, model, and year of the car, along with the name, city, and state of the dealership whose inventory contains the car.

SELECT c.vin, c.make, c.model, c.year, d.name, d.city, d.State FROM inventory i
JOIN car c ON c.vin=i.vin
JOIN dealership d ON d.dealershipid=i.dealershipid

Query 6

--Find the names of all salespeople who are managed by a salesperson named "Adam Smith".

SELECT name FROM salesperson WHERE salespersonid IN
(SELECT r.salespersonid FROM reportsto r Join salesperson s
ON r.managingsalespersonid=s.salespersonid
WHERE s.name='vivan')
	
Query 7

-- Find the names of all salespeople who do not have a manager.

SELECT name FROM salesperson WHERE salespersonid not in
(SELECT managingsalespersonid  FROM reportsto)

--OR

SELECT s.Name FROM SalesPerson s LEFT OUTER JOIN ReportsTo r ON s.salespersonid = r.salespersonid
WHERE s.salespersonid Not IN (SELECT managingsalespersonid FROM reportsto)

Query 8

--Find the total number of dealerships.

SELECT COUNT(dealershipid) AS TotalNumberofDealership  FROM dealership

Query 9

--List the VIN, year, and mileage of all "Toyota inova" in the inventory of the dealership named "Toyota Performance". (Note that a "Toyota inova" is indicated by the make being "Toyota" and the model being "inova".)

SELECT  c.vin,c.year,c.mileage FROM car c JOIN inventory i
ON c.vin=i.vin
JOIN dealership d ON i.dealershipid=d.dealershipid
WHERE c.make='toyota' AND c.model='inova' AND d.dealershipname='Toyota Performance'

Query 10

--Find the name of all customers who bought a car at a dealership located in a state other than the state in which they live.

SELECT c.Name FROM customer c JOIN sale s ON c.customerid=s.customerid 
WHERE dealershipid IN (SELECT dealershipid FROM Dealership WHERE state != c.state)

Query 11

--Find the name of the salesperson that made the largest base salary working at the dealership named "Toyota Performance" during January 2010.

SELECT s.name FROM SalesPerson s 
JOIN workset w ON s.salespersonid=w.salespersonid
JOIN Sale sa ON s.salespersonid=sa.salespersonid
WHERE sa.saledate between '2010-01-01' and '2010-01-31' AND w.dealershipid IN 
(SELECT dealershipid FROM Dealership WHERE name='Toyota Performance') 
AND w.basesalaryformonth = (SELECT MAX(basesalaryformonth) FROM workset)

Query 12
 
--List the name, street address, city, and state of any customer who has bought more than two cars FROM all dealerships combined since January 1, 2010.

SELECT DISTINCT c.Name, c.Address, c.City, c.State 
FROM customer c JOIN Sale s ON c.customerid=s.customerid WHERE s.saledate>'2010/01/01'
AND c.customerid IN (SELECT customerid 
FROM Sale GROUP BY customerid HAVING COUNT(customerid)>=2)

Query 13

---List the name, salesperson ID, and total sales amount for each salesperson who has ever sold at least one car. The total sales amount for a salesperson is the sum of the sale prices of all cars ever sold by that salesperson.

SELECT s.name, s.salespersonid, SUM(sa.saleprice) AS TotalSalesAmount FROM salesperson s 
JOIN sale sa ON s.salespersonid=sa.salespersonid GROUP BY s.name,s.salespersonid

Query 14

-- Find the names of all customers who bought cars during 2010 who were also salespeople during 2010. For the purpose of this query, assume that no two people have the same name.

 SELECT c.Name FROM Customer c JOIN SalesPerson s ON c.Name=s.Name 
WHERE s.salespersonid IN (SELECT salespersonid FROM Sale WHERE DATEPART(yyyy, SaleDate)= 2010);

Query 15

--Find the name and salesperson ID of the salesperson who sold the most cars for the company at dealerships located in Gujarat between March 1, 2010 and March 31, 2010.

SELECT NAME,SalePersonID FROM
(
SELECT s.Name 'NAME', RANK() OVER (ORDER BY COUNT(sa.salespersonid)DESC) 'drank',sa.salespersonid 'SalePersonID'
FROM Sale sa
JOIN SalesPerson s
ON sa.salespersonid = s.salespersonid
JOIN Dealership d
ON sa.dealershipid = d.dealershipid
WHERE d.State='Gujarat' AND sa.Saledate BETWEEN '2010/03/01' AND '2010/03/31'
GROUP BY sa.salespersonid, s.name
) temp
WHERE drank=1

Query 16

--Calculate the payroll for the month of March 2010.
    ---	* The payroll consists of the name, salesperson ID, and gross pay for each salesperson who worked that month.
    --- * The gross pay is calculated as the base salary at each dealership employing the salesperson that month, along with the total commission for the salesperson that month.
    --- * The total commission for a salesperson in a month is calculated as 5% of the profit made on all cars sold by the salesperson that month.
    --- * The profit made on a car is the difference between the sale price and the invoice price of the car. (Assume, that cars are never sold for less than the invoice price.)


	SELECT s.name,s.salespersonid,SUM(w.basesalaryformonth+(0.05*(sa.saleprice-c.invoiceprice))) AS GrossPay 
	FROM sale sa JOIN salesperson s ON sa.salespersonid=s.salespersonid 
    JOIN car c ON sa.vin=c.vin
    JOIN workset w ON sa.salespersonid=w.salespersonid
    WHERE sa.saledate LIKE '2010/03/%'
    GROUP BY s.name,s.salespersonid