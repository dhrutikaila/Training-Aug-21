--Q1: Create a Store Procedure which will accept name of the customer as input parameter and product 
--the following output, List Names of Customers who are Depositors and have Same Branch City as that of 
--input parameter customer’s Name.

CREATE PROCEDURE spGetCustomerWithCityOfBranch
@FirstName NVARCHAR(50)
AS
BEGIN

SELECT * FROM BRANCH AS b
		 JOIN Deposit AS d
		 ON d.Bname = b.BNAME
		 WHERE b.CITY IN
		 (SELECT b1.CITY FROM BRANCH AS b1
				 JOIN Deposit AS d1
				 ON d1.Bname = b1.BNAME
				 WHERE d1.Cname = @FirstName)

END

EXEC spGetCustomerWithCityOfBranch 'MADHURI'



--Q2: Create a Store Procedure which will accept name of the customer as input parameter and 
--produce the following output List in JSON format, All the Depositors Having Depositors Having Deposit 
--in All the Branches where input parameter customer is Having an Account

CREATE PROCEDURE SpGetCustomerInJson
@Name NVARCHAR(20)
AS
BEGIN

SELECT * FROM Deposit AS d1
		 JOIN Deposit AS d2
		 ON d1.Cname = d2.Cname
		 WHERE d1.Bname IN (SELECT Bname FROM Deposit WHERE Cname = @Name) FOR JSON AUTO 

END

EXEC SpGetCustomerInJson 'KRANTI'



--Q3: Create a Store Procedure that will accept city name and returns the number of customers in that city.

CREATE PROCEDURE spGetCustomerInCity
AS
BEGIN
SELECT CITY, COUNT(CITY) AS [Number of Customers]
			FROM CUSTOMER
		    GROUP BY CITY
			ORDER BY [Number of Customers] DESC
END

EXEC spGetCustomerInCity



--Q4: Create a Store Procedure which will accept city of the customer as input parameter and product 
--the following output List in JSON format List All the Customers Living in city provided in input 
--parameter and Having the Branch City as MUMBAI or DELHI

CREATE PROCEDURE spGetCustomerCityJson
@City VARCHAR(20)
AS
BEGIN
SELECT c.CNAME FROM CUSTOMER AS c
		JOIN Deposit AS d 
		ON c.CNAME = d.Cname
		JOIN BRANCH AS b
		ON b.BNAME = d.Bname
		WHERE c.CITY= @City AND b.CITY IN ('MUMBAI', 'DELHI') FOR JSON PATH
END

EXEC spGetCustomerCityJson 'NAGPUR'



--Q5: Count the Number of Customers Living in the City where Branch is Located

CREATE PROCEDURE spGetNumberOfCustomers
AS
BEGIN
	SELECT COUNT(c.CNAME) AS [Number of Customers],c.CITY
			FROM CUSTOMER AS c
			WHERE c.CITY IN (SELECT b.CITY FROM BRANCH AS b) 
			GROUP BY c.CITY
END		

EXEC spGetNumberOfCustomers


--Q6: Create a Procedure which will accept input in JSON parameter CustomerName,City, ACTNO,Branch,amount 
--And insert these record in the Deposit table. Before inserting some validation should be done like 
--amount should be greater than 10Rs. and date should always be current date.

CREATE TABLE DepositTable
(
			ACTNO INT ,
			CustomerName VARCHAR(20),
			City VARCHAR(15) ,
			Branch VARCHAR(15) ,
			[Date] DATE,
			amount DECIMAL(8,0),
			CHECK(amount>10)
			
)


CREATE PROCEDURE spGetCustomerDetilsJson
@Json NVARCHAR(MAX)
AS
BEGIN
		SELECT * INTO  DepositTable FROM ( 
		SELECT ACTNO,CustomerName,City,Branch,amount,[Date] = GETDATE()  
		FROM OPENJSON(@Json)
		WITH
		(
			ACTNO INT '$.ACTNO',
			CustomerName VARCHAR(20) '$.CustomerName',
			City VARCHAR(15) '$.City ',
			Branch VARCHAR(15) '$.Branch ',
			amount DECIMAL(8,0) '$.amount '
		)) TEMP
END

DECLARE @JsonData NVARCHAR(MAX)
SET @JsonData ='[{
					"ACTNO":10 ,
					"CustomerName": "Steven",
					"City": "New YORK" ,
					"Branch": "M.G.ROAD",
					"amount": 120000
				  },
				  {
					"ACTNO":11 ,
					"CustomerName":"Diana" ,
					"City":"South Brunswick",
					"Branch":"New Jersey",
					"amount":"52000" 
				  },
				  {
					"ACTNO":12 ,
					"CustomerName":"Alexander" ,
					"City":"Texas",
					"Branch":"Southlake",
					"amount":"80000" 
				  }
]'

EXEC spGetCustomerDetilsJson @Json = @JsonData 

SELECT * FROM DepositTable


