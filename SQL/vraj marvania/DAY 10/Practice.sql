-->CURSOR
--->Declare cursor
		-->
		DECLARE vend_cursor CURSOR  
		FOR SELECT * FROM Purchasing.Vendor  
		OPEN vend_cursor  
		FETCH NEXT FROM vend_cursor
		CLOSE vend_cursor
		DEALLOCATE vend_cursor


-->Fetch
--1> Using FETCH in a simple cursor
		USE AdventureWorks2012  
		GO  
		DECLARE contact_cursor CURSOR FOR  
		SELECT TOP 10 LastName FROM Person.Person  
		WHERE LastName LIKE 'B%'  
		ORDER BY LastName  
  
		OPEN contact_cursor  
  
		-- Perform the first fetch.  
		FETCH NEXT FROM contact_cursor  
  
		-- Check @@FETCH_STATUS to see if there are any more rows to fetch.  
		WHILE @@FETCH_STATUS = 0  
		BEGIN  
		   -- This is executed as long as the previous fetch succeeds.  
		   FETCH NEXT FROM contact_cursor  
		END  
  
		CLOSE contact_cursor  
		DEALLOCATE contact_cursor  
		GO

--2>Using FETCH to store values in variables
		USE AdventureWorks2012  
		GO  
		-- Declare the variables to store the values returned by FETCH.  
		DECLARE @LastName VARCHAR(50), @FirstName VARCHAR(50)  
        DECLARE contact_cursor CURSOR FOR  
		SELECT LastName, FirstName FROM Person.Person  
		WHERE LastName LIKE 'B%'  
		ORDER BY LastName, FirstName  
  
		OPEN contact_cursor  
  
		-- Perform the first fetch and store the values in variables.  
		-- Note: The variables are in the same order as the columns  
		-- in the SELECT statement.   
  
		FETCH NEXT FROM contact_cursor  
		INTO @LastName, @FirstName  
  
		-- Check @@FETCH_STATUS to see if there are any more rows to fetch.  
		WHILE @@FETCH_STATUS = 0  
		BEGIN  
  
		   -- Concatenate and display the current values in the variables.  
		   PRINT 'Contact Name: ' + @FirstName + ' ' +  @LastName  
  
		   -- This is executed as long as the previous fetch succeeds.  
		   FETCH NEXT FROM contact_cursor  
		   INTO @LastName, @FirstName  
		END  
  
		CLOSE contact_cursor  
		DEALLOCATE contact_cursor  
		GO


-->Open
-->The following example opens a cursor and fetches all the rows.

		DECLARE Employee_Cursor CURSOR FOR  
		SELECT LastName, FirstName  
		FROM AdventureWorks2012.HumanResources.vEmployee  
		WHERE LastName like 'B%'  
  
		OPEN Employee_Cursor  
  
		FETCH NEXT FROM Employee_Cursor  
		WHILE @@FETCH_STATUS = 0  
		BEGIN  
			FETCH NEXT FROM Employee_Cursor  
		END  
  
		CLOSE Employee_Cursor  
		DEALLOCATE Employee_Cursor


-->Deallocate


		USE AdventureWorks2012  
		GO  
		-- Create and open a global named cursor that  
		-- is visible outside the batch.  
		DECLARE abc CURSOR GLOBAL SCROLL FOR  
			SELECT * FROM Sales.SalesPerson  
		OPEN abc  
		GO  
		-- Reference the named cursor with a cursor variable.  
		DECLARE @MyCrsrRef1 CURSOR  
		SET @MyCrsrRef1 = abc  
		-- Now deallocate the cursor reference.  
		DEALLOCATE @MyCrsrRef1  
		-- Cursor abc still exists.  
		FETCH NEXT FROM abc  
		GO  
		-- Reference the named cursor again.  
		DECLARE @MyCrsrRef2 CURSOR  
		SET @MyCrsrRef2 = abc  
		-- Now deallocate cursor name abc.  
		DEALLOCATE abc  
		-- Cursor still exists, referenced by @MyCrsrRef2.  
		FETCH NEXT FROM @MyCrsrRef2  
		-- Cursor finally is deallocated when last referencing  
		-- variable goes out of scope at the end of the batch.  
		GO  
		-- Create an unnamed cursor.  
		DECLARE @MyCursor CURSOR  
		SET @MyCursor = CURSOR LOCAL SCROLL FOR  
		SELECT * FROM Sales.SalesTerritory  
		-- The following statement deallocates the cursor  
		-- because no other variables reference it.  
		DEALLOCATE @MyCursor  
GO


--EXTRA EV CHARGING STATION CAL AMOUNT

 --USING ROW_NUMBER  
   
    SELECT * INTO SessionRecord1  
	FROM (SELECT ROW_NUMBER() OVER(ORDER BY SessionID asc)as [ROW] ,* 
	      FROM SessionRecord )TEMP

	DECLARE @STEMP INT
	SET @STEMP=1
	while @STEMP<=(SELECT COUNT(SessionID)FROM SessionRecord)
	BEGIN
		DECLARE @AmountTEMP money,@PortNO int 
		SET @PortNO=(select PortID FROM SessionRecord1 where [ROW] = @STEMP)
		SET @AmountTEMP=(SELECT ChargesPerKWH FROM ConnectionPort WHERE PortID= @PortNO)
		UPDATE SessionRecord
		SET Amount=Units*@AmountTEMP
		WHERE SessionID=@STEMP
		SET @STEMP= @STEMP + 1
	END
	GO


	SELECT * FROM SessionRecord

--USING CURSOR

DECLARE @SessionID int ,@Amount MONEY,@Units decimal,@PortID int 
DECLARE CU2 CURSOR
STATIC FOR 
SELECT SessionID,Amount,Units,PortID FROM SessionRecord
OPEN CU2
	IF @@CURSOR_ROWS>0
	BEGIN
	FETCH NEXT FROM CU2 INTO  @SessionID,@Amount,@Units,@PortID
		WHILE @@FETCH_STATUS=0
		BEGIN
        DECLARE @AmountTEMP INT
		SET @AmountTEMP=(SELECT ChargesPerKWH FROM ConnectionPort WHERE PortID=@PortID)
		UPDATE SessionRecord
		SET Amount=Units*@AmountTEMP
		WHERE SessionID=@SessionID
	    FETCH NEXT FROM CU2 INTO  @SessionID,@Amount,@Units,@PortID
		END
	END
CLOSE CU2
DEALLOCATE CU2