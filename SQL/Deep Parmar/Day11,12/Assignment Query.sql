--Q1: Create a Store Procedure which will accept name of the customer as input parameter and product the following output, List Names of Customers who are Depositors and 
--    have Same Branch City as that of input parameter customer’s Name.

	  CREATE PROCEDURE spCustomerDetails
	  @Name VARCHAR(18)
	  AS
	  BEGIN
			SET NOCOUNT ON
			SELECT DP.Cname FROM Deposit AS DP JOIN BRANCH AS BR ON DP.Bname=BR.BNAME
			WHERE BR.CITY=
			(SELECT BR.CITY FROM Deposit AS DP 
			JOIN BRANCH AS BR ON DP.Bname=BR.BNAME
			WHERE DP.Cname=@Name)
			SET NOCOUNT OFF
	  END
-- =============================================
-- EXECUTE [dbo].[spCustomerDetails] 'FIRSTNAME'
-- =============================================
	  EXECUTE spCustomerDetails 'SUNIL'

--Q2: Create a Store Procedure which will accept name of the customer as input parameter and produce the following output List in JSON format, 
--    All the Depositors Having Depositors Having Deposit in All the Branches where input parameter customer is Having an Account

	  CREATE PROCEDURE spDepositorsDetails
	  @Name VARCHAR(18),
	  @Depositor_Details NVARCHAR(MAX) OUTPUT
	  AS
	  BEGIN
			SET @Depositor_Details=(SELECT Cname FROM Deposit AS DP WHERE Bname IN (SELECT Bname FROM Deposit WHERE Cname=@Name) FOR JSON PATH)
	  END
-- =============================================
--DECLARE @DepositorDetails NVARCHAR(MAX)
--EXECUTE spDepositorsDetails 'FIRST NAME',@DepositorDetails OUTPUT
--SELECT @DepositorDetails
-- =============================================
	  DECLARE @DepositorDetails NVARCHAR(MAX)
	  EXECUTE spDepositorsDetails 'MEHUL',@DepositorDetails OUTPUT
	  SELECT @DepositorDetails AS DepositorsDetails

--Q3: Create a Store Procedure that will accept city name and returns the number of customers in that city.

	  CREATE PROCEDURE spCoustomerSameCity
	  @City VARCHAR(18)
	  AS
	  BEGIN
			RETURN(SELECT COUNT(CNAME) FROM CUSTOMER WHERE CITY=@City )
	  END
-- =============================================
--DECLARE @COUNT INT
--EXECUTE @COUNT= spCoustomerSameCity 'CITY NAME' 
--PRINT (@COUNT)
-- =============================================
	  DECLARE @COUNT INT
	  EXECUTE @COUNT= spCoustomerSameCity 'NAGPUR' 
	  PRINT ('Total_Employee is:' + CAST(@COUNT AS VARCHAR(10)))

--Q4: Create a Store Procedure which will accept city of the customer as input parameter and product the following output List in JSON format 
--    List All the Customers Living in city provided in input parameter and Having the Branch City as MUMBAI or DELHI

	  CREATE PROCEDURE spCoustomerBranchCity
	  @City VARCHAR(18),
	  @CUSTOMER_Details NVARCHAR(MAX) OUTPUT
	  AS
	  BEGIN
		SET @CUSTOMER_Details=(SELECT CUS.CNAME FROM CUSTOMER AS CUS WHERE CUS.CITY=@City AND   
								cus.CNAME IN (SELECT DP.Cname FROM Deposit AS DP 
								JOIN BRANCH AS BR ON DP.Bname=BR.BNAME
								WHERE BR.CITY='MUMBAI' OR BR.CITY='DELHI') FOR JSON PATH)
		END

-- =============================================
--DECLARE @CUSTOMERDetails NVARCHAR(MAX)
--EXECUTE spCoustomerBranchCity 'CITY NAME',@CUSTOMERDetails OUTPUT
--SELECT @CUSTOMERDetails
-- =============================================

		DECLARE @CUSTOMERDetails NVARCHAR(MAX)
		EXECUTE spCoustomerBranchCity 'NAGPUR',@CUSTOMERDetails OUTPUT
		SELECT @CUSTOMERDetails AS Customer_Name

--Q5: Count the Number of Customers Living in the City where Branch is Located

	  CREATE PROCEDURE spCoustomerCount
	  AS
	  BEGIN
			SELECT COUNT(CNAME) AS Total_Customers,CUS.CITY FROM CUSTOMER AS CUS 
			WHERE CUS.CITY IN (SELECT BR.CITY FROM BRANCH AS BR) GROUP BY CUS.CITY
	  END
-- =============================================
-- EXECUTE [dbo].[spCoustomerCount] 
-- =============================================
	  EXECUTE spCoustomerCount  

--Q6: Create a Procedure which will accept input in JSON parameter CustomerName,City, ACTNO,Branch,amount  
--    And insert these record in the Deposit table. Before inserting some validation should be done like amount should be greater than 10Rs. 
--    and date should always be current date.

	  CREATE PROCEDURE spInsertDeposit
	  @Customer_Details NVARCHAR(MAX)
	  AS
	  BEGIN
			INSERT INTO Deposit
			SELECT * FROM OPENJSON(@Customer_Details)
			WITH
			(
				ACTNO VARCHAR(5) '$.ACTNO',
				CustomerName VARCHAR(18) '$.Cname',
				Branch VARCHAR(18) '$.Bname',
				Amount INT '$.Amount',
				Adate DATE '$.Adate'
			)
	  END

DECLARE @CustomerDetails NVARCHAR(MAX)
SET @CustomerDetails=
'{
"ACTNO": "110",
"Cname": "MANDAR",
"Bname": "VRCE",
"Amount": 100,
"Adate": "1995-03-01"
}'

EXEC spInsertDeposit @CustomerDetails

-- =============================================
-- EXECUTE [dbo].[spInsertDeposit] 
-- =============================================	  