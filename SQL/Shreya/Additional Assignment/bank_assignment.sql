CREATE TABLE Branch(
BNAME VARCHAR(18) PRIMARY KEY,
CITY VARCHAR(18) NOT NULL
)


INSERT INTO Branch (BNAME,CITY) VALUES
('VRCE','NAGPUR'),('AJNI','NAGPUR'),('KAROLBAGH','DELHI'),('CHANDNI','DELHI'),('DHARAMPETH','NAGPUR'),
('M.G.ROAD','BANGLORE'),('ANDHERI','MUMBAI'),('VIRAR','MUMBAI'),('NEHRU PLACE','DELHI'),('POWAI','MUMBAI')

SELECT * FROM Branch

CREATE TABLE Customer(
CNAME VARCHAR(19) PRIMARY KEY,
CITY VARCHAR(18) NOT NULL
)

INSERT INTO Customer (CNAME,CITY) VALUES
('ANIL','KOLKATA'),('SUNIL','DELHI'),('MEHUL','BARODA'),('MANDAR','PATNA'),('MADHURI','NAGPUR'),
('PRAMOD','NAGPUR'),('SANDIP','SURAT'),('SHIVANI','MUMBAI'),('KRANTI','MUMBAI'),('NAREN','MUMBAI')


SELECT * FROM Customer

CREATE TABLE Deposit(
ACTNO VARCHAR(5) PRIMARY KEY,
Cname VARCHAR(19) CONSTRAINT c_fk REFERENCES Customer(CNAME),
Bname VARCHAR(18) CONSTRAINT b_fk REFERENCES Branch(BNAME),
Amount INT NOT NULL,
Adate DATE NOT NULL
)

INSERT INTO DEPOSIT(ACTNO,Cname,Bname,Amount,Adate)
VALUES 
('100','ANIL', 'VRCE', 1000, '1995-03-1'),
 ('101','SUNIL', 'AJNI', 5000, '1996-01-4'),
 ('102','MEHUL', 'KAROLBAGH', 3500, '1995-11-17'),
 ('104','MADHURI', 'CHANDNI', 1200, '1995-12-17'),
 ('105','PRAMOD', 'M.G.ROAD', 3000, '1996-03-27'),
 ('106','SANDIP', 'ANDHERI', 2000, '1996-03-31'),
 ('107','SHIVANI', 'VIRAR', 1000, '1995-09-5'),
 ('108','KRANTI', 'NEHRU PLACE', 5000, '1995-07-2'),
 ('109', 'NAREN', 'POWAI', 7000,'1995-08-10')


CREATE TABLE Borrow(
LOANNO VARCHAR(5),
Cname VARCHAR(19) CONSTRAINT cb_fk REFERENCES Customer(CNAME),
Bname VARCHAR(18) CONSTRAINT bb_fk REFERENCES Branch(BNAME),
AMOUNT INT NOT NULL
)

INSERT INTO BORROW (LOANNO,Cname,Bname,AMOUNT)
 VALUES 
 ('201', 'ANIL', 'VRCE',1000),
 ('206', 'MEHUL', 'AJNI',5000),
 ('311', 'SUNIL', 'DHARAMPETH',3000),
 ('321', 'MADHURI', 'ANDHERI',2000),
 ('375', 'PRAMOD', 'VIRAR',8000),
 ('481', 'KRANTI', 'NEHRU PLACE',3000)

 --Q1: List Names of Customers who are Depositors and have Same Branch City as that of SUNIL 
 SELECT d.Cname,B.BNAME,B.CITY FROM Deposit d JOIN Branch b ON d.Bname=b.BNAME where b.CITY IN
(SELECT b.CITY
FROM Deposit d JOIN BRANCH b ON d.Bname=b.BNAME WHERE d.Cname='SUNIL' )


--Q2: List All the Depositors Having Depositors Having Deposit in All the Branches where SUNIL is Having Account
SELECT CNAME,Bname FROM Deposit WHERE BNAME =
 (SELECT BNAME FROM DEPOSIT WHERE Cname='SUNIL') OR Bname=(SELECT BNAME FROM Borrow WHERE Cname='SUNIL')


--Q3: List the Names of Customers Living in the City where the Maximum Number of Depositors are Located



--Q4: List Names of Borrowers Having Deposit Amount Greater than 1000 and Loan Amount Greater than 2000


SELECT b.Cname FROM Deposit d,Borrow b WHERE b.AMOUNT > 2000 AND d.Amount>1000 GROUP BY b.Cname

--5 List All the Customers Living in NAGPUR and Having the Branch City as MUMBAI or DELHI

SELECT c.CNAME,d.Bname FROM  
Customer c JOIN Deposit d ON C.CNAME=D.Cname 
JOIN Branch b  ON  b.BNAME=d.Bname WHERE c.CITY='NAGPUR' AND  b.CITY IN('MUMBAI','DELHI')

--6 Count the Number of Customers Living in the City where Branch is Located

SELECT Count(Cname),City from Customer where City in 
(select distinct city from branch) group by City


