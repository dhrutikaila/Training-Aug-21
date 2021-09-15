USE AdventureWorksLT2012;  
GO  
-- Create and open a global named cursor that  
-- is visible outside the batch.  
DECLARE abc CURSOR GLOBAL SCROLL FOR  
    SELECT * FROM SalesLT.Customer;  
OPEN abc;  
GO  
-- Reference the named cursor with a cursor variable.  
DECLARE @MyCrsrRef1 CURSOR;  
SET @MyCrsrRef1 = abc;  
-- Now deallocate the cursor reference.  
DEALLOCATE @MyCrsrRef1;  
-- Cursor abc still exists.  
FETCH NEXT FROM abc;  
GO  
-- Reference the named cursor again.  
DECLARE @MyCrsrRef2 CURSOR;  
SET @MyCrsrRef2 = abc;  
-- Now deallocate cursor name abc.  
DEALLOCATE abc;  
-- Cursor still exists, referenced by @MyCrsrRef2.  
FETCH NEXT FROM @MyCrsrRef2;  
-- Cursor finally is deallocated when last referencing  
-- variable goes out of scope at the end of the batch.  
GO  
-- Create an unnamed cursor.  
DECLARE @MyCursor CURSOR;  
SET @MyCursor = CURSOR LOCAL SCROLL FOR  
SELECT * FROM SalesLT.CustomerAddress;  
-- The following statement deallocates the cursor  
-- because no other variables reference it.  
DEALLOCATE @MyCursor;  
GO

--1 OPEN
SET nocount on
DECLARE Employee_Cursor CURSOR FOR  
SELECT LastName, FirstName  
FROM AdventureWorksLT2012.SalesLT.Customer  
WHERE LastName like 'B%';  
  
OPEN Employee_Cursor;  
  
FETCH NEXT FROM Employee_Cursor;  
WHILE @@FETCH_STATUS = 0  
BEGIN  
    FETCH NEXT FROM Employee_Cursor  
END;  
 SET NOCOUNT OFF 
CLOSE Employee_Cursor;  
DEALLOCATE Employee_Cursor;

--2 FATCH Using FETCH in a simple cursor
USE AdventureWorksLT2012;  
GO  
DECLARE contact_cursor CURSOR FOR  
SELECT LastName FROM SalesLT.Customer  
WHERE LastName LIKE 'B%'  
ORDER BY LastName;  
  
OPEN contact_cursor;  
  
-- Perform the first fetch.  
FETCH NEXT FROM contact_cursor;  
  
-- Check @@FETCH_STATUS to see if there are any more rows to fetch.  
WHILE @@FETCH_STATUS = 0  
BEGIN  
   -- This is executed as long as the previous fetch succeeds.  
   FETCH NEXT FROM contact_cursor;  
END  
  
CLOSE contact_cursor;  
DEALLOCATE contact_cursor;  
GO

-- PR1
SET NOCOUNT ON
DECLARE @ID INT ,@NAME VARCHAR(50),@SALARY INT
DECLARE cur_emp CURSOR
STATIC FOR
SELECT EmployeeID,Firstname,salary
from Employee
open cur_emp
IF @@CURSOR_ROWS>0
BEGIN
FETCH NEXT FROM cur_emp INTO @ID,@NAME,@SALARY
WHILE @@FETCH_STATUS=0
BEGIN
PRINT 'ID:'+ CONVERT(VARCHAR(20),@ID)+',Name :'+@name+',Salary:'+CONVERT(VARCHAR(20),@Salary)
FETCH NEXT FROM cur_emp INTO @ID,@NAME,@SALARY
END
END
CLOSE cur_emp
DEALLOCATE cur_emp
SET NOCOUNT OFF

-- 1 - Declare Variables
-- * UPDATE WITH YOUR SPECIFIC CODE HERE *
DECLARE @nam VARCHAR(50) -- database name 
DECLARE @path VARCHAR(256) -- path for backup files 
DECLARE @fileName VARCHAR(256) -- filename for backup 
DECLARE @fileDate VARCHAR(20) -- used for file name 

-- Initialize Variables
-- * UPDATE WITH YOUR SPECIFIC CODE HERE *
SET @path = 'C:\Backup\' 

SELECT @fileDate = CONVERT(VARCHAR(20),GETDATE(),112) 

-- 2 - Declare Cursor
DECLARE db_cursor CURSOR FOR 
-- Populate the cursor with your logic
-- * UPDATE WITH YOUR SPECIFIC CODE HERE *
SELECT name 
FROM MASTER.dbo.sysdatabases 
WHERE name NOT IN ('master','model','msdb','tempdb') 

-- Open the Cursor
OPEN db_cursor

-- 3 - Fetch the next record from the cursor
FETCH NEXT FROM db_cursor INTO @nam  

-- Set the status for the cursor
WHILE @@FETCH_STATUS = 0  
 
BEGIN  
	-- 4 - Begin the custom business logic
	-- * UPDATE WITH YOUR SPECIFIC CODE HERE *
   	SET @fileName = @path + @nam + '_' + @fileDate + '.BAK' 
  	BACKUP DATABASE @name TO DISK = @fileName 

	-- 5 - Fetch the next record from the cursor
 	FETCH NEXT FROM db_cursor INTO @nam
END 

-- 6 - Close the cursor
CLOSE db_cursor  

-- 7 - Deallocate the cursor
DEALLOCATE db_cursor 


--Modify
ALTER PROCEDURE Purchasing.uspVendorAllInfo  
    @Product varchar(25)   
AS  
    SET NOCOUNT ON;  
    SELECT LEFT(v.Name, 25) AS Vendor, LEFT(p.Name, 25) AS 'Product name',   
    'Rating' = CASE v.CreditRating   
        WHEN 1 THEN 'Superior'  
        WHEN 2 THEN 'Excellent'  
        WHEN 3 THEN 'Above average'  
        WHEN 4 THEN 'Average'  
        WHEN 5 THEN 'Below average'  
        ELSE 'No rating'  
        END  
    , Availability = CASE v.ActiveFlag  
        WHEN 1 THEN 'Yes'  
        ELSE 'No'  
        END  
    FROM Purchasing.Vendor AS v   
    INNER JOIN Purchasing.ProductVendor AS pv  
      ON v.BusinessEntityID = pv.BusinessEntityID   
    INNER JOIN Production.Product AS p   
      ON pv.ProductID = p.ProductID   
    WHERE p.Name LIKE @Product  
    ORDER BY v.Name ASC;  
GO