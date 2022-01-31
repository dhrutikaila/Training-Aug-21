--Database
CREATE DATABASE Day6_August17
USE Day6_August17

--Tables
--Customer
CREATE TABLE Customer (
	CName VARCHAR(19) CONSTRAINT PK_Customer PRIMARY KEY
	, City VARCHAR(18) NOT NULL
)

INSERT INTO Customer VALUES
        ('ANIL', 'KOLKATA')
    ,    ('SUNIL', 'DELHI')
    ,    ('MEHUL', 'BARODA')
    ,    ('MANDAR', 'PATNA')
    ,    ('MADHURI', 'NAGPUR')
    ,    ('PRAMOD', 'NAGPUR')
    ,    ('SANDIP', 'SURAT')
    ,    ('SHIVANI', 'MUMBAI')
    ,    ('KRANTI', 'MUMBAI')
    ,    ('NAREN', 'MUMBAI')



--Brnach
CREATE TABLE Branch (
	BName VARCHAR(19) CONSTRAINT PK_Branch PRIMARY KEY
	, City VARCHAR(18) NOT NULL
)

INSERT INTO Branch VALUES
	( 'VRCE', 'NAGPUR')
	, ( 'AJNI', 'NAGPUR')
	, ( 'KAROLBAGH', 'DELHI')
	, ( 'CHANDNI', 'DELHI')
	, ( 'DHARAMPETH', 'NAGPUR')
	, ( 'M.G.ROAD', 'BANGLORE')
	, ( 'ANDHERI', 'MUMBAI')
	, ( 'VIRAR', 'MUMBAI')
	, ( 'NEHRU PLACE', 'DELHI')
	, ( 'POWAI', 'MUMBAI')



--Deposite
CREATE TABLE Deposit (
	ActNo VARCHAR(5) CONSTRAINT PK_Deposit PRIMARY KEY
	, CName VARCHAR(19) CONSTRAINT FK_Customer_Deposit FOREIGN KEY (CName) REFERENCES Customer(CName)
	, BName VARCHAR(19) CONSTRAINT FK_Branch_Deposit FOREIGN KEY (BName) REFERENCES Branch(BName)
	, Amount INT NOT NULL
	, ADate DATE NOT NULL
)

INSERT INTO Deposit VALUES
	('100', 'ANIL', 'VRCE', 1000, '1-Mar-1995')
	, ('101', 'SUNIL', 'AJNI',5000, '4-Jan-1996')
	, ('102', 'MEHUL', 'KAROLBAGH', 3500, '17-Nov-1995')
	, ('104', 'MADHURI', 'CHANDNI', 1200, '17-Dec-1995')
	, ('105', 'PRAMOD', 'M.G.ROAD', 3000, '27-Mar-1996')
	, ('106', 'SANDIP', 'ANDHERI', 2000, '31-Mar-1996')
	, ('107', 'SHIVANI', 'VIRAR', 1000, '5-Sep-1995')
	, ('108', 'KRANTI', 'NEHRU PLACE', 5000, '2-Jul-1995')
	, ('109', 'NAREN', 'POWAI', 7000, '10-Aug-1995')

--Borrow
CREATE TABLE Borrow (
	LoanNo VARCHAR(5) CONSTRAINT PK_Borrow PRIMARY KEY
	, CName VARCHAR(19) CONSTRAINT FK_Customer_Borrow FOREIGN KEY (CName) REFERENCES Customer(CName)
	, BName VARCHAR(19) CONSTRAINT FK_Branch_Borrow FOREIGN KEY (BName) REFERENCES Branch(BName)
	, Amount INT NOT NULL
)

INSERT INTO Borrow VALUES
	('201', 'ANIL', 'VRCE', 1000)
	, ('206', 'MEHUL', 'AJNI', 5000)
	, ('311', 'SUNIL', 'DHARAMPETH', 3000)
	, ('321', 'MADHURI', 'ANDHERI', 2000)
	, ('375', 'PRAMOD', 'VIRAR', 8000)
	, ('481', 'KRANTI', 'NEHRU PLACE', 3000)


SELECT * FROM Borrow
SELECT * FROM Branch
SELECT * FROM Customer
SELECT * FROM Deposit

--List Names of Customers who are Depositors and have Same Branch City as that of SUNIL

	SELECT c.CName FROM Customer c JOIN Deposit d ON C.CName=D.CName JOIN Branch b ON d.BName=b.BName WHERE
	b.City IN (SELECT City FROM Branch WHERE Bname=(SELECT BName FROM Deposit WHERE Cname='Sunil') )

--List All the Depositors Having Depositors Having Deposit in All the Branches where SUNIL is Having Account

	SELECT d.CName FROM Deposit d JOIN Branch b ON d.BName=b.BName
	WHERE b.BName IN(SELECT BName FROM Deposit WHERE CName='SUNIL')  

--List the Names of Customers Living in the City where the Maximum Number of Depositors are Located		  

	SELECT c.CName FROM Customer c JOIN Deposit d ON c.CName=d.CName 
	WHERE c.City= (SELECT CITY FROM (SELECT TOP 1 COUNT(CName) Total,City FROM Customer GROUP BY City ORDER BY Total DESC)a)
 
--List Names of Borrowers Having Deposit Amount Greater than 1000 and Loan Amount Greater than 2000


	SELECT b.CName FROM Borrow b JOIN Deposit d ON b.CName=d.CName WHERE d.Amount > 1000 AND b.Amount>2000

--List All the Customers Living in NAGPUR and Having the Branch City as MUMBAI or DELHI

	SELECT c.CName FROM Customer c JOIN Deposit d ON c.CName=d.CName JOIN Branch b ON d.BName=b.BName WHERE
	c.City='NAGPUR' AND b.City IN ('MUMBAI','DELHI')

-- Count the Number of Customers Living in the City where Branch is Located

	SELECT COUNT(CName),City FROM Customer  WHERE City IN(SELECT City FROM Branch) GROUP BY City