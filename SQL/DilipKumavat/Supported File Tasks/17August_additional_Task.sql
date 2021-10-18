CREATE DATABASE Day6_SQL
USE Day6_SQL

CREATE TABLE Branch
(
	BName VARCHAR(18) PRIMARY KEY,
	City VARCHAR(18) NOT NULL
)

CREATE TABLE Customer
(
    CName VARCHAR(19) PRIMARY KEY,
    City VARCHAR(18) NOT NULL
)

CREATE TABLE Deposit
(
    ActNo VARCHAR(5) PRIMARY KEY,
    CName VARCHAR(19) CONSTRAINT chk_cname_deposit FOREIGN KEY (CName) REFERENCES Customer(CName),
    BName VARCHAR(18) CONSTRAINT chk_bname_deposit FOREIGN KEY (BName) REFERENCES Branch(BName),
    Amount INT NOT NULL,
    Adate DATE NOT NULL
)

CREATE TABLE Borrow
(
	LoanNo VARCHAR(5) PRIMARY KEY,
	CName VARCHAR(19) CONSTRAINT chk_cname_borrow FOREIGN KEY(CName) REFERENCES Customer(CName),
	BName VARCHAR(18) CONSTRAINT chk_bname_borrow FOREIGN KEY(BName) REFERENCES Branch(BName),
	Amount INT NOT NULL
)

INSERT INTO Branch VALUES
	('Vrce','Nagpur'),
	('Ajni','Nagpur'),
	('Karolbagh','Delhi'),
	('Chandni','Delhi'),
	('Dharampeth','Nagpur'),
	('M.G.Road','Banglore'),
	('Andheri','Mumbai'),
	('Virar','Mumbai'),
	('Nehru Place','Delhi'),
	('Powai','Mumbai')

INSERT INTO Customer VALUES 
	('Anil','Kolkata') ,
    ('Sunil','Delhi'),
    ('Mehul','Baroda'),
    ('Mandar','Patna'),
    ('Madhuri','Nagpur'),
    ('Pramod','Nagpur'),
    ('Sandip','Surat'),
    ('Shivani','Mumbai'),
    ('Kranti','Mumbai'),
    ('Naren','Mumbai')

INSERT INTO Deposit VALUES 
	('100','Anil','Vrce',1000,'1-MAR-1995'),
	('101','Sunil','Ajni',5000,'4-Jan-1996'),
	('102','Mehul','Karolbagh',3500,'17-Nov-1995'),
    ('104','Madhuri','Chandni',1200,'17-Dec-1995'),
    ('105','Pramod','M.G.Road',3000,'27-Mar-1996'),
    ('106','Sandip','Andheri',2000,'31-Mar-1996'),
    ('107','Shivani','Virar',1000,'5-Sep-1995'),
    ('108','Kranti','Nehru Place',5000,'2-Jul-1995'),
    ('109','Naren','Powai',7000,'10-Aug-1995')

INSERT INTO Borrow VALUES
	('201','Anil','Vrce',1000),
	('206','Mehul','Ajni',5000),
	('311','Sunil','Dharampeth',3000),
	('321','Madhuri','Andheri',2000),
	('375','Pramod','Virar',8000),
	('481','Kranti','Nehru Place',3000)

SELECT * FROM Branch
SELECT * FROM Customer
SELECT * FROM Deposit
SELECT * FROM Borrow

--- Q1: List Names of Customers who are Depositors and have Same Branch City as that of SUNIL ---
SELECT dep2.CName FROM Deposit AS dep2 
INNER JOIN Branch AS br2 ON dep2.BName=br2.BName 
WHERE br2.City =
(SELECT br1.City FROM Deposit AS dep1 
INNER JOIN Branch AS br1 ON dep1.BName=br1.BName
WHERE dep1.CName='Sunil')

--- Q2: List All the Depositors Having Depositors Having Deposit in All the Branches where SUNIL is Having Account : List All the Depositors Having Depositors Having Deposit in All the Branches where SUNIL is Having Account ---
SELECT dep2.CName FROM Deposit AS dep2 WHERE dep2.BName IN
(SELECT dep1.BName FROM Deposit AS dep1 WHERE dep1.CName='Sunil') 
 OR dep2.BName IN
(SELECT brw1.BName FROM Borrow AS brw1 WHERE brw1.CName='Sunil')

--- Q3: List the Names of Customers Living in the City where the Maximum Number of Depositors are Located ---
SELECT dep2.CName FROM Deposit dep2 INNER JOIN Branch AS br2
ON dep2.BName=br2.BName WHERE br2.City IN (SELECT TOP 2(City) 
FROM (SELECT City, COUNT(City) AS CityCount
FROM Branch br1 RIGHT OUTER JOIN Deposit dep1 ON br1.BName = dep1.Bname
GROUP BY br1.City HAVING COUNT(City)>1)temp)
--- Q4: List Names of Borrowers Having Deposit Amount Greater than 1000 and Loan Amount Greater than 2000 ---
SELECT  brw.CName AS 'brw-CName', dep.Amount AS 'dep-Amount', brw.Amount AS 'brw-Amount'
FROM Borrow AS brw FULL OUTER JOIN Deposit AS dep 
ON brw.CName=dep.CName WHERE dep.Amount>1000 AND brw.Amount>2000

--- Q5: List All the Customers Living in NAGPUR and Having the Branch City as MUMBAI or DELHI ---
SELECT cus1.CName FROM Customer AS cus1 
INNER JOIN Deposit AS dep1 ON cus1.CName=dep1.CName 
INNER JOIN  Branch AS br1 ON dep1.BName=br1.BName 
WHERE cus1.City = 'Nagpur' AND br1.City IN ('Mumbai','Delhi')


--- Q6: Count the Number of Customers Living in the City where Branch is Located ---
SELECT COUNT( DISTINCT cus1.CName) FROM Customer AS cus1 
INNER JOIN Branch AS br1 ON cus1.City=br1.City

