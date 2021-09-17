use Demo

CREATE TABLE Branch
(
Bname varchar(18) PRIMARY KEY,
City varchar(18) not null
)


CREATE TABLE Customer
(
Cname varchar(18) PRIMARY KEY,
City varchar(18) not null
)


CREATE TABLE Deposit
(
ActNo varchar(5) PRIMARY KEY,
C_name varchar(18) FOREIGN KEY REFERENCES Customer(Cname),
B_name varchar(18) FOREIGN KEY REFERENCES Branch(Bname),
Amount int not null,
Adate date not null,
)


CREATE TABLE BORROW 
(
LoanNo varchar(5) PRIMARY KEY,
C_name varchar(18) FOREIGN KEY REFERENCES Customer(Cname),
B_name varchar(18) FOREIGN KEY REFERENCES Branch(Bname),
Amount int not null
)



INSERT INTO Deposit VALUES(100,'Anil','vrce',1000,'1-mar-1995'),
						  (101,'Sunil','ajni',5000,'4-jun-1996'),
						  (102,'Mehul','karolbagh',3500,'17-nov-1995'),
						  (103,'Madhuri','chandni',1200,'17-dec-1996'),
						  (104,'Pramod','M.G. Road',3000,'27-mar-1996'),
						  (105,'Sandip','andheri',2000,'31-mar-1996'),
						  (106,'Shivani','virar',1000,'5-sep-1995'),
						  (107,'Kranti','nehru place',5000,'2-jul-1995'),
						  (108,'Naren','powai',7000,'10-aug-1995')


INSERT INTO Branch VALUES ('vrce','Nagpur'),
						  ('ajni','Nagpur'),
						  ('karolbagh','Delhi'),
						  ('chandni','Delhi'),
						  ('dharampeth','Nagpur'),
						  ('M.G. Road','Banglore'),
						  ('andheri','Mumbai'),
						  ('virar','Mumbai'),
						  ('nehru place','Delhi'),
						  ('powai','Mumbai')


INSERT INTO Customer VALUES ('Anil','Kolkata'),
							('Sunil','Delhi'),
							('Mehul','Baroda'),
							('Mandar','Patna'),
							('Madhuri','Nagpur'),
							('Pramod','Nagpur'),
							('Sandip','Surat'),
							('Shivani','Mumbai'),
							('Kranti','Mumbai'),
							('Naren','Mumbai')



INSERT INTO BORROW VALUES (201,'Anil','vrce',1000),
						  (206,'Mehul','ajni',5000),
						  (311,'Sunil','dharampeth',3000),
						  (321,'Madhuri','andheri',2000),
						  (375,'Pramod','virar',8000),
						  (481,'Kranti','nehru place',3000)





-- Q1 List Names of Customers who are Depositors and have Same Branch City as that of SUNIL

SELECT d.C_name
FROM Deposit d
WHERE d.B_name IN (SELECT Bname FROM Branch b WHERE b.City = 
				  (SELECT City FROM Branch WHERE Bname = 
				  (SELECT B_name FROM Deposit WHERE C_name = 'Sunil')))



-- Q2 List All the Depositors Having Depositors Having Deposit in All the Branches where SUNIL is Having Account

SELECT C_name
FROM Deposit
WHERE B_name IN ( 
				(SELECT B_name FROM Deposit WHERE C_name = 'Sunil'), 
				(SELECT B_name FROM BORROW WHERE C_name = 'Sunil')
				)


-- Q2 Using join

SELECT C_name
FROM Deposit
WHERE B_name IN ( 
				SELECT d.B_name FROM Deposit d 
				JOIN BORROW b ON b.B_name = d.B_name
				WHERE d.C_name = 'Sunil'
				)


-- Q2 Using join

SELECT d1.C_name
FROM Deposit d1
	INNER JOIN Deposit d2 ON d1.B_name = d2.B_name
	INNER JOIN BORROW b ON b.B_name = d2.B_name
WHERE d1.C_name = 'Sunil'


-- Q3 List the Names of Customers Living in the City where the Maximum Number of Depositors are Located

-- SELECT c1.City,COUNT(d1.C_name) FROM Deposit d1,Customer c1 WHERE c1.Cname = d1.C_name GROUP BY c1.City 

-- SELECT c1.City FROM Deposit d1,Customer c1 WHERE c1.Cname = d1.C_name GROUP BY c1.City 

-- SELECT COUNT(d2.C_name) FROM Deposit d2,Customer c2 WHERE d2.C_name = c2.Cname GROUP BY c2.City

SELECT c.Cname,c.City FROM Customer c WHERE c.City IN 
(SELECT c1.City FROM Deposit d1,Customer c1 WHERE c1.Cname = d1.C_name GROUP BY c1.City 
	HAVING COUNT(d1.C_name) >= ALL(SELECT COUNT(d2.C_name) 
		FROM Deposit d2,Customer c2 WHERE d2.C_name = c2.Cname GROUP BY c2.City))

		

-- Q4 List Names of Borrowers Having Deposit Amount Greater than 1000 and Loan Amount Greater than 2000

SELECT b.C_name
FROM BORROW b
WHERE b.Amount > 2000 AND EXISTS(SELECT Amount FROM Deposit WHERE Amount > 1000 AND C_name = b.C_name)


-- Q4 using join
SELECT b.C_name
FROM BORROW b
	INNER JOIN Deposit d ON d.C_name = b.C_name
WHERE b.Amount > 2000 and d.Amount > 1000


-- Q5 List All the Customers Living in NAGPUR and Having the Branch City as MUMBAI or DELHI

SELECT c.Cname
FROM Customer c
WHERE c.City = 'Nagpur' AND 
EXISTS(SELECT d.B_name FROM Deposit d WHERE d.C_name = c.Cname AND d.B_name IN 
	  (SELECT b.Bname FROM Branch b WHERE b.City IN ('Mumbai','Delhi')))


-- Q5 Using join
SELECT c.Cname
FROM Customer c
	INNER JOIN Deposit d ON d.C_name = c.Cname
	INNER JOIN Branch b ON b.Bname = d.B_name
WHERE c.City = 'Nagpur' AND b.City IN ('Mumbai','Delhi')
	



-- Q6 Count the Number of Customers Living in the City where Branch is Located

SELECT COUNT(c.Cname)
FROM Customer c 
WHERE c.City = (SELECT b.City FROM Branch b 
				WHERE b.Bname = (SELECT d.B_name FROM Deposit d WHERE d.C_name = c.Cname))

-- Q6 Using join

SELECT COUNT(c.Cname)
FROM Customer c
	INNER JOIN Deposit d ON d.C_name = c.Cname
	INNER JOIN Branch b ON b.Bname = d.B_name
WHERE c.City = b.City


