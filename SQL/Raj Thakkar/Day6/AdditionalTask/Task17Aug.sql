CREATE TABLE Deposit 
(
ACTNO VARCHAR(5) NOT NULL PRIMARY KEY,
Cname VARCHAR(18) DEFAULT NULL CONSTRAINT FK_Cname FOREIGN KEY (Cname) REFERENCES CUSTOMER(Cname) ,
Bname VARCHAR(18) DEFAULT NULL CONSTRAINT FK_Bname FOREIGN KEY (Bname) REFERENCES BRANCH(Bname) ,
Amount INT NOT NULL,
Adate DATE
)

CREATE TABLE BRANCH  
(
Bname VARCHAR(18) PRIMARY KEY,
CITY VARCHAR(18)  NOT NULL 
)
CREATE TABLE CUSTOMER   
(
Cname VARCHAR(18) NOT NULL PRIMARY KEY,
CITY VARCHAR(18)  NOT NULL
)

CREATE TABLE BORROW    
(
LOANNO VARCHAR(5) NOT NULL PRIMARY KEY,
Cname VARCHAR(18) DEFAULT NULL CONSTRAINT FK_Borrow_Cname FOREIGN KEY (Cname) REFERENCES CUSTOMER(Cname) ,
Bname VARCHAR(18) DEFAULT NULL CONSTRAINT FK_Borrow_Bname FOREIGN KEY (Bname) REFERENCES BRANCH(Bname) ,
Amount INT NOT NULL
)

INSERT INTO Deposit VALUES (100,'ANIL','VRCE',1000,'1-Mar-1995')
INSERT INTO Deposit VALUES (101,'SUNIL','AJNI',5000,'4-Jan-1996')
INSERT INTO Deposit VALUES (102,'MEHUL','KAROLBAGH',3500,'17-Nov-1995')
INSERT INTO Deposit VALUES (104,'MADHURI','CHANDNI',1200,'17-Dec-1995')
INSERT INTO Deposit VALUES (105,'PRAMOD','M.G.ROAD',3000,'27-Mar-1996')
INSERT INTO Deposit VALUES (106,'SANDIP','ANDHERI',2000,'31-Mar-1996')
INSERT INTO Deposit VALUES (107,'SHIVANI','VIRAR',1000,'5-Sep-1995')
INSERT INTO Deposit VALUES (108,'KRANTI','NEHRU PLACE',5000,'2-Jul-1995')
INSERT INTO Deposit VALUES (109,'NAREN','POWAI',7000,'10-Aug-1995')


--Q1: List Names of Customers who are Depositors and have Same Branch City as that of SUNIL
SELECT C.Cname 
FROM CUSTOMER C 
WHERE C.CITY IN (
      SELECT B.CITY 
	  FROM BRANCH B 
	  WHERE B.Bname IN (
	        SELECT D.Bname 
			FROM Deposit D 
			WHERE D.Cname= 'SUNIL'))

--Q2: List All the Depositors Having Depositors Having Deposit in All the Branches where SUNIL is Having Account
SELECT D.Cname 
FROM Deposit D 
     JOIN BRANCH B
	 ON D.Bname = B.Bname
WHERE D.Bname IN (
      SELECT D.Bname
	  FROM Deposit D
	        JOIN BRANCH B 
			ON D.Bname=B.Bname 
	  WHERE D.Cname = 'SUNIL' )

--Q3: List the Names of Customers Living in the City where the Maximum Number of Depositors are Located
SELECT C.Cname
     , C.CITY
FROM CUSTOMER C 
WHERE C.CITY IN (
      SELECT C1.CITY 
	  FROM Deposit D 
	     JOIN CUSTOMER C1 
		 ON C1.Cname= D.Cname
      GROUP BY C1.CITY 
	  HAVING COUNT(D.Cname) >=ALL(
	         SELECT COUNT(D1.Cname) 
			 FROM Deposit D1 
			     JOIN CUSTOMER C2 
				 ON D1.Cname = C2.Cname 
				 GROUP BY C2.CITY) 

--Q4: List Names of Borrowers Having Deposit Amount Greater than 1000 and Loan Amount Greater than 2000
SELECT B.Cname
     , B.Amount
	 , D.Cname
	 , D.Amount 
FROM BORROW B 
   JOIN Deposit D 
   ON  D.Cname = B.Cname 
WHERE D.Amount > 1000 AND B.Amount > 2000

--Q5: List All the Customers Living in NAGPUR and Having the Branch City as MUMBAI or DELHI
SELECT C.Cname 
FROM CUSTOMER C
     JOIN Deposit D 
     ON C.Cname = D.Cname 
     JOIN BRANCH B
	 ON D.Bname = B.Bname
WHERE C.CITY = 'NAGPUR'
  AND B.CITY IN ('MUMBAI','DELHI')

--Q6: Count the Number of Customers Living in the City where Branch is Located 
SELECT COUNT(C.Cname) 
FROM CUSTOMER C 
JOIN BRANCH B 
ON C.CITY = B.CITY 

