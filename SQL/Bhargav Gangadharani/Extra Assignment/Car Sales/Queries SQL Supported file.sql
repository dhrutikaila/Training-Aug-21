
--1. Find the names of all salespeople who have ever worked for the company at any dealership.
SELECT s.Name 
FROM SalesPerson s JOIN WorksAt w ON s.Salesperson_ID=w.SalesPerson_ID


--2. List the Name, Street Address, and City of each customer who lives in Ahmedabad.
SELECT c.Name,c.Address,c.City FROM Customer c WHERE c.City='Ahmedabad'


--3. List the VIN, make, model, year, and mileage of all cars in the inventory of the dealership named "Landmark Honda".
SELECT c.VIN, c.Make, c.Model, c.Year, c.Mileage FROM Inventory i JOIN Car c ON i.VIN=c.VIN 
WHERE Dealership_ID IN (SELECT Dealership_ID FROM Dealership 
WHERE Name='Landmark Honda')


--4. List names of all customers who have ever bought cars from the dealership named "Concept Hyundai".
SELECT c.Name FROM Customer c JOIN Dealership d ON c.City = d.City WHERE d.Name='Concept Hyundai'


--5. For each car in the inventory of any dealership, list the VIN, make, model, and year of the car, along with the name, city, and state of the dealership whose inventory contains the car.
SELECT c.VIN, c.Make, c.Model, c.Year, d.Name, d.City, d.State FROM Inventory i
JOIN Car c ON c.VIN=i.VIN
JOIN Dealership d ON d.Dealership_ID=i.Dealership_ID


--6. Find the names of all salespeople who are managed by a salesperson named "Chirag".
SELECT s.Name FROM SalesPerson s JOIN ReportsTo r ON  s.Salesperson_ID=r.SalesPerson_ID 
WHERE r.ManagingSalesPerson_ID IN (SELECT SalesPerson_ID FROM SalesPerson WHERE Name='Chirag')


--7. Find the names of all salespeople who do not have a manager.
SELECT s.Name FROM SalesPerson s LEFT OUTER JOIN ReportsTo r ON s.Salesperson_ID = r.SalesPerson_ID 
WHERE s.Salesperson_ID Not IN (SELECT SalesPerson_ID FROM ReportsTo)


--8. Find the total number of dealerships.
SELECT COUNT(Dealership_ID) AS TotalNumberOfDealerships FROM Dealership


--9. List the VIN, year, and mileage of all "Toyota Camrys" in the inventory of the dealership named "Toyota Performance". (Note that a "Toyota Camry" is indicated by the make being "Toyota" and the model being "Camry".)
SELECT c.VIN, c.Year, c.Mileage FROM Car c JOIN Inventory i ON c.VIN=i.VIN 
WHERE c.Make='Toyota' AND c.Model='Camry' AND Dealership_ID IN 
(SELECT Dealership_ID FROM Dealership WHERE Name='Toyota Performance')


--10. Find the name of all customers who bought a car at a dealership located in a state other than the state in which they live.
SELECT c.Name FROM Customer c JOIN Sale s ON c.Customer_ID=s.Customer_ID 
WHERE Dealership_ID IN (SELECT Dealership_ID FROM Dealership WHERE c.State != State)


--11. Find the name of the salesperson that made the largest base salary working at the dealership named "Landmark Honda" during January 2021.
SELECT s.name FROM SalesPerson s 
JOIN WorksAt w ON s.SalesPerson_ID=w.SalesPerson_ID
JOIN Sale sa ON s.SalesPerson_ID=sa.SalesPerson_ID 
WHERE (DATEPART(yyyy,sa.SaleDate)=2021) and (DATEPART(MM,sa.SaleDate)=01)  AND w.Dealership_ID IN 
(SELECT Dealership_ID FROM Dealership WHERE Name='Landmark Honda') AND w.BaseSalary_for_Month = (SELECT MAX(BaseSalary_for_Month) FROM WorksAt)


--12. List the name, street address, city, and state of any customer who has bought more than two cars from all dealerships combined since January 1, 2010.
SELECT DISTINCT c.Name, c.Address, c.City, c.State FROM Customer c JOIN Sale s ON c.Customer_ID=s.Customer_ID WHERE s.SaleDate>'2010/01/01'
AND c.Customer_ID IN (SELECT Customer_ID FROM Sale GROUP BY Customer_ID HAVING COUNT(Customer_ID)>=2)


--13. List the name, salesperson ID, and total sales amount for each salesperson who has ever sold at least one car. The total sales amount for a salesperson is the sum of the sale prices of all cars ever sold by that salesperson.
SELECT s.Name, s.SalesPerson_ID, SUM(SalePrice) AS TotalSalesAmount FROM SalesPerson s 
JOIN Sale sa ON s.SalesPerson_ID=sa.SalesPerson_ID GROUP BY s.Name,s.SalesPerson_ID

--14. Find the names of all customers who bought cars during 2021 who were also salespeople during 2010. For the purpose of this query, assume that no two people have the same name.
SELECT c.Name FROM Customer c JOIN SalesPerson s ON c.Name=s.Name 
WHERE s.SalesPerson_ID IN (SELECT SalesPerson_ID FROM Sale WHERE DATEPART(yyyy, SaleDate)= 2021);


--15. Find the name and salesperson ID of the salesperson who sold the most cars for the company at dealerships located in Gujarat between March 1, 2010 and March 31, 2010.
SELECT NAME,SalePersonID FROM
(
SELECT sp.Name 'NAME', RANK() OVER (ORDER BY COUNT(s.Salesperson_ID)DESC) 'rank',s.SalesPerson_ID 'SalePersonID'
FROM Sale s
INNER JOIN SalesPerson sp
ON s.SalesPerson_ID = sp.SalesPerson_ID
INNER JOIN Dealership d
ON s.Dealership_ID = d.Dealership_ID
WHERE d.[State]='Gujarat' AND s.Saledate BETWEEN '2010/03/01' AND '2010/03/31'
GROUP BY s.SalesPerson_ID, sp.[Name]
) temp
WHERE rank=1


--16. Calculate the payroll for the month of March 2010.
-- * The payroll consists of the name, salesperson ID, and gross pay for each salesperson who worked that month.
-- * The gross pay is calculated as the base salary at each dealership employing the salesperson that month, along with the total commission for the salesperson that month.
-- * The total commission for a salesperson in a month is calculated as 5% of the profit made on all cars sold by the salesperson that month.
-- * The profit made on a car is the difference between the sale price and the invoice price of the car. (Assume, that cars are never sold for less than the invoice price.)
SELECT s.Name,s.SalesPerson_ID,SUM(w.BaseSalary_for_Month+(0.05*(sa.SalePrice-c.Invoice_Price))) AS GrossPay FROM Sale sa JOIN SalesPerson s ON sa.SalesPerson_ID=s.SalesPerson_ID 
JOIN Car c ON sa.VIN=c.VIN
JOIN WorksAt w ON sa.SalesPerson_ID=w.SalesPerson_ID
WHERE sa.SaleDate LIKE '2021/03/%'
GROUP BY s.Name,s.SalesPerson_ID;

