-- STORED PROCEDURE ASSIGNMENT

-- 1. Q1: Create a Store Procedure which will accept name of the customer as input parameter and product the following output, List Names of Customers who are Depositors and have Same Branch City as that of input parameter customer’s Name.

DELIMITER &&
CREATE PROCEDURE customers(IN name VARCHAR(20))
BEGIN
	SELECT d1.Cname FROM deposit d1 INNER JOIN branch b1 ON d1.Bname = b1.Bname 
        WHERE b1.City IN(SELECT b2.City FROM deposit d2 INNER JOIN branch b2 ON d2.Bname = b2.Bname WHERE         	d2.Cname = name); 
END &&
DELIMITER ;

CALL customers('SUNIL');

-- 2. Create a Store Procedure which will accept name of the customer as input parameter and produce the following output List in JSON format, All the Depositors Having Depositors Having Deposit in All the Branches where input parameter customer is Having an Account

DELIMITER &&
CREATE PROCEDURE depositors1(IN name VARCHAR(20), OUT depositor JSON)
BEGIN
	
    SELECT JSON_OBJECT('DepositorName',(SELECT d.Cname FROM deposit d INNER JOIN branch b ON d.Bname = b.Bname 
    WHERE d.Bname IN(SELECT d.Bname FROM deposit d INNER JOIN branch b ON d.Bname = b.Bname WHERE d.Cname =         name)))INTO depositor;
    
END &&
DELIMITER ;

CALL depositors1('SUNIL',@x);
SELECT @x; 


-- 3. Create a Store Procedure that will accept city name and returns the number of customers in that city.

DELIMITER &&
CREATE PROCEDURE customerscount(IN cityname VARCHAR(30))
BEGIN
	SET @customercount = (SELECT COUNT(Cname) FROM customer WHERE city = cityname);
	SELECT @customercount;
END &&
DELIMITER ;

CALL customerscount('MUMBAI');


-- 4. Create a Store Procedure which will accept city of the customer as input parameter and product the following output List in JSON format List All the Customers Living in city provided in input parameter and Having the Branch City as MUMBAI or DELHI

DELIMITER &&
CREATE PROCEDURE customerjson(IN city VARCHAR(30), OUT customers JSON)
BEGIN
	SELECT JSON_OBJECT('CustomerName',(SELECT c.Cname FROM customer c INNER JOIN deposit d ON c.Cname =             d.Cname WHERE c.City = city AND d.Bname IN (SELECT b.Bname FROM branch b WHERE b.City IN                 ('MUMBAI','DELHI'))));
	
END &&
DELIMITER ;

CALL customerjson('NAGPUR',@x);
SELECT @x;


-- 5. Count the Number of Customers Living in the City where Branch is Located

DELIMITER &&
CREATE PROCEDURE customercity()
BEGIN
	SELECT COUNT(c.Cname) FROM customer c JOIN deposit d ON c.Cname = d.Cname JOIN branch b ON b.Bname = 	        d.Bname WHERE c.City = b.City;
END &&
DELIMITER ;

CALL customercity;


-- Q6: Create a Procedure which will accept input in JSON parameter CustomerName,City, ACTNO,Branch,amount.And insert these record in the Deposit table. Before inserting some validation should be done like amount should be greater than 10Rs. and date should always be current date.

-- create table deposit

CREATE TABLE DepositQ6
(
	Cname VARCHAR(50) NOT NULL,
    City VARCHAR(30) NOT NULL, 
    ACTNO INT PRIMARY KEY,
    Branch VARCHAR(30) NOT NULL,
    Amount NUMERIC NOT NULL CHECK(Amount > 10)
);

-- create procedure

DELIMITER &&
CREATE PROCEDURE spq6(IN details JSON)
BEGIN
	INSERT INTO Depositq6
        SELECT * FROM JSON_TABLE(details, '$[*]' 
	COLUMNS( 
																Cname VARCHAR(50) PATH '$.Cname',
																City VARCHAR(30) PATH '$.City', 
																ACTNO INT PATH '$.ACTNo',
																Branch VARCHAR(30) PATH '$.Branch',
																Amount NUMERIC PATH '$.Amount'
																)
                                ) AS tmp;
END &&
DELIMITER ;

-- call procedure

CALL spq6('[{"Cname":"Riya","City":"Ahmedabad","ACTNo":100,"Branch":"Jodhpur","Amount":6000}]');

SELECT * FROM depositq6;












