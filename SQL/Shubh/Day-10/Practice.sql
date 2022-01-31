--1. Cursor call
SET NOCOUNT ON
DECLARE contact_cursor CURSOR FOR  
SELECT LastName FROM Employees  
WHERE LastName LIKE 'B%'  
ORDER BY LastName 
  
OPEN contact_cursor
FETCH NEXT FROM contact_cursor
WHILE @@FETCH_STATUS = 0  
BEGIN  
   FETCH NEXT FROM contact_cursor
END  
CLOSE contact_cursor 
DEALLOCATE contact_cursor 
SET NOCOUNT OFF

--2. Storing in variable
DECLARE @LastName VARCHAR(50), @FirstName VARCHAR(50)  
DECLARE contact_cursor CURSOR FOR  
SELECT LastName, FirstName FROM Employees
WHERE LastName LIKE 'K%'  
ORDER BY LastName, FirstName 
OPEN contact_cursor 
FETCH NEXT FROM contact_cursor  
INTO @LastName, @FirstName  
WHILE @@FETCH_STATUS = 0  
BEGIN  
   PRINT 'Contact Name: ' + @FirstName + ' ' +  @LastName  
   FETCH NEXT FROM contact_cursor  
   INTO @LastName, @FirstName  
END  
CLOSE contact_cursor
DEALLOCATE contact_cursor
GO 

--3. Scrolling
SELECT LastName, FirstName FROM Employees  
ORDER BY LastName, FirstName  
DECLARE contact_cursor SCROLL CURSOR FOR  
SELECT LastName, FirstName FROM Employees
ORDER BY LastName, FirstName  
OPEN contact_cursor

FETCH LAST FROM contact_cursor  
  
FETCH PRIOR FROM contact_cursor  
  
FETCH ABSOLUTE 2 FROM contact_cursor  
  
FETCH RELATIVE 3 FROM contact_cursor  
  
FETCH RELATIVE -2 FROM contact_cursor  
CLOSE contact_cursor
DEALLOCATE contact_cursor
GO 

--4. Deallocation
DECLARE abc CURSOR GLOBAL SCROLL FOR  
    SELECT * FROM Employees  
OPEN abc  
GO  
 
DECLARE @MyCrsrRef1 CURSOR  
SET @MyCrsrRef1 = abc  

DEALLOCATE @MyCrsrRef1  
FETCH NEXT FROM abc  
GO  

DECLARE @MyCrsrRef2 CURSOR  
SET @MyCrsrRef2 = abc  

DEALLOCATE abc  

FETCH NEXT FROM @MyCrsrRef2  
GO  

DECLARE @MyCursor CURSOR  
SET @MyCursor = CURSOR LOCAL SCROLL FOR  
SELECT * FROM Countries 
DEALLOCATE @MyCursor  
GO