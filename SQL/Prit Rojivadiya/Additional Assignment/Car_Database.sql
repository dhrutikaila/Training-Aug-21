CREATE DATABASE CarsDatabase
use CarsDatabase


CREATE TABLE Car
(
carid int PRIMARY KEY IDENTITY(1,1),
vin varchar(20) CONSTRAINT unq UNIQUE,
make varchar(20) not null,
model varchar(20) not null,
year Numeric(4) not null,
milage Decimal(6,2) not null,
askPrice Money not null,
invoicePrice Money not null
)


CREATE TABLE dealership
(
dealershipid int PRIMARY KEY IDENTITY(1,1), 
name varchar(30) not null, 
address varchar(100) not null, 
city varchar(20) not null, 
state varchar(20) not null
)


CREATE TABLE salesperson 
(
salespersonid int PRIMARY KEY IDENTITY(1,1), 
name varchar(20) not null
)


CREATE TABLE  customer 
(
customerid int PRIMARY KEY IDENTITY(1,1), 
name varchar(20) not null,
address varchar(100) not null, 
city varchar(20) not null, 
state varchar(20) not null
)


CREATE TABLE reportsto 
(
reportstoid int PRIMARY KEY IDENTITY(1,1), 
salespersonid int CONSTRAINT REPORTSTO_SALESPERSONID_FK FOREIGN KEY REFERENCES salesperson(salespersonid), 
managingsalespersonid int
)


CREATE TABLE  worksat 
(
worksatid int PRIMARY KEY IDENTITY(1,1), 
salespersonid int CONSTRAINT WORKSAT_SALESPERSONID_FK FOREIGN KEY REFERENCES salesperson(salespersonid), 
dealershipid int CONSTRAINT WORKSAT_DEALERSHIPID_FK FOREIGN KEY REFERENCES dealership(dealershipid), 
monthworked Numeric(4), 
basesalaryformonth money not null,
)


CREATE TABLE inventory 
(
inventoryid int PRIMARY KEY IDENTITY(1,1), 
vin varchar(20) CONSTRAINT INVENTORY_VIN_FK FOREIGN KEY REFERENCES Car(vin), 
dealershipid int CONSTRAINT INVENTORY_DEALERSHIPID_FK FOREIGN KEY REFERENCES dealership(dealershipid)
)


CREATE TABLE sale 
(
saleid int PRIMARY KEY IDENTITY(1,1), 
vin varchar(20) CONSTRAINT SALE_VIN_FK FOREIGN KEY REFERENCES Car(vin), 
customerid int CONSTRAINT SALE_CUSTOMERID_FK FOREIGN KEY REFERENCES customer(customerid), 
salespersonid int CONSTRAINT SALE_SALESPERSONID_FK FOREIGN KEY REFERENCES salesperson(salespersonid), 
dealershipid int CONSTRAINT SALE_DEALERSHIPID_FK FOREIGN KEY REFERENCES dealership(dealershipid), 
saleprice Money not null, 
saledate Date not null
)




INSERT INTO Car VALUES
('c1','Toyota','Prius',2018,60,700000,600000),
('c2','Toyota','t1',2019,60,710000,620000),
('c3','Toyota','t2',2018,60,720000,650000),
('c4','KIA','k1',2020,60,1300000,1200000),
('c5','KIA','k2',2020,60,1400000,1300000),
('c6','KIA','k3',2021,60,1450000,1350000),
('c7','BMW','b1',2015,60,2000000,1900000),
('c8','BMW','b2',2016,60,1900000,1800000),
('c9','BMW','b3',2017,60,1800000,1700000),
('c10','Audi','a0',2021,60,2100000,2000000)



INSERT INTO dealership VALUES
('Toyota sale','Shantadevi road','Navsari','Gujarat'),
('KIA sale','Anand Nagar','Ahmedabad','Gujarat'),
('BMW sale','Pethapur','Gandhinagar','Gujarat'),
('Audi sale','bardoli','Surat','Gujarat'),
('Toyota sale','Bardoli street','Andheri','Maharashtra'),
('KIA sale','p1 street','Pune','Maharashtra'),
('BMW sale','n2 street','Nashik','Maharashtra'),
('Audi sale','m3 street','Mumbai','Maharashtra'),
('Toyota sale','b1 street','Bangalore','Karnataka'),
('KIA sale','b2 street','Manglore','Karnataka'),
('Audi sale','b3 street','Kanyakumari','Karnataka'),
('BMW sale','b4 street','Surathkal','Karnataka')


INSERT INTO salesperson VALUES
('Prit'),
('Tirth'),
('Man'),
('Vishva'),
('Hiren'),
('Meet'),
('Ayush'),
('Raj'),
('Abhi'),
('Nisha')



