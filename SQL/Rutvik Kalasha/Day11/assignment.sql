/*Create a Store Procedure which will accept name of the customer as input parameter and product the following output, 
List Names of Customers who are Depositors and have Same Branch City as that of input parameter customers Name.*/

CREATE PROCEDURE spfirstquerie 
 @NAME VARCHAR(50)
AS
(
	SELECT d.cname FROM deposit d JOIN branch b ON d.bname=b.bname WHERE b.city=(SELECT city FROM branch WHERE bname=(SELECT bname FROM deposit WHERE cname=@NAME))  

)
DROP PROCEDURE spfirstquerie
EXEC spfirstquerie 'MEHUL'
	
/*Create a Store Procedure which will accept name of the customer as input parameter and produce the following output List in JSON format, 
All the Depositors Having Depositors Having Deposit in All the Branches where input parameter customer is Having an Account*/
CREATE PROCEDURE spsecondquerie 
 @NAME VARCHAR(50)
AS
	SELECT * FROM deposit  WHERE bname = (SELECT bname FROM deposit WHERE cname = @NAME) FOR JSON PATH
    EXEC spsecondquerie 'sunil'
    
--Create a Store Procedure that will accept city name and returns the number of customers in that city

CREATE PROCEDURE spthirdquerie @CITYNAME VARCHAR(50) 

AS
	SELECT count(*) FROM customer  WHERE CITY = @CITYNAME

EXEC spthirdquerie 'nagpur' 

/*Create a Store Procedure which will accept city of the customer as input parameter and product the following output 
List in JSON format List All the Customers Living in city provided in input parameter and Having the Branch City as MUMBAI or DELHI*/

CREATE PROCEDURE spfourquerie @CITY VARCHAR(20)
	AS 
	SELECT d.Cname FROM customer c JOIN deposit d ON c.cname=d.cname JOIN BRANCH b ON d.Bname=b.BNAME WHERE c.city=@CITY AND b.CITY IN('mumbai','delhi') for JSON PATH
    EXEC spfourquerie 'nagpur' 

--Count the Number of Customers Living in the City where Branch is Located

CREATE PROCEDURE spfivequerie 
AS

SELECT count(c.CNAME) FROM deposit d JOIN branch b ON d.Bname=b.BNAME JOIN CUSTOMER c ON d.Cname=c.cname WHERE c.CITY=b.city

EXEC spfivequerie  

--Create a Procedure which will accept input in JSON parameter CustomerName,City, ACTNO,Branch,amount  


CREATE PROCEDURE spsixquerie @JSON NVARCHAR(MAX)

AS 

INSERT INTO deposit 
SELECT * FROM OPENJSON(@json)
WITH
	(
	
	ACTNO VARCHAR(5) '$.ACTNO',
	Cname VARCHAR(19) '$.Cname',
	Bname VARCHAR(18) '$.Bname',
	Amount int  '$.amount',
	Adate DATE '$.adate'
)


EXEC spsixquerie @json='{"ACTNO":"136","Cname":"sunil","Bname":"ajni","Amount":5000,"Adate":"1996-01-04"}]'

SELECT * FROM deposit WHERE ACTNO=101 for JSON PATH
[{"ACTNO":"131","Cname":"sunil","Bname":"ajni","Amount":5000,"Adate":"1996-01-04"}]

