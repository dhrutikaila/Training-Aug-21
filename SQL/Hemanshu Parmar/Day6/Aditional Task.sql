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

-----------------------------------Answers-----------------------------

--Query1: List Names of Customers who are Depositors and have Same Branch City as that of SUNIL.

SELECT d.Cname AS 'Customer Name', d.Bname  AS 'Branch', City AS 'Branch City' 
	FROM Deposit d JOIN Branch b ON d.Bname=b.Bname 
		WHERE b.City IN 
		(SELECT br.City FROM Deposit de JOIN Branch br ON de.Bname=br.Bname WHERE de.Cname= 'SUNIL')


--Query2: List All the Depositors Having Deposit in All the Branches where SUNIL is Having Account.

SELECT d.Cname AS 'Depositors', d.Bname  AS 'Branch', City AS 'Branch City' 
	FROM Deposit d JOIN Branch b ON d.Bname=b.Bname 
		WHERE d.Bname IN
		(SELECT de.Bname FROM Deposit de JOIN Branch br ON de.Bname=br.Bname WHERE de.Cname='SUNIL')
			OR d.Bname IN (SELECT Bname FROM Borrow WHERE Cname='SUNIL')


--Query3: List the Names of Customers Living in the City where the Maximum Number of Depositors are Located.

SELECT Cname AS 'Customer', City
	FROM Customer WHERE City 
		IN (SELECT City FROM 
			(SELECT DENSE_RANK() OVER (ORDER BY COUNT(c.City) DESC) AS 'Number', 
			 COUNT(c.City) AS 'Customer Living', 
			 c.City 
			 FROM Customer c JOIN Branch b ON c.City=b.City 
			 GROUP BY c.City) TEMP
			WHERE Number=1)


--Query4: List Names of Borrowers Having Deposit Amount Greater than 1000 and Loan Amount Greater than 2000

SELECT b.Cname AS 'Customer', d.Amount AS 'Deposit', b.Amount AS 'Loan' 
	FROM Borrow b 
		JOIN Deposit d ON b.Cname=d.Cname WHERE d.Amount>1000 AND b.Amount>2000


--Query5: List All the Customers Living in NAGPUR and Having the Branch City as MUMBAI or DELHI

SELECT DISTINCT c.Cname AS 'Customer'
	FROM Customer c CROSS join Branch b 
		WHERE c.City='Nagpur' 
		AND b.City IN ('Mumbai','Delhi')


--Query6: Count the Number of Customers Living in the City where Branch is Located

SELECT COUNT(DISTINCT c.Cname) AS 'Customers', c.City 
	FROM Customer c 
		WHERE c.City IN 
			(SELECT b.City FROM Branch b) 
			GROUP BY c.City 
			ORDER BY Customers DESC