INSERT INTO customer VALUES
('a','aaaaaaa','Surat','Gujarat'),
('b','bbbbbbb','Gandhinagar','Gujarat'),
('c','ccccccc','Gandhinagar','Gujarat'),
('d','ddddddd','Navsari','Gujarat'),
('e','eeeeeee','Mumbai','Maharashtra'),
('f','fffffff','Mumbai','Maharashtra'),
('g','ggggggg','Banglore','Karnataka'),
('h','hhhhhhh','Banglore','Karnataka'),
('i','iiiiiii','Pune','Maharashtra'),
('j','jjjjjjj','Nasik','Maharashtra'),
('k','kkkkkkk','Nasik','Maharashtra'),
('l','lllllll','Ahmedabad','Gujarat'),
('m','mmmmmmm','Surathkal','Karnataka')



INSERT INTO reportsto VALUES
(1,null),
(2,1),
(3,1),
(4,1),
(5,2),
(6,2),
(7,2),
(8,3),
(9,3),
(10,3)



INSERT INTO worksat VALUES
(1,1,24,10000),
(2,1,24,20000),
(3,1,24,30000),
(2,2,24,40000),
(3,3,24,50000),
(4,1,24,60000),
(5,9,24,70000),
(6,8,24,80000),
(7,7,24,90000),
(8,10,24,100000),
(10,5,24,110000),
(9,6,24,120000),
(5,4,24,130000),
(6,6,24,140000)



INSERT INTO inventory VALUES
('c1',1),
('c2',5),
('c3',9),
('c4',2),
('c5',6),
('c6',10),
('c7',3),
('c8',7),
('c9',12),
('c10',4),
('c10',8),
('c10',11)



INSERT INTO sale VALUES
('c1',1,2,1,700000,'2021-08-20'),
('c1',2,1,1,700000,'2021-07-20'),
('c1',3,3,1,700000,'2021-06-20'),
('c1',4,4,1,700000,'2021-05-20'),
('c2',5,2,5,710000,'2021-04-20'),
('c2',6,2,5,710000,'2021-03-20'),
('c3',7,2,9,720000,'2021-02-20'),
('c3',8,2,9,720000,'2021-02-20'),
('c4',12,2,2,1300000,'2021-02-20'),
('c5',10,2,6,1400000,'2021-02-20'),
('c6',13,2,10,1450000,'2021-02-20'),
('c6',8,2,10,1450000,'2021-02-20'),
('c7',3,2,3,2000000,'2021-02-20'),
('c7',4,2,3,2000000,'2021-02-20'),
('c8',5,2,7,1900000,'2021-02-20'),
('c9',13,2,12,1800000,'2021-02-20'),
('c10',1,2,4,2100000,'2021-02-20'),
('c10',5,2,8,2100000,'2021-02-20'),
('c10',7,2,11,2100000,'2021-02-20'),
('c1',12,2,1,700000,'2021-02-20'),
('c4',5,2,2,1300000,'2021-02-20')



-- Q1 Find the names of all salespeople who have ever worked for the company at any dealership.

SELECT s.name FROM salesperson s
WHERE s.salespersonid IN (SELECT w.salespersonid FROM worksat w)


-- Q2 List the Name, Street Address, and City of each customer who lives in Ahmedabad.

SELECT name,address,city FROM customer WHERE city = 'Ahmedabad'


-- Q3 List the VIN, make, model, year, and mileage of all cars in the inventory of the dealership named "Hero Honda Car World".

SELECT c.vin,c.make,c.model,c.year,c.milage FROM Car c
	JOIN inventory i ON c.vin = i.vin
	JOIN dealership d ON d.dealershipid = i.dealershipid
WHERE d.name = 'Toyota sale'


-- Q4 List names of all customers who have ever bought cars from the dealership named "Concept Hyundai".

SELECT c.name FROM customer c
	JOIN sale s ON s.customerid = c.customerid
	JOIN dealership d ON d.dealershipid = s.dealershipid
WHERE d.name = 'KIA sale'


-- Q5 For each car in the inventory of any dealership, list the VIN, make, model, and year of the car, along with the name, city, and state of the dealership whose inventory contains the car.

SELECT c.vin,c.make,c.model,c.year,d.name,d.city,d.state FROM Car c
	JOIN inventory i ON i.vin = c.vin
	JOIN dealership d ON d.dealershipid = i.dealershipid


-- Q6 Find the names of all salespeople who are managed by a salesperson named "Adam Smith".

SELECT s.name FROM salesperson s WHERE s.salespersonid IN
(SELECT r1.salespersonid FROM reportsto r1
WHERE r1.managingsalespersonid = (SELECT s.salespersonid FROM salesperson s WHERE s.name = 'Man'))


