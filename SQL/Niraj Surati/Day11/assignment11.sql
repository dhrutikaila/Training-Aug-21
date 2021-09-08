USE DB_BANK
GO

--Q1: Create a Store Procedure which will accept name of the customer as input parameter and product the following output, List Names of Customers who are Depositors and have Same Branch City as that of input parameter customer’s Name.

CREATE PROCEDURE usp_customerscity
	@cname VARCHAR(18)
AS
BEGIN
	IF EXISTS(SELECT * 
			FROM CUSTOMER
			WHERE CName = @cname)
	BEGIN
		SET NOCOUNT ON
		DECLARE @city VARCHAR(18)
		SELECT @city= City 
		FROM CUSTOMER
		WHERE CName LIKE @cname

		SELECT D.CName
			,	B.BName
			,	B.City
		FROM DEPOSIT AS D
			INNER JOIN BRANCH AS B
			ON D.BName = B.BName
		WHERE B.City = @city
		SET NOCOUNT OFF
	END
END
GO

SELECT * FROM CUSTOMER
EXEC usp_customerscity 'Kranti'
GO

--Q2: Create a Store Procedure which will accept name of the customer as input parameter and produce the following output List in JSON format, All the Depositors Having Depositors Having Deposit in All the Branches where input parameter customer is Having an Account

CREATE PROCEDURE usp_customerscity_json
	@cname VARCHAR(18)
AS
BEGIN
	IF EXISTS(SELECT * 
			FROM CUSTOMER
			WHERE CName = @cname)
	BEGIN
		SET NOCOUNT ON
			SELECT *
			FROM DEPOSIT 
			WHERE BName IN(
				SELECT BName
				FROM DEPOSIT 
				WHERE CName = @cname
				UNION
				SELECT BName
				FROM BORROW
				WHERE CName = @cname
			)
			FOR JSON PATH 
		SET NOCOUNT OFF
	END
END
GO

EXEC usp_customerscity_json 'Kranti'
GO

--Q3: Create a Store Procedure that will accept city name and returns the number of customers in that city.

CREATE PROCEDURE usp_citycustomer
	@city VARCHAR(18) 
AS
BEGIN
	IF EXISTS(SELECT *
		FROM CUSTOMER
		WHERE CITY LIKE @city 
		)
	BEGIN
		SET NOCOUNT ON

		SELECT *
		FROM CUSTOMER
		WHERE CITY LIKE @city 

		SET NOCOUNT OFF
	END
	ELSE
		PRINT 'No customers in specified city.'
END
GO

EXEC usp_citycustomer 'Mumbai'
GO

--Q4: Create a Store Procedure which will accept city of the customer as input parameter and product the following output List in JSON format List All the Customers Living in city provided in input parameter and Having the Branch City as MUMBAI or DELHI


CREATE PROCEDURE usp_citycustomer_json
	@city VARCHAR(18) 
AS
BEGIN
	IF EXISTS(SELECT *
		FROM CUSTOMER
		WHERE CITY LIKE @city 
		)
	BEGIN
		SET NOCOUNT ON

		SELECT  C.CName AS 'Customer Name'
			,	C.City AS 'Customer City'
			,	Br.City AS 'Branch City'
		FROM CUSTOMER AS C
			LEFT JOIN DEPOSIT AS D
				ON C.CName = D.CName
			LEFT JOIN BORROW AS B
				ON C.CName = B.CName
			INNER JOIN BRANCH AS BR
				ON B.BName =  BR.BName
					OR D.BName = BR.BName
		WHERE C.CITY LIKE @city 
			AND BR.City IN('MUMBAI', 'DELHI')
		FOR JSON PATH

		SET NOCOUNT OFF
	END
	ELSE
		PRINT 'No customers in specified city.'
END
GO

EXEC usp_citycustomer_json 'Nagpur'
GO


--Q5: Count the Number of Customers Living in the City where Branch is Located

CREATE PROCEDURE usp_countcust
	@branch VARCHAR(18)
AS
BEGIN
	IF EXISTS(SELECT *
		FROM BRANCH
		WHERE City LIKE @branch
	)
	BEGIN
		SELECT COUNT(*) AS 'No of customer'
		FROM CUSTOMER AS C
			INNER JOIN DEPOSIT AS D
				ON C.CName = D.CName
			INNER JOIN BORROW AS B
				ON C.CName = B.CName
		WHERE City = @branch
			 
	END
END
GO

EXEC usp_countcust 'Nagpur'
GO

--Q6: Create a Procedure which will accept input in JSON parameter CustomerName,City, ACTNO,Branch,amount And insert these record in the Deposit table. Before inserting some validation should be done like amount should be greater than 10Rs. and date should always be current date.

CREATE PROCEDURE usp_deposit_valid
	@deposit_data NVARCHAR(MAX)
AS
BEGIN
	IF(ISJSON(@deposit_data)=1)
	BEGIN 
		SET NOCOUNT OFF
			INSERT INTO DEPOSIT
			SELECT *
			FROM OPENJSON(@deposit_data)
			WITH(
				ACTNO VARCHAR(5) 'strict $.ACTNO'
			,	CName VARCHAR(18) 'strict $.Cname'
			,	BName VARCHAR(18) 'strict $.Bname'
			,	Amount INT 'strict $.Amount'
			,	Adate DATE 'strict $.Adate'
			) AS Temp
		SET NOCOUNT ON
	END
	ELSE
		PRINT 'Json is not proper.'
END
GO
