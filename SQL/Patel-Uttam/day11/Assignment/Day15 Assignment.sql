USE [Day15 (USP)]


-- Assignment


 /*

-- Create a Store Procedure which will accept name of the customer as input parameter and product the following output, List Names of Customers who are Depositors and have Same Branch City as that of input parameter customer’s Name.

-- Create a Store Procedure which will accept name of the customer as input parameter and produce the following output List in JSON format, All the Depositors Having Depositors Having Deposit in All th e Branches where input parameter customer is Having an Account

-- Create a Store Procedure that will accept city name and returns the number of customers in that city.

-- Create a Store Procedure which will accept city of the customer as input parameter and product the following output List in JSON format List All the Customers Living in city provided in input parameter and Having the Branch City as MUMBAI or DELHI

-- Count the Number of Customers Living in the City where Branch is Located

-- Create a Procedure which will accept input in JSON parameter CustomerName,City, ACTNO,Branch,amount  
	And insert these record in the Deposit table. Before inserting some validation should be done like amount should be greater than 10Rs. and date should always be current date.

*/



-- Create a Store Procedure which will accept name of the customer as input parameter and product the following output, List Names of Customers 
-- who are Depositors and have Same Branch City as that of input parameter customer’s Name.

--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	GO
	ALTER PROCEDURE usp_ass_1 
	@name varchar(18)

	AS
	BEGIN
	
	SELECT Cname FROM Deposit d
	JOIN BRANCH b
	ON
	b.BNAME = d.Bname
	where B.CITY = (SELECT CITY FROM BRANCH WHERE BNAME=(SELECT Bname FROM Deposit WHERE Cname=@name))
	
	END
	GO

	--execute (usp_ass_1 <[customer_name] (input)>)
	usp_ass_1 'SANDIP' WITH RECOMPILE
	GO


--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


-- Create a Store Procedure which will accept name of the customer as input parameter and produce the following output List in JSON format,
-- All the Depositors Having Depositors Having Deposit in All the Branches where input parameter customer is Having an Account

--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	ALTER PROCEDURE usp_ass_2
	@name varchar(10)

	AS
	BEGIN

	SELECT Cname FROM Deposit WHERE Bname IN (SELECT Bname FROM Deposit WHERE Cname = @name) FOR JSON PATH

	END
	GO

	--execute (usp_ass_2 <[City_name] (input)>)
	usp_ass_2 'SANDIP'
	GO
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



-- Create a Store Procedure that will accept city name and returns the number of customers in that city.

--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	
	GO

	CREATE PROCEDURE usp_ass_3
	@city varchar(18)

	AS
	BEGIN

		RETURN(SELECT COUNT(Cname) FROM CUSTOMER WHERE CITY = @city)
		--OR

	END
	GO

	--execute (usp_ass_3 <[City_name (input)]>)
	DECLARE @c varchar(18)
	EXECUTE @c = usp_ass_3 'MUMBAI' 
	PRINT @c
	GO
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




-- Create a Store Procedure which will accept city of the customer as input parameter and product the 
-- following output List in JSON format List All the Customers Living in city provided in input parameter and Having the Branch City as MUMBAI or DELHI

--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	GO

	ALTER PROCEDURE usp_ass_4
	@city varchar(18),
	@jsonopen nvarchar(MAX) OUTPUT
	AS
	BEGIN

	SET @jsonopen =	(SELECT c.CNAME FROM BRANCH AS b
		JOIN Deposit AS d
		ON b.BNAME = d.Bname
		JOIN CUSTOMER AS c
		ON d.Cname=c.CNAME
		WHERE c.CITY=@city AND b.CITY IN ('MUMBAI','DELHI')  
		FOR JSON PATH )
	SELECT * FROM OPENJSON(@jsonopen)
	END
	GO

	--execute (usp_ass_4 <1.[City_name (input)] , 2. [Variable_name OUT]>)
	DECLARE @jsonout nvarchar(MAX)
	EXECUTE usp_ass_4 'MUMBAI' , @jsonout OUT
	SELECT * FROM  OPENJSON(@jsonout)
	GO



--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




-- Count the Number of Customers Living in the City where Branch is Located
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	ALTER PROCEDURE usp_ass_5
	

	AS
	BEGIN

	SELECT  COUNT(CNAME) AS 'No. of Customer' FROM CUSTOMER WHERE CITY IN (SELECT CITY FROM BRANCH) 

	END
	GO

	--execute (input not required)
	usp_ass_5 
	GO

--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





-- Create a Procedure which will accept input in JSON parameter CustomerName,City, ACTNO,Branch,amount
-- And insert these record in the Deposit table. Before inserting some validation should be done like amount should be greater than 10Rs. and date should always be current date.
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	-- create json file with customername , city , ACTNO ,branch,amount

		--SELECT CustomerName , City , ACTNO , Branch , Amount INTO Deposit_Ass_6 FROM (SELECT d.Cname AS 'CustomerName', b.CITY AS 'City' , d.ACTNO AS 'ACTNO', d.Bname AS 'Branch',d.Amount AS 'Amount',d.Adate AS 'Adate' FROM Deposit AS d
		--					JOIN BRANCH AS b
		--					ON d.Bname=b.BNAME) tbl
		SELECT * FROM Deposit_Ass_6
		--DELETE FROM Deposit_Ass_6
		--GO


	ALTER PROCEDURE usp_ass_6

	@jsonopen nvarchar(MAX)
	AS
	BEGIN

		PRINT @jsonopen

		INSERT INTO Deposit_Ass_6 (CustomerName , City ,ACTNO,Branch,Amount)
		SELECT CustomerName , City ,ACTNO,Branch,Amount FROM OPENJSON(@jsonopen)
		WITH (CustomerName varchar(15) '$.CustomerName',City varchar(15) '$.City',ACTNO VARCHAR(5) '$.ACTNO',Branch varchar(15) '$.Branch',Amount int '$.Amount',Adate DATE '$.Adate') WHERE Amount > 10 AND Adate = (SELECT CONVERT(DATE,GetDate()))
	END
	GO

	--execute (Execute all combine)
	
	-- to update date in Deposite table
	--UPDATE Deposit SET Adate = GetDate() WHERE ACTNO IN (101,106,104,109)	
	-- to create Json
	DECLARE @jsonopen nvarchar(MAX)
	SET @jsonopen =	 (SELECT * FROM (SELECT d.Cname AS 'CustomerName', b.CITY AS 'City' , d.ACTNO AS 'ACTNO', d.Bname AS 'Branch',d.Amount AS 'Amount',d.Adate AS 'Adate' FROM Deposit AS d
							JOIN BRANCH AS b
							ON d.Bname=b.BNAME) cte1 FOR JSON PATH)

	-- execute procedure (usp_ass_6 <1.[Variable_name1 OUT] , 2.[Variable_name2 OUT] >)
		EXEC usp_ass_6 @jsonopen=@jsonopen
	GO
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




		--INSERT INTO Deposit_Ass_6 (CustomerName , City ,ACTNO,Branch,Amount)
		--SELECT CustomerName , City ,ACTNO,Branch,Amount FROM OPENJSON(@jsonopen)
		--WITH (CustomerName varchar(15) '$.Cname',City varchar(15) '$.CITY',ACTNO int '$.ACTNO',Branch varchar(15) '$.Bname',Amount int '$.Amount',Adate DATE '$.Adate') WHERE Amount >10 AND Adate = GetDate()