-- Q7 Find the names of all salespeople who do not have a manager.

SELECT s.name FROM salesperson s
	JOIN reportsto r1 ON r1.salespersonid = s.salespersonid
	LEFT JOIN reportsto r2 ON r1.managingsalespersonid = r2.salespersonid
WHERE r2.salespersonid is null


-- Q8 Find the total number of dealerships.

SELECT COUNT(*) FROM dealership

-- Q9 List the VIN, year, and mileage of all "Toyota Camrys" in the inventory of the dealership named "Toyota Performance". 
-- (Note that a "Toyota Camry" is indicated by the make being "Toyota" and the model being "Camry".)

SELECT c.vin,c.year,c.milage FROM Car c
	JOIN inventory i ON i.vin = c.vin
WHERE i.dealershipid IN (SELECT dealershipid FROM dealership WHERE name = 'BMW sale') AND c.make = 'BMW' AND c.model = 'b2'

-- Q10 Find the name of all customers who bought a car at a dealership located in a state other than the state in which they live.

SELECT c.name FROM customer c
	JOIN sale s ON s.customerid = c.customerid
	JOIN dealership d ON d.dealershipid = s.dealershipid
WHERE c.state <> d.state

-- Q11 Find the name of the salesperson that made the largest base salary working at the dealership named "Ferrari Sales" during January 2010.

SELECT Top 1 s.name,w.basesalaryformonth FROM salesperson s
	JOIN worksat w ON w.salespersonid = s.salespersonid
	JOIN dealership d ON d.dealershipid = w.dealershipid
WHERE d.name = 'toyota sale'
ORDER BY w.basesalaryformonth DESC


-- Q12 List the name, street address, city, and state of any customer who has bought more than two cars from all dealerships combined since January 1, 2010.

SELECT c.name,c.customerid FROM customer c 
WHERE c.customerid IN
(SELECT cid FROM 
(SELECT COUNT(vin) as 'car_count',s.customerid as 'cid'
FROM sale s GROUP BY s.customerid HAVING COUNT(vin)>2) temp)

-- Q13 List the name, salesperson ID, and total sales amount for each salesperson who has ever sold at least one car. 
-- The total sales amount for a salesperson is the sum of the sale prices of all cars ever sold by that salesperson.

SELECT s.Name, s.salespersonid, SUM(SalePrice) AS TotalSalesAmount FROM SalesPerson s 
	JOIN Sale sa ON s.salespersonid=sa.salespersonid GROUP BY s.Name,s.salespersonid

-- Q14 Find the names of all customers who bought cars during 2010 who were also salespeople during 2010. For the purpose of this query, assume that no two people have the same name.

SELECT c.name FROM customer c
	JOIN sale s on s.customerid = c.customerid
	JOIN salesperson sp ON sp.salespersonid = s.salespersonid
WHERE c.name IN (sp.name) AND YEAR(s.saledate) = 2021


-- Q15 Find the name and salesperson ID of the salesperson who sold the most cars for the company at dealerships located in Gujarat between March 1, 2010 and March 31, 2010.

SELECT TOP 1 COUNT(sid),name FROM 
(SELECT sp.salespersonid as 'sid',sp.name as 'name' FROM salesperson sp
	JOIN sale s ON s.salespersonid = sp.salespersonid
WHERE s.dealershipid IN (SELECT d.dealershipid FROM dealership d WHERE d.state = 'Gujarat') AND s.saledate BETWEEN '2021-02-01' AND '2021-02-28') temp
GROUP BY name
ORDER BY COUNT(sid) DESC 


-- Q16 Calculate the payroll for the month of March 2010.
-- * The payroll consists of the name, salesperson ID, and gross pay for each salesperson who worked that month.
-- * The gross pay is calculated as the base salary at each dealership employing the salesperson that month, along with the total commission for the salesperson that month.
-- * The total commission for a salesperson in a month is calculated as 5% of the profit made on all cars sold by the salesperson that month.
-- * The profit made on a car is the difference between the sale price and the invoice price of the car. (Assume, that cars are never sold for less than the invoice price.)

SELECT s.Name,s.salespersonid,SUM(w.basesalaryformonth+(0.05*(sa.SalePrice-c.invoicePrice))) AS GrossPay FROM Sale sa 
	JOIN SalesPerson s ON sa.salespersonid=s.salespersonid 
	JOIN Car c ON sa.VIN=c.VIN
	JOIN WorksAt w ON sa.salespersonid=w.salespersonid
WHERE sa.SaleDate LIKE '2021-02-%'
GROUP BY s.Name,s.salespersonid