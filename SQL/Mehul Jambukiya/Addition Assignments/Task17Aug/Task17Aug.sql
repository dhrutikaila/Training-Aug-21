USE SqlDay6

CREATE TABLE Deposit(
ActNo VARCHAR(5) CONSTRAINT PkActNo PRIMARY KEY,
Cname VARCHAR(18) CONSTRAINT FkCnameRefCustomer FOREIGN KEY REFERENCES Customer(Cname) ON DELETE SET NULL ON UPDATE CASCADE,
Bname VARCHAR(18) CONSTRAINT FkBnameRefBranch FOREIGN KEY REFERENCES Branch(Bname) ON DELETE SET NULL ON UPDATE CASCADE,
Amount INT CONSTRAINT AmountNotNull NOT NULL,
Adate DATE CONSTRAINT AdateNotNull NOT NULL
)

CREATE TABLE Branch(
Bname VARCHAR(18) CONSTRAINT PkBname PRIMARY KEY,
City VARCHAR(18) CONSTRAINT CityNotNull NOT NULL
)

CREATE TABLE Customer(
Cname VARCHAR(18) CONSTRAINT PkCname PRIMARY KEY,
City VARCHAR(18) CONSTRAINT CityNotNull NOT NULL
)

CREATE TABLE Borrow(
LoanNo VARCHAR(5) CONSTRAINT PkLoanNO PRIMARY KEY,
Cname VARCHAR(18) CONSTRAINT FkCnameRefCustomerTbl FOREIGN KEY REFERENCES Customer(Cname) ON DELETE SET NULL ON UPDATE CASCADE,
Bname VARCHAR(18) CONSTRAINT FkBnameRefBranchTbl FOREIGN KEY REFERENCES Branch(Bname) ON DELETE SET NULL ON UPDATE CASCADE,
Amount INT CONSTRAINT AmountNotNull NOT NULL
)

INSERT INTO Customer VALUES 
('ANIL','KOLKATA'),
('SUNIL','DELHI'),
('MEHUL','BARODA'),
('MANDAR','PATNA'),
('MADHURI','NAGPUR'),
('PRAMOD','NAGPUR'),
('SANDIP','SURAT'),
('SHIVANI','MUMBAI'),
('KRANTI','MUMBAI'),
('NAREN','MUMBAI')

INSERT INTO Branch VALUES
('VRCE','NAGPUR'),
('AJNI','NAGPUR'),
('KAROLBAGH','DELHI'),
('CHANDNI','DELHI'),
('DHARAMPETH','NAGPUR'),
('M.G.ROAD','BANGLORE'),
 ('ANDHERI','MUMBAI'),
('VIRAR','MUMBAI'),
('NEHRU PLACE','DELHI'),
('POWAI','MUMBAI')

INSERT INTO Deposit VALUES
(100,'ANIL','VRCE',1000,'1-Mar-1995'),
(101,'SUNIL','AJNI',5000,'4-Jan-1996'),
(102,'MEHUL','KAROLBAGH',3500,'17-Nov-1995')
(104,'MADHURI','CHANDNI',1200,'17-Dec-1995'),
(105,'PRAMOD','M.G.ROAD',3000,'27-Mar-1996'),
(106,'SANDIP','ANDHERI',2000,'31-Mar-1996'),
(107,'SHIVANI','VIRAR',1000,'5-Sep-1995'),
(108,'KRANTI','NEHRU PLACE',5000,'2-Jul-1995'),
(109,'NAREN','POWAI',7000,'10-Aug-1995')


INSERT INTO Borrow VALUES
(201,'ANIL','VRCE',1000),
(206,'MEHUL','AJNI',5000),
(311,'SUNIL','DHARAMPETH',3000),
(321,'MADHURI','ANDHERI',2000),
(375,'PRAMOD','VIRAR',8000),
(481,'KRANTI','NEHRU PLACE',3000)



SELECT * FROM Branch
SELECT * FROM Customer
SELECT * FROM Deposit
SELECT * FROM Borrow



--Q1: List Names of Customers who are Depositors and have Same Branch City as that of SUNIL

SELECT d.Cname,d.Bname,b.City FROM Deposit d JOIN Branch b ON d.Bname = b.Bname WHERE b.City IN
( SELECT b.City FROM Deposit d JOIN Branch b ON d.Bname = b.Bname WHERE d.Cname='SUNIL')

--Q2: List All the Depositors Having Depositors Having Deposit in All the Branches where SUNIL is Having Account

SELECT d.Cname,d.Bname FROM Deposit d JOIN Branch b ON d.Bname=b.Bname WHERE d.Bname IN
( SELECT d.Bname FROM Deposit d JOIN Branch b ON d.Bname=b.Bname WHERE d.Cname='SUNIL') OR d.Bname
IN (SELECT br.Bname FROM Borrow br JOIN Branch b ON br.Bname=b.Bname WHERE br.Cname ='SUNIL') 


--Q3: List the Names of Customers Living in the City where the Maximum Number of Depositors are Located

SELECT d.Cname,c.City FROM Deposit d JOIN Customer c ON d.Cname=c.Cname WHERE c.City IN 
(SELECT TOP 3 tmp.City FROM 
(SELECT COUNT(d.Cname) AS CustomerInCity, c.City FROM Deposit d JOIN Customer c ON d.Cname=c.Cname  GROUP BY c.City) tmp 
ORDER BY CustomerInCity DESC) ORDER BY d.Cname DESC

--Q4: List Names of Borrowers Having Deposit Amount Greater than 1000 and Loan Amount Greater than 2000

SELECT d.Cname, d.Amount AS Deposit,b.Amount AS Loan FROM  Deposit d JOIN Borrow b ON d.Cname=b.Cname
WHERE d.Amount > 1000 AND b.Amount > 2000

--Q5: List All the Customers Living in NAGPUR and Having the Branch City as MUMBAI or DELHI

SELECT d.Cname,b.City FROM Deposit d JOIN Branch b ON d.Bname=b.Bname WHERE b.City IN ('MUMBAI','DELHI') AND d.Cname IN (SELECT Cname FROM Customer WHERE City = 'NAGPUR')

--Q6: Count the Number of Customers Living in the City where Branch is Located

SELECT COUNT(Cname) AS NoOfCustomers,City FROM Customer WHERE City IN ( SELECT City FROM Branch ) GROUP BY City