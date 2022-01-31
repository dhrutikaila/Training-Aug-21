-- DECLARING CURSOR
    DECLARE employee_cursor CURSOR  
    FOR SELECT * FROM HumanResources.Employee
    OPEN employee_cursor  
    FETCH NEXT FROM employee_cursor;

-- OPEN CURSOR 
    OPEN employee_cursor;

-- FETCH CURSOR
    IF @@CURSOR_ROWS > 0
    BEGIN
        FETCH NEXT FROM EMP_CURSOR
        WHILE @@FETCH_STATUS = 0
        BEGIN 
            FETCH NEXT FROM EMP_CURSOR
        END
    END

    -- here @@FETCH_STATUS and @@CURSOR_ROWS are two global variables and it is denoted by @@ 

    -- FETCH NEXT FROM will retrive the next row from table

-- DEALLOCATE AND CLOSE
    CLOSE EMP_CURSOR
    DEALLOCATE EMP_CURSOR

-- when you have only declared and  then you have exexute the cursor, you need to close and dealloacte  the cursor and then you need to perform other operations.

--  Printing full name using cursor
-- Using FETCH to store values in variables

declare @FirstName varchar(50),@LastName varchar(50)

DECLARE TEST_CURSOR CURSOR
FOR SELECT LastName,FirstName 
	FROM Person.Person
	WHERE LastName LIKE 'P%'
	ORDER BY LastName,FirstName;

OPEN TEST_CURSOR
FETCH NEXT FROM TEST_CURSOR INTO @LastName,@FirstName
    WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT 'FULL NAME:'+@FirstName+' '+@LastName
		FETCH NEXT FROM TEST_CURSOR INTO @LastName,@FirstName
    END
CLOSE TEST_CURSOR
DEALLOCATE TEST_CURSOR

-- SCROLL CURSOR
    SELECT LastName, FirstName FROM Person.Person  
    ORDER BY LastName, FirstName;  
  
    -- Declare the cursor.  
    DECLARE contact_cursor SCROLL CURSOR FOR  
    SELECT LastName, FirstName FROM Person.Person  
    ORDER BY LastName, FirstName;  
    
    OPEN contact_cursor;  
    
    -- Fetch the last row in the cursor.  
    FETCH LAST FROM contact_cursor;  
    
    -- Fetch the row immediately prior to the current row in the cursor.  
    FETCH PRIOR FROM contact_cursor;  
    
    -- Fetch the second row in the cursor.  
    FETCH ABSOLUTE 2 FROM contact_cursor;  
    
    -- Fetch the row that is three rows after the current row.  
    FETCH RELATIVE 3 FROM contact_cursor;  
    
    -- Fetch the row that is two rows prior to the current row.  
    FETCH RELATIVE -2 FROM contact_cursor;  
    
    CLOSE contact_cursor;  
    DEALLOCATE contact_cursor;

-- If the SCROLL option is not specified in an ISO style DECLARE CURSOR statement, NEXT is the only FETCH option supported. If SCROLL is specified in an ISO style DECLARE CURSOR, all FETCH options are supported.

-- When the Transact-SQL DECLARE cursor extensions are used, these rules apply:

-- If either FORWARD_ONLY or FAST_FORWARD is specified, NEXT is the only FETCH option supported.

-- If DYNAMIC, FORWARD_ONLY or FAST_FORWARD are not specified, and one of KEYSET, STATIC, or SCROLL are specified, all FETCH options are supported.

-- DYNAMIC SCROLL cursors support all the FETCH options except ABSOLUTE.