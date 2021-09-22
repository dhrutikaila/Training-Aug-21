----- Create a Store Procedure which will accept name of the customer as input parameter and product the following output, List Names of Customers who are Depositors and have Same Branch City as that of input parameter customer’s Name.

DELIMITER && 
CREATE PROCEDURE CUSNAME(IN customername varchar(10))
BEGIN
	 SELECT d.Cname AS CUSTOMER
     FROM DEPOSITE d JOIN BRANCH b ON d.Bname=B.BNAME 
     WHERE CITY IN (SELECT CITY FROM BRANCH 
     WHERE BNAME IN (SELECT  Bname FROM DEPOSITE WHERE CNAME=@customername ))
END &&
DELIMITER ;

CALL CUSNAME('NAREN');

--- Create a Store Procedure which will accept name of the customer as input parameter and produce the following output List in JSON format, All the Depositors Having Depositors Having Deposit in All the Branches where input parameter customer is Having an Account

DELIMITER &&
CREATE PROCEDURE depositors1(IN name VARCHAR(20), OUT depositor JSON)
BEGIN
SELECT JSON_OBJECT (SELECT d.Cname FROM deposit d INNER JOIN branch b ON d.Bname = b.BNAME 
WHERE d.Bname IN(SELECT d.Bname FROM deposit d INNER JOIN branch b ON d.Bname = b.BNAME WHERE d.Cname =name))INTO depositor;    
END &&
DELIMITER ;
CALL depositors1('SUNIL',@x);
SELECT @x;

---Create a Store Procedure that will accept city name and returns the number of customers in that city.


DELIMITER && 
CREATE PROCEDURE CITYORNAME
BEGIN
	SELECT CITY,COUNT(CNAME) AS CUSTOMERNAME FROM CUSTOMER GROUP BY CITY
END &&
DELIMITER ;

CALL CITYORNAME

----Create a Store Procedure which will accept city of the customer as input parameter and product the following output List in JSON format List All the Customers Living in city provided in input parameter and Having the Branch City as MUMBAI or DELHI

DELIMITER && 
CREATE PROCEDURE CITYWITHCUSTOMER(IN cityname VARCHAR(50))
BEGIN
 SELECT JSON_OBJECT	(SELECT CNAME,CITY FROM CUSTOMER WHERE CITY = @cityname
AND 
CNAME
IN (SELECT Cname FROM DEPOSITE WHERE Bname IN (SELECT BNAME FROM BRANCH WHERE CITY IN ('MUMBAI','DELHI'))))
END &&
DELIMITER ;

CALL CITYWITHCUSTOMER('SURAT');


--- Count the Number of Customers Living in the City where Branch is Located


DELIMITER && 
CREATE PROCEDURE TOTALCUSTOMER(IN ID INT)
BEGIN
	(SELECT COUNT(CNAME) FROM CUSTOMER WHERE CITY IN (SELECT CITY FROM BRANCH) )
END &&
DELIMITER ;

CALL TOTALCUSTOMER;

