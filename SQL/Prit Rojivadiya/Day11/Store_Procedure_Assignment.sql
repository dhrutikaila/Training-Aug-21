use Demo

/*
Q1: Create a Store Procedure which will accept name of the customer as input parameter and product the following output, 
List Names of Customers who are Depositors and have Same Branch City as that of input parameter customer’s Name.
*/

CREATE PROCEDURE getCustomerName
@name varchar(30)
AS 
SELECT d.C_name FROM Deposit d
WHERE d.B_name IN (SELECT b.Bname FROM Branch b 
WHERE b.City IN (SELECT b.City FROM Branch b 
WHERE b.Bname IN (SELECT B_name FROM Deposit WHERE C_name = @name) UNION (SELECT B_name FROM BORROW WHERE C_name = @name)))

EXEC getCustomerName 'Sunil'
EXEC getCustomerName 'Shivani'



/*
Q2: Create a Store Procedure which will accept name of the customer as input parameter and produce the following output List in JSON 
format, All the Depositors Having Deposit in All the Branches where input parameter customer is Having an Account
*/

CREATE PROCEDURE jsonData
@name varchar(20)
AS
SELECT d.C_name FROM Deposit d
WHERE d.B_name IN (SELECT B_name FROM Deposit WHERE C_name = @name UNION SELECT B_name FROM BORROW WHERE C_name = @name)
FOR JSON PATH

EXEC jsonData 'Mehul'
EXEC jsonData 'Pramod'



/*
Q3: Create a Store Procedure that will accept city name and returns the number of customers in that city.
*/

CREATE PROCEDURE Cname
@cityName varchar(20)
AS
SELECT COUNT(Cname) as 'No of Customer',@cityName FROM Customer
WHERE City = @cityName

EXEC Cname 'Mumbai'
EXEC Cname 'Nagpur'



/*
Q4: Create a Store Procedure which will accept city of the customer as input parameter and product the following output List in JSON 
format List All the Customers Living in city provided in input parameter and Having the Branch City as MUMBAI or DELHI
*/

CREATE PROCEDURE Customer_City
@cityName varchar(20)
AS
SELECT c.Cname FROM Customer c
WHERE c.City = @cityName AND 
c.Cname IN (
			SELECT C_name FROM 
			(SELECT C_name,B_name FROM Deposit UNION SELECT C_name,B_name FROM BORROW)temp 
			WHERE B_name IN (SELECT B_name FROM Branch WHERE City IN ('Mumbai','Delhi'))
			)


EXEC Customer_City 'Nagpur'



/*
Q5: Count the Number of Customers Living in the City where Branch is Located
*/

CREATE PROCEDURE countCustomer
AS
SELECT COUNT(*) as 'TotalCustomer' FROM Customer
WHERE City IN (SELECT City FROM Branch)

EXEC countCustomer 



/*
Q6: Create a Procedure which will accept input in JSON parameter CustomerName,City, ACTNO,Branch,amount  
And insert these record in the Deposit table. Before inserting some validation should be done like 
amount should be greater than 10Rs. and date should always be current date.
*/

CREATE PROCEDURE insertRecord
@record nvarchar(max)
AS
IF (JSON_VALUE(@record,'$.Amount') > 10 AND JSON_VALUE(@record,'$.Adate') = CAST(GETDATE() as date))
	INSERT INTO Deposit VALUES (JSON_VALUE(@record,'$.ActNo'),JSON_VALUE(@record,'$.C_name'),JSON_VALUE(@record,'$.B_name'),JSON_VALUE(@record,'$.Amount'),JSON_VALUE(@record,'$.Adate'))
ELSE
	PRINT 'Enter valid data'

EXEC insertRecord '{"ActNo":109, "C_name":"Mandar","B_name":"powai","Amount":10000,"Adate":"2021-09-06" }'


-- OR


CREATE PROCEDURE insertRecord
@record nvarchar(max)
AS
INSERT INTO Deposit
SELECT * FROM OPENJSON(@record)
WITH
(
ActNO int '$.ActNo',
C_name varchar(20) '$.C_name',
B_name varchar(20) '$.B_name',
Amount int '$.Amount',
Adate date '$.Adate'
)


EXEC insertRecord '{"ActNo":109, "C_name":"Mandar","B_name":"powai","Amount":10000,"Adate":"2021-09-06" }'
