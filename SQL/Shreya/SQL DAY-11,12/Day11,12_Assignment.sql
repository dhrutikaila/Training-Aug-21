/*Q1: Create a Store Procedure which will accept name of the customer as input parameter and product the following output,
List Names of Customers who are Depositors and have Same Branch City as that of input parameter customer’s Name.*/

CREATE PROCEDURE sp_CustomerDetail
@cname VARCHAR(20)
AS
BEGIN
SELECT d.Cname,B.BNAME,B.CITY FROM Deposit d JOIN Branch b ON d.Bname=b.BNAME where b.CITY IN
(SELECT b.CITY
FROM Deposit d JOIN BRANCH b ON d.Bname=b.BNAME WHERE d.Cname=@cname )

END

EXEC sp_CustomerDetail 'Sunil'

/*Q2: Create a Store Procedure which will accept name of the customer as input parameter and produce the following output
List in JSON format, All the Depositors Having Depositors Having Deposit in All the Branches where input parameter customer 
is Having an Account*/

ALTER PROCEDURE sp_Depositors
@cusname VARCHAR(20)
AS
BEGIN
SELECT CNAME,Bname FROM Deposit WHERE BNAME =
 (SELECT BNAME FROM DEPOSIT WHERE Cname=@cusname) OR Bname=(SELECT BNAME FROM Borrow WHERE Cname=@cusname) FOR JSON PATH

END

EXEC sp_Depositors 'Sunil'

--Q3: Create a Store Procedure that will accept city name and returns the number of customers in that city.

CREATE PROCEDURE CountCus
@city VARCHAR(20)
AS
BEGIN

SELECT count(CNAME)'No of Customer' FROM Customer WHERE CITY=@city
END

EXEC CountCus 'Kolkata' 
EXEC CountCus 'Mumbai' 

/*Q4: Create a Store Procedure which will accept city of the customer as input parameter and product the 
following output List in JSON format List All the Customers Living in city provided in input parameter and 
Having the Branch City as MUMBAI or DELH*/
CREATE PROCEDURE ProQ4
@cityname VARCHAR(20)
AS
BEGIN

SELECT c.CNAME,d.Bname FROM  
Customer c JOIN Deposit d ON C.CNAME=D.Cname 
JOIN Branch b  ON  b.BNAME=d.Bname WHERE c.CITY=@cityname AND  b.CITY IN('MUMBAI','DELHI') FOR JSON PATH

END

EXEC ProQ4 'Nagpur'

--Q5: Count the Number of Customers Living in the City where Branch is Located
CREATE PROCEDURE Proc5 @CITY varchar(20)
AS
SELECT COUNT(*) FROM CUSTOMER
WHERE CITY IN (SELECT CITY FROM BRANCH WHERE CITY=@CITY)

EXEC Proc5 'mumbai'

/*Q6Create a Procedure which will accept input in JSON parameter CustomerName,City, ACTNO,Branch,amount
And insert these record in the Deposit table. Before inserting some validation should be done like amount should
be greater than 10Rs. and date should always be current date.*/
 
--create table
 
CREATE TABLE Depo(
 Name VARCHAR(50) NOT NULL,
CITY VARCHAR(20) NOT NULL,
ACTNO INT PRIMARY KEY,
BRANCH VARCHAR(50) NOT NULL,
AMOUNT MONEY NOT NULL CONSTRAINT VAL_ALLOWWED_CHK CHECK (AMOUNT>100)
)

 
--PROCEDURE
 
CREATE PROCEDURE sp_Q6

@json_inp NVARCHAR(MAX)
AS
INSERT INTO Depo(Name , CITY, ACTNO, BRANCH, AMOUNT) 
SELECT Name , CITY, ACTNO, BRANCH, AMOUNT FROM OPENJSON(@json_inp)
WITH
(
Name VARCHAR(50) '$.CustomerName',
CITY VARCHAR(20) '$.CITY',
ACTNO INT '$.ACTNO',
BRANCH VARCHAR(20) '$.BRANCH',
AMOUNT MONEY '$.AMOUNT'
)

 
--json variable
DECLARE @jsonvar NVARCHAR(MAX)
SET @jsonvar = N'{
          "CustomerName": "Shreya Thakkar",
          "CITY" :"Ahmedabad",
          "ACTNO" : 140,
          "BRANCH": "CSE",
          "AMOUNT": 20000
        }'
EXEC sp_Q6 @json_inp=@jsonvar

SELECT * FROM Depo

IF ISJSON(@jsonvar)>0
PRINT(1)
ELSE
PRINT(0)



--check json variable
 
 

 
SELECT * FROM Depo



