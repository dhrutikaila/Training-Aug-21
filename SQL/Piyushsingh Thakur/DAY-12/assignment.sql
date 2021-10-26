use DAY11

CREATE TABLE Deposit (
	ActNo VARCHAR (5) NOT NULL PRIMARY KEY, 
	Cname VARCHAR (19) FOREIGN KEY REFERENCES Customer(Cname), 
	Bname VARCHAR(18) FOREIGN KEY REFERENCES Branch(Bname), 
	Amount INT, 
	Adate DATE) 

INSERT INTO Deposit VALUES
	(100,'ANIL','VRCE',1000,'1-Mar-1995'),
	(101,'SUNIL','AJNI',5000,'4-Jan-1996'),
	(102,'MEHUL','KAROLBAGH',3500,'17-Nov-1995'),
	(104,'MADHURI','CHANDNI',1200,'17-Dec-1995'),
	(105,'PRAMOD','M.G.ROAD',3000,'27-Mar-1996'),
	(106,'SANDIP','ANDHERI',2000,'31-Mar-1996'),
	(107,'SHIVANI','VIRAR',1000,'5-Sep-1995'),
	(108,'KRANTI','NEHRU PLACE',5000,'2-Jul-1995'),
	(109,'NAREN','POWAI',7000,'10-Aug-1995')


CREATE TABLE Branch (
	Bname VARCHAR(18) PRIMARY KEY NOT NULL, 
	City VARCHAR(18))

INSERT INTO Branch VALUES 
	('VRCE','Nagpur'),
	('AJNI', 'Nagpur'),
	('KAROLBAGH', 'Delhi'),
	('CHANDNI', 'Delhi'),
	('DHARAMPETH', 'Nagpur'),
	('M.G.ROAD', 'Banglore'),
	('ANDHERI', 'Mumbai'),
	('VIRAR', 'Mumbai'),
	('NEHRU PLACE', 'Delhi'),
	('POWAI', 'Mumbai')


CREATE TABLE  Customer(
	Cname VARCHAR(19) NOT NULL PRIMARY KEY, 
	City VARCHAR(18))

INSERT INTO Customer VALUES 
	('Anil', 'Kolkata'),
	('Sunil', 'Delhi'),
	('Mehul', 'Baroa'),
	('Mandar', 'Patna'),
	('Madhuri', 'Nagpur'),
	('Pramod', 'Nagpur'),
	('Sandip', 'Surat'),
	('Shivani', 'Mumbai'),
	('Kranti', 'Mumbai'),
	('Naren', 'Mumbai')


CREATE TABLE Borrow(
	LoanNo VARCHAR (5) NOT NULL PRIMARY KEY, 
	Cname VARCHAR(19) FOREIGN KEY REFERENCES Customer(Cname), 
	Bname VARCHAR(18) FOREIGN KEY REFERENCES Branch(Bname), 
	Amount INT)

INSERT INTO Borrow VALUES 
(201,'ANIL','VRCE',1000),
(206,'MEHUL','AJNI',5000),
(311,'SUNIL','DHARAMPETH',3000),
(321,'MADHURI','ANDHERI',2000),
(375,'PRAMOD','VIRAR',8000),
(481,'KRANTI','NEHRU PLACE',3000)


SELECT * FROM Borrow
SELECT * FROM Branch
SELECT * FROM Customer
SELECT * FROM Deposit


--  Q1: Create a Store Procedure which will accept name of the customer as input parameter and product the following output, List Names of Customers
--  who are Depositors and have Same Branch City as that of input parameter customer’s Name.

CREATE PROC QUERY1
@Name NVARCHAR(50) 
AS   
BEGIN
    SELECT D.CName AS 'Customer Name', D.Bname  AS 'Branch', City AS 'Branch City' 
	FROM Deposit D JOIN Branch B ON D.Bname=B.Bname WHERE B.City IN 
		(SELECT BR.City FROM Deposit DE JOIN Branch BR ON DE.Bname=BR.Bname WHERE CName = @Name)
 END
EXEC QUERY1 'SUNIL'

-- Q2: Create a Store Procedure which will accept name of the customer as input parameter and produce the following output List in JSON format,
--     All the Depositors Having Depositors Having Deposit in All the Branches where input parameter customer is Having an Account


CREATE PROC QUERY2
@Name NVARCHAR(50)
AS
BEGIN
SELECT D.Cname AS 'Depositors', D.Bname  AS 'Branch', City AS 'Branch City' 
FROM Deposit D JOIN Branch B ON D.Bname=B.Bname 
WHERE D.Bname IN
(SELECT DE.Bname FROM Deposit DE JOIN Branch BR ON DE.Bname=BR.Bname WHERE DE.Cname=@Name)
OR D.Bname IN (SELECT Bname FROM Borrow WHERE Cname= @Name) FOR JSON AUTO
END

EXEC QUERY2 'ANIL'


--Q3: Create a Store Procedure that will accept city name and returns the number of customers in that city.

CREATE PROC QUERY3
@City VARCHAR(18)
AS

BEGIN
	(SELECT COUNT(City) 'NUMBER OF CUSTOMER' FROM Branch GROUP BY City HAVING CITY= @City)
	SELECT * FROM Branch
END

EXEC QUERY3 BANGLORE


-- Q4: Create a Store Procedure which will accept city of the customer as input parameter and product the following output List in JSON format
--	   List All the Customers Living in city provided in input parameter and Having the Branch City as MUMBAI or DELHI
CREATE PROCEDURE QUERY4
@CustCity NVARCHAR(50)
AS
BEGIN
SELECT DISTINCT C.Cname AS 'Customer'
FROM Customer C CROSS join Branch B 
WHERE C.City = @CustCity
AND B.City IN ('Mumbai','Delhi') FOR JSON AUTO
END

EXEC QUERY4 'MUMBAI'



--Q5: Count the Number of Customers Living in the City where Branch is Located
CREATE PROCEDURE QUERY5
AS
BEGIN
SELECT COUNT(DISTINCT c.Cname) AS 'Customers', c.City 
FROM Customer c 
WHERE c.City IN 
(SELECT b.City FROM Branch b) 
GROUP BY c.City 
ORDER BY Customers DESC
END

EXEC QUERY5


