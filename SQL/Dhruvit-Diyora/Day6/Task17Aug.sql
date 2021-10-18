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



--task1- List Names of Customers who are Depositors and have Same Branch City as that of SUNIL
SELECT D.Cname , D.Bname
           From Deposit D JOIN Branch B ON D.Bname=B.Bname
           Where B.City IN (SELECT Br.City FROM Deposit De JOIN Branch Br ON De.Bname=Br.Bname where De.Cname='Sunil')

--task2- List All the Depositors Having Depositors Having Deposit in All the Branches where SUNIL is Having Account
SELECT D.Cname AS 'Name',D.Bname AS 'Branch Name' FROM Deposit D JOIN Branch B ON D.Bname=B.Bname WHERE D.Bname IN ( SELECT D.Bname FROM Deposit D JOIN Branch B ON D.Bname=B.Bname WHERE D.Cname='SUNIL')


--task3- List the Names of Customers Living in the City where the Maximum Number of Depositors are Located
SELECT Cname FROM Customer  WHERE City IN (SELECT City  FROM (SELECT DENSE_RANK() OVER(ORDER BY COUNT(B.City) DESC) AS Rank, B.City, COUNT(B.City) AS 'Occurrence' FROM Deposit D JOIN Branch B ON D.Bname = B.Bname GROUP BY B.City) temp WHERE Rank = 1)

--task4- List Names of Borrowers Having Deposit Amount Greater than 1000 and Loan Amount Greater than 2000
SELECT B.Cname,B.Amount FROM Borrow B JOIN Deposit D ON B.Cname=D.Cname WHERE D.Amount>1000 AND B.Amount>2000


--task5- List All the Customers Living in NAGPUR and Having the Branch City as MUMBAI or DELHI
SELECT C.Cname FROM Customer C  JOIN Branch B  ON C.City=B.City WHERE C.City='Nagpur' AND B.City IN ('Mumbai','Delhi')


--task6- Count the Number of Customers Living in the City where Branch is Located
SELECT COUNT(C.Cname) AS 'Customers',C.City FROM Customer C WHERE C.City IN ( SELECT B.City FROM Branch B) GROUP BY C.City