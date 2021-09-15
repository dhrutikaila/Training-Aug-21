CREATE TABLE branch
(
    Bname varchar(18) PRIMARY KEY,
    City varchar(18)
);

CREATE TABLE customer
(
    Cname varchar(19) PRIMARY KEY,
    City varchar(18)
);

CREATE TABLE borrow
(
    LoanNo varchar(5) PRIMARY KEY,
    Cname varchar(18),
    Bname varchar(18),
    Amount int,
    FOREIGN KEY(Bname) REFERENCES branch(Bname),
    FOREIGN KEY(Cname) REFERENCES customer(Cname)
);

CREATE TABLE deposit
(
    ActNo varchar(5) PRIMARY KEY,
    Cname varchar(18),
    Bname varchar(18),
    Amount int,
    Adate date,
    FOREIGN KEY(Bname) REFERENCES branch(Bname),
    FOREIGN KEY(Cname) REFERENCES customer(Cname)
);

/*Q1: List Names of Customers who are Depositors and have Same Branch City as that of SUNIL*/ 

SELECT d.Cname,d.Bname,b.City FROM deposit d INNER JOIN branch b ON d.Bname = b.Bname WHERE b.City IN(SELECT b.City FROM deposit d INNER JOIN branch b ON d.Bname = b.Bname WHERE d.Cname = 'SUNIL');

/*Q2: List All the Depositors Having Depositors Having Deposit in All the Branches where SUNIL is Having Account*/ 

SELECT d.Cname,d.Bname FROM deposit d INNER JOIN branch b ON d.Bname = b.Bname WHERE d.Bname IN(SELECT d.Bname FROM deposit d INNER JOIN branch b ON d.Bname = b.Bname WHERE d.Cname='SUNIL');

/*Q3: List the Names of Customers Living in the City where the Maximum Number of Depositors are Located */

SELECT c1.Cname FROM customer c1 WHERE c1.City IN (SELECT c2.City FROM deposit d1, customer c2 WHERE c2.Cname = d1.Cname GROUP BY c2.City HAVING COUNT(d1.Cname) >= ALL (SELECT COUNT(d2.Cname) FROM deposit d2,customer c3 WHERE d2.Cname = c3.Cname GROUP BY c3.City)); 

/*Q4: List Names of Borrowers Having Deposit Amount Greater than 1000 and Loan Amount Greater than 2000*/ 

SELECT b.Cname FROM borrow b INNER JOIN deposit d ON b.Cname = d.Cname WHERE d.Amount > 1000 AND b.Amount > 2000;


/*Q5: List All the Customers Living in NAGPUR and Having the Branch City as MUMBAI or DELHI*/

SELECT c.Cname FROM customer c INNER JOIN deposit d ON c.Cname = d.Cname WHERE c.City = 'NAGPUR' AND d.Bname IN (SELECT b.Bname FROM branch b WHERE b.City IN ('MUMBAI','DELHI'));


/*Q6: Count the Number of Customers Living in the City where Branch is Located*/ 

SELECT COUNT(c.Cname) FROM customer c JOIN deposit d ON c.Cname = d.Cname JOIN branch b ON b.Bname = d.Bname WHERE c.City = b.City;

