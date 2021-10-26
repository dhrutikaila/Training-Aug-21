--CURSOR


--cursor practice

--declare cursor

USE AdventureWorks2019

DECLARE vend_cursor CURSOR  
    FOR SELECT * FROM Purchasing.Vendor  
OPEN vend_cursor  
--returns the first row
FETCH NEXT FROM vend_cursor




--Declare part
DECLARE contact_cursor CURSOR FOR 
SELECT LastName FROM Person.Person
WHERE LastName LIKE 'B%'
ORDER BY LastName
--declaration ends

--opening the cursor

OPEN contact_cursor;


--first fetch
FETCH NEXT FROM contact_cursor

-- Check @@FETCH_STATUS to see if there are any more rows to fetch.  
WHILE @@FETCH_STATUS = 0
BEGIN 
	--This is executed as long as the previous fetch  succeds.
	FETCH NEXT FROM contact_cursor;
END

CLOSE contact_cursor
DEALLOCATE contact_cursor

--there will will be infinte loop




--Using FETCH to store values in variables


--declaring variables
DECLARE @LastName VARCHAR(10),@FirstName VARCHAR(10);
--declaring cursor
DECLARE contact_cursor CURSOR FOR
SELECT LastName,FirstName FROM Person.Person
WHERE LastName LIKE 'B%'
ORDER BY LastName, FirstName

OPEN contact_cursor;

FETCH NEXT FROM contact_cursor
INTO @LastName,@FirstName


WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT 'Contact Name:' + @FirstName + ' ' + @LastName

	FETCH NEXT FROM contact_cursor
	INTO @LastName,@FirstName
END




--Using FETCH to store values in variables in own database

USE SampleTable

SELECT * FROM Employees

DECLARE @id INT,@JobID VARCHAR(10);

DECLARE employee_cursor CURSOR FOR
SELECT EmployeeID,JobID FROM Employees
WHERE Salary > 10000
ORDER BY Salary

OPEN employee_cursor;

FETCH NEXT FROM employee_cursor
INTO @id,@jobID

WHILE @@FETCH_STATUS = 0
BEGIN 

	PRINT 'Employeeid ' + CAST(@id AS VARCHAR(5)) + ' is work as ' + @JobID

	FETCH NEXT FROM employee_cursor
	INTO @id,@JobID
END

CLOSE employee_cursor
DEALLOCATE employee_cursor



-- using scroll keyword

USE AdventureWorks2019


SELECT LastName,FirstName FROM Person.Person
ORDER BY LastName,FirstName

DECLARE contact_cursor SCROLL CURSOR FOR
SELECT LastName,FirstName FROM Person.Person
WHERE BusinessEntityID < 10
ORDER BY LastName,FirstName

OPEN contact_cursor
--fetch last row from cursor
FETCH LAST FROM contact_cursor
--fetch prior row from the current row
FETCH PRIOR FROM contact_cursor
--fetch the second row in the cursor
FETCH ABSOLUTE 2 FROM contact_cursor
--fetch relative 3 rd row from the current row in the cursor
FETCH RELATIVE 3 FROM contact_cursor
--fetch relative 2nd privous row from the current row in the cursor
FETCH RELATIVE -2 FROM contact_cursor

CLOSE contact_cursor
DEALLOCATE contact_cursor
GO





--Duffy	Terri
--Erickson	Gail
--Goldberg	Jossef
--Margheim	Diane
--Matthew	Gigi
--Miller	Dylan
--Sánchez	Ken
--Tamburello Roberto
--Walters	Rob



--where to use cursor

--Serialized processing - If you have a need to complete a process in a serialized manner, cursors are a viable option.

	
--Many administrative tasks such as database backups or Database Consistency Checks need to be executed in a serial manner, which fits nicely into cursor-based logic.

--Because a cursor is an actual object inside the database engine, there is a little overhead involved in creating the cursor and destroying it. Also, a majority of cursor operations occur in tempdb, so a heavily used tempdb will be even more overloaded with the use of cursors

--types of cursor

--FORWARD_ONLY :Specifies that the cursor can only be scrolled from the first to the last row. FETCH NEXT is the only supported fetch option
--STATIC:Defines a cursor that makes a temporary copy of the data to be used by the cursor
--KEYSET:Specifies that the membership and order of rows in the cursor are fixed when the cursor is opened. The set of keys that uniquely identify the rows is built into a table in tempdb known as the keyset
--DYNAMIC :Defines a cursor that reflects all data changes made to the rows in its result set as you scroll around the cursor.
--FAST_FORWARD :Specifies a FORWARD_ONLY, READ_ONLY cursor with performance optimizations enabled
--READ_ONLY :Prevents updates made through this cursor
--SCROLL_LOCKS : Specifies that positioned updates or deletes made through the cursor are guaranteed to succeed
--OPTIMISTIC :Specifies that positioned updates or deletes made through the cursor do not succeed if the row has been updated since it was read into the cursor




--we can declare cursor inside a cursor

SET NOCOUNT ON;
DECLARE @vendor_id INT, @vendor_name NVARCHAR(50),@message VARCHAR(80), @product NVARCHAR(50); 

DECLARE vendor_cursor CURSOR FOR   
SELECT BusinessEntityID, Name  
FROM Purchasing.Vendor  
WHERE PreferredVendorStatus = 1  
ORDER BY BusinessEntityID;

OPEN vendor_cursor

FETCH NEXT FROM vendor_cursor
INTO @vendor_id,@vendor_name

WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT ' '
	SELECT @message = 'Product FROM Vendor: ' + @vendor_name

	PRINT @message;

	--declaring product cursor inside vendor cursor
	DECLARE product_cursor CURSOR FOR   
    SELECT v.Name  
    FROM Purchasing.ProductVendor pv, Production.Product v  
    WHERE pv.ProductID = v.ProductID AND  
    pv.BusinessEntityID = @vendor_id

	OPEN product_cursor  
    FETCH NEXT FROM product_cursor INTO @product  
  
    IF @@FETCH_STATUS <> 0   
        PRINT '         <<None>>'       
  
    WHILE @@FETCH_STATUS = 0  
    BEGIN  
  
        SELECT @message = '         ' + @product  
        PRINT @message  
        FETCH NEXT FROM product_cursor INTO @product  
        END  
  
    CLOSE product_cursor  
    DEALLOCATE product_cursor  
        -- Get the next vendor.  
    FETCH NEXT FROM vendor_cursor   
    INTO @vendor_id, @vendor_name  
END   
CLOSE vendor_cursor;  
DEALLOCATE vendor_cursor;  