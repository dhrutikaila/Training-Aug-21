--Declare Cursor & open Cursor
DECLARE emp_cursor CURSOR  
FOR SELECT * FROM Employees
OPEN emp_cursor  
FETCH NEXT FROM emp_cursor

-- USE @@CURSOR_ROWS 
SELECT @@CURSOR_ROWS

--Close The Cursor
CLOSE emp_Cursor
FETCH NEXT FROM emp_cursor

--USE Scroll cursor
--Scroll locks used to protect the isolation of fetches are freed at DEALLOCATE
DECLARE abc SCROLL CURSOR FOR  
SELECT * FROM Departments  

--Declare Variable and set cursor
DECLARE @MyCrsrRef CURSOR 
SET @MyCrsrRef = abc
DEALLOCATE @MyCrsrRef



--Declare Cursor As variable
DECLARE @MyCursor CURSOR;  
SET @MyCursor = CURSOR LOCAL SCROLL FOR  
SELECT * FROM Departments; 

DEALLOCATE @MyCursor

SET @MyCursor = CURSOR LOCAL SCROLL FOR
SELECT * FROM Employees

--------------------------
-- Create and open a global named cursor that  
-- is visible outside the batch.  
DECLARE abc CURSOR GLOBAL SCROLL FOR  
    SELECT * FROM Employees  
OPEN abc  

-- Reference the named cursor with a cursor variable.  
DECLARE @MyCrsrRef1 CURSOR  
SET @MyCrsrRef1 = abc  
-- Now deallocate the cursor reference.  
DEALLOCATE @MyCrsrRef1  
-- Cursor abc still exists.  
FETCH NEXT FROM abc  


-- Reference the named cursor again.  
DECLARE @MyCrsrRef2 CURSOR   
SET @MyCrsrRef2 = abc   
-- Now deallocate cursor name abc.  
DEALLOCATE abc   
-- Cursor still exists, referenced by @MyCrsrRef2.  
FETCH NEXT FROM @MyCrsrRef2   
-- Cursor finally is deallocated when last referencing  
-- variable goes out of scope at the end of the batch.  
-- Create an unnamed cursor.  
DECLARE @MyCursor CURSOR 
SET @MyCursor = CURSOR LOCAL SCROLL FOR  
SELECT * FROM Employees  
-- The following statement deallocates the cursor  
-- because no other variables reference it.  
DEALLOCATE @MyCursor
---------------------------

---------------------------
DECLARE Emp_cursor CURSOR FOR  
SELECT LastName FROM Employees  
WHERE LastName LIKE 'B%'  
ORDER BY LastName  
  
OPEN Emp_cursor  
  
-- Perform the first fetch.  
FETCH NEXT FROM Emp_cursor  
  
-- Check @@FETCH_STATUS to see if there are any more rows to fetch.  
WHILE @@FETCH_STATUS = 0  
BEGIN  
   -- This is executed as long as the previous fetch succeeds.  
   FETCH NEXT FROM Emp_cursor  
END  
  
CLOSE Emp_cursor  
DEALLOCATE Emp_cursor  
-------------------------

--USING Fatch To Store Values in variable
---------------------------------------------------------------
-- Declare the variables to store the values returned by FETCH.  
DECLARE @LastName VARCHAR(50), @FirstName VARCHAR(50);  
  
DECLARE Emp1_cursor CURSOR FOR 
SELECT LastName, FirstName FROM Employees  
WHERE LastName LIKE 'B%'  
ORDER BY LastName, FirstName 
  
OPEN Emp1_cursor   
  
-- Perform the first fetch and store the values in variables.  
-- Note: The variables are in the same order as the columns  
-- in the SELECT statement.   
  
FETCH NEXT FROM Emp1_cursor  
INTO @LastName, @FirstName 

  
-- Check @@FETCH_STATUS to see if there are any more rows to fetch.  
WHILE @@FETCH_STATUS = 0  
BEGIN  
  
-- Concatenate and display the current values in the variables.  
PRINT 'Contact Name: ' + @FirstName + ' ' +  @LastName  
  
-- This is executed as long as the previous fetch succeeds.  
FETCH NEXT FROM Emp1_cursor  
INTO @LastName, @FirstName 

END  
  
CLOSE Emp1_cursor  
DEALLOCATE Emp1_cursor  

---Declaring a SCROLL cursor and using the other FETCH options
-----------------------------------------------------------------
-- Execute the SELECT statement alone to show the   
-- full result set that is used by the cursor.  
SELECT LastName, FirstName FROM Employees  
ORDER BY LastName, FirstName  
  
-- Declare the cursor.  
DECLARE Emp2_cursor SCROLL CURSOR FOR  
SELECT LastName, FirstName FROM Employees  
ORDER BY LastName, FirstName   
  
OPEN Emp2_cursor 
  
-- Fetch the last row in the cursor.  
FETCH LAST FROM Emp2_cursor  
  
-- Fetch the row immediately prior to the current row in the cursor.  
FETCH PRIOR FROM Emp2_cursor 
  
-- Fetch the second row in the cursor.  
FETCH ABSOLUTE 2 FROM Emp2_cursor 
  
-- Fetch the row that is three rows after the current row.  
FETCH RELATIVE 3 FROM Emp2_cursor  
  
-- Fetch the row that is two rows prior to the current row.  
FETCH RELATIVE -2 FROM Emp2_cursor  
  
CLOSE Emp2_cursor;  
DEALLOCATE Emp2_cursor




