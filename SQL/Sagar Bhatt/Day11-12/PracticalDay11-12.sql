USE Day6_August17

SELECT * 
FROM Customer
SELECT * 
FROM Branch
SELECT * 
FROM Deposit
SELECT * 
FROM Borrow
GO

--Q1: Create a Store Procedure which will accept name of the customer as input parameter and product the following output, List Names of Customers who are Depositors and have Same Branch City as that of input parameter customer’s Name.
CREATE PROCEDURE uspCustomerDepositorsCity 
	@CName VARCHAR(50)
AS
BEGIN
	IF EXISTS(SELECT * 
				FROM CUSTOMER
				WHERE CName = @CName)
	BEGIN
		SET NOCOUNT ON
		DECLARE @City VARCHAR(50) = (SELECT City FROM Customer WHERE CName LIKE @CName)
		SELECT d.CName
			, b.BName
			, b.City
		FROM Deposit d
		INNER JOIN Branch b ON d.BName = b.BName
		WHERE b.City = @City
		SET NOCOUNT OFF
	END
	ELSE
		PRINT 'No customer found named: ' + @CName
END

EXEC uspCustomerDepositorsCity 'MADHURI'

DROP PROCEDURE uspCustomerDepositorsCity
GO

--Q2: Create a Store Procedure which will accept name of the customer as input parameter and produce the following output List in JSON format, All the Depositors Having Depositors Having Deposit in All the Branches where input parameter customer is Having an Account
CREATE PROCEDURE uspCustomerDepositorsBranchJson
	@CName VARCHAR(50)
AS
BEGIN
	IF EXISTS(SELECT * 
				FROM CUSTOMER
				WHERE CName = @CName)
	BEGIN
		SET NOCOUNT ON
		SELECT *
		FROM Deposit
		WHERE BName IN
			(SELECT BName
			FROM Deposit
			WHERE CName = @CName
			UNION
			SELECT BName
			FROM BORROW
			WHERE CName = @CName)

		SET NOCOUNT OFF
	END
	ELSE
		PRINT 'No customer found named: ' + @CName
END

EXEC uspCustomerDepositorsBranchJson 'MADHURI'

DROP PROCEDURE uspCustomerDepositorsBranchJson
GO

--Q3: Create a Store Procedure that will accept city name and returns the number of customers in that city.
CREATE PROCEDURE uspCityCustomer
	@City VARCHAR(50) 
AS
BEGIN
	IF EXISTS(SELECT *
		FROM Customer
		WHERE City LIKE @City)
	BEGIN
		SET NOCOUNT ON
		SELECT *
		FROM Customer
		WHERE City LIKE @City 
		SET NOCOUNT OFF
	END
	ELSE
		PRINT 'No customers in specified city named: ' + @City
END

EXEC uspCityCustomer 'Mumbai'

DROP PROCEDURE uspCityCustomer
GO

--Q4: Create a Store Procedure which will accept city of the customer as input parameter and product the following output List in JSON format List All the Customers Living in city provided in input parameter and Having the Branch City as MUMBAI or DELHI
CREATE PROCEDURE uspCityCustomeRJson
	@City VARCHAR(50) 
AS
BEGIN
	IF EXISTS(SELECT *
		FROM Customer
		WHERE City LIKE @City)
	BEGIN
		SET NOCOUNT ON
		SELECT  c.CName AS 'CustomerName'
			,	c.City AS 'CustomerCity'
			, br.City AS 'BranchCity'
		FROM Customer AS c
			LEFT JOIN Deposit AS d ON c.CName = d.CName
			LEFT JOIN Borrow AS b ON c.CName = b.CName
			INNER JOIN Branch AS br ON b.BName =  br.BName OR d.BName = br.BName
		WHERE c.City LIKE @City 
			AND br.City IN('MUMBAI', 'DELHI')
		FOR JSON AUTO
		SET NOCOUNT OFF
	END
	ELSE
		PRINT 'No customers in specified city named: ' + @City
END
GO

EXEC uspCityCustomeRJson 'Nagpur'

DROP PROCEDURE uspCityCustomeRJson
GO

--Q5: Count the Number of Customers Living in the City where Branch is Located
CREATE PROCEDURE uspCountCustomer
AS
BEGIN
    SELECT b.BName
		, b.City
		, COUNT(*) AS 'No of customer'
    FROM Customer AS c
        INNER JOIN Branch b ON c.City = b.City
		GROUP BY b.BName, b.City
END
GO
 
EXEC uspCountCustomer

DROP PROCEDURE uspCountCustomer
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
            ,    CName VARCHAR(18) 'strict $.Cname'
            ,    BName VARCHAR(18) 'strict $.Bname'
            ,    Amount INT N'strict $.Amount'
            ,    Adate DATE 'strict $.Adate'
            ) AS Temp
        SET NOCOUNT ON
    END
    ELSE
        PRINT 'Json is not proper.'
END
GO

