--call procedure from another procedure
ALTER PROCEDURE spCallAnotherProcedure
@CityNAME VARCHAR(20)='MUMBAI'
AS 
BEGIN 
	DECLARE @CNAME VARCHAR(20)
	SET @CNAME = @CityNAME
   IF @CNAME IS NOT NULL
		EXECUTE spGetNumberOfCustomerWhoHavingBranchCity @CityName = @CNAME
   ELSE
	    PRINT 'ENTER CITY NAME'
END

--DEFALUT CITY NAME IS MUMBAI : EXECUTE spCallAnotherProcedure
--EXECUTE spCallAnotherProcedure @CityName='NAGPUR'

-- UDF
    -- Create User-defined Functions
		CREATE FUNCTION udfCountCustomer()
		RETURNS INT 
		AS 
		BEGIN 
		    return (SELECT COUNT(CNAME)
			FROM CUSTOMER)
		END
		--EXECUTE:
			--DECLARE @CountCustomer int 
			--set @CountCustomer = dbo.udfCountCustomer()
			--print @CountCustomer

    -- Scalar Functions
		USE AdventureWorks2019;

		CREATE FUNCTION dbo.ufnGetInventoryStock(@ProductID int)  
		RETURNS int   
		AS   
		
		BEGIN  
			DECLARE @ret int;  
			SELECT @ret = SUM(p.Quantity)   
			FROM Production.ProductInventory p   
			WHERE p.ProductID = @ProductID   
				AND p.LocationID = '6';  
			 IF (@ret IS NULL)   
				SET @ret = 0;  
			RETURN @ret;  
		END; 
		--EXECUTE:
			--DECLARE @CountSTOCK int 
			--set @CountSTOCK = dbo.ufnGetInventoryStock(200)
			--print @CountSTOCK

    -- Table-Valued Functions
	CREATE FUNCTION dbo.ufn_GetCustomerReport ()  
	RETURNS @REPORT TABLE   
	(  
		ACTNO int primary key NOT NULL,  
		Cname nvarchar(25) NOT NULL,  
		Bname nvarchar(25) NOT NULL,  
		AMOUNT money NOT NULL
	)  
	AS  
	BEGIN
		WITH Cust_Report(ActNO,CName,BName,Amount,Adate)
		AS
		(
			SELECT ACTNO,CNAME,BNAME,AMOUNT,ADATE FROM DEPOSIT
		)
	 INSERT @REPORT  
		SELECT ActNO,CName,BName,Amount  
		FROM Cust_Report   
		RETURN
	END;
	--EXECUTE:
	      --SELECT * FROM dbo.ufn_GetCustomerReport();



    -- Drop Function
		DROP FUNCTION udfCountCustomer

    -- Alter Function
		ALTER FUNCTION udfCountCustomer(@CityName VARCHAR(20))
		RETURNS INT 
		AS 
		BEGIN 
		    return (SELECT COUNT(CNAME)
			FROM CUSTOMER WHERE CNAME = @CityName )
		END
		--EXECUTE:
			--DECLARE @CountCustomer int 
			--set @CountCustomer = dbo.udfCountCustomer('MUMBAI')
			--print @CountCustomer

	 -- Limitation and restriction of User-defined Functions
		--User-defined functions cannot be used to perform actions that modify the 
			--database state.

		--User-defined functions cannot contain an OUTPUT INTO clause that has a table 
			--as its target.

		--User-defined functions can not return multiple result sets. Use a stored 
			--procedure if you need to return multiple result sets.

		--Error handling is restricted in a user-defined function. A UDF does not 
			--support TRY...CATCH, @ERROR or RAISERROR.

		--User-defined functions cannot call a stored procedure, but can call an extended 
			--stored procedure.

		--User-defined functions cannot make use of dynamic SQL or temp tables. Table 
			--variables are allowed.

		--SET statements are not allowed in a user-defined function.

		--The FOR XML clause is not allowed.

		--User-defined functions can be nested; that is, one user-defined function can call another. The nesting level is incremented when the called function starts execution, and decremented when the called function finishes execution. User-defined functions can be nested up to 32 levels. Exceeding the maximum levels of nesting causes the whole calling function chain to fail. Any reference to managed code from a Transact-SQL user-defined function counts as one level against the 32-level nesting limit. Methods invoked from within managed code do not count against this limit.

		