USE AdventureWorks2016


--Print The LocationID and Person Name using Cursor--
--INSENSITIVE--
SET NOCOUNT ON
--DECLARE  @ID SMALLINT,@Name VARCHAR(50)
DECLARE TrialCursor INSENSITIVE CURSOR
FOR
SELECT LocationID,Name FROM Production.Location
OPEN TrialCursor
IF @@CURSOR_ROWS > 0
BEGIN
	FETCH NEXT FROM TrialCursor INTO @ID,@Name
	WHILE @@FETCH_STATUS = 0 
	BEGIN
		PRINT 'Id: '+CONVERT(VARCHAR(10), @ID) + ', Name: ' + CONVERT(VARCHAR(20), @Name)
		FETCH NEXT FROM TrialCursor INTO @ID,@Name
	END
END
CLOSE TrialCursor
DEALLOCATE TrialCursor
SET NOCOUNT OFF
---------------------------------------------------------------


--SCROLL - (FIRST,LAST,NEXT,PRIOR) & LOCAL--
SET NOCOUNT ON
--DECLARE  @ID SMALLINT,@Name VARCHAR(50)
DECLARE TrialCursor  CURSOR 
LOCAL SCROLL FOR
SELECT LocationID,Name FROM Production.Location
OPEN TrialCursor
IF @@CURSOR_ROWS > 0
BEGIN
	FETCH LAST FROM TrialCursor INTO @ID,@Name
	WHILE @@FETCH_STATUS = 0 
	BEGIN
		PRINT 'Id: '+CONVERT(VARCHAR(10), @ID) + ', Name: ' + CONVERT(VARCHAR(20), @Name)
	FETCH PRIOR FROM TrialCursor INTO @ID,@Name
	END
END
CLOSE TrialCursor
DEALLOCATE TrialCursor
SET NOCOUNT OFF
-----------------------------------------------------------------------



--FORWARD_ONLY--
SET NOCOUNT ON
--DECLARE  @ID SMALLINT,@Name VARCHAR(50)
DECLARE TrialCursor CURSOR 
FORWARD_ONLY FOR
SELECT LocationID,Name FROM Production.Location
OPEN TrialCursor
IF @@CURSOR_ROWS > 0
BEGIN
	FETCH NEXT FROM TrialCursor INTO @ID,@Name
	WHILE @@FETCH_STATUS = 0 
	BEGIN
		PRINT 'Id: '+CONVERT(VARCHAR(10), @ID) + ', Name: ' + CONVERT(VARCHAR(20), @Name)
	FETCH NEXT FROM TrialCursor INTO @ID,@Name
	END
END
CLOSE TrialCursor
DEALLOCATE TrialCursor
SET NOCOUNT OFF
---------------------------------------------------------------------


--STATIC--
SET NOCOUNT ON
--DECLARE  @ID SMALLINT,@Name VARCHAR(50)
DECLARE TrialCursor CURSOR
STATIC FOR 
SELECT LocationID,Name FROM Production.Location 
OPEN TrialCursor
IF @@CURSOR_ROWS > 0
BEGIN
	FETCH NEXT FROM TrialCursor INTO @ID,@Name
	WHILE @@FETCH_STATUS = 0 
	BEGIN
		PRINT 'Id: '+CONVERT(VARCHAR(10), @ID) + ', Name: ' + CONVERT(VARCHAR(20), @Name)
		FETCH NEXT FROM TrialCursor INTO @ID,@Name
	END
END
CLOSE TrialCursor
DEALLOCATE TrialCursor
SET NOCOUNT OFF
----------------------------------------------------------------------------


--DYNAMIC--
SET NOCOUNT ON
--DECLARE  @ID SMALLINT,@Name VARCHAR(50)
DECLARE TrialCursor CURSOR
DYNAMIC FOR 
SELECT LocationID,Name FROM Production.Location
OPEN TrialCursor
IF @@CURSOR_ROWS > 0
BEGIN
	FETCH NEXT FROM TrialCursor INTO @ID,@Name
	WHILE @@FETCH_STATUS = 0 
	BEGIN
		PRINT 'Id: '+CONVERT(VARCHAR(10), @ID) + ', Name: ' + CONVERT(VARCHAR(20), @Name)
		FETCH NEXT FROM TrialCursor INTO @ID,@Name
	END
END
CLOSE TrialCursor
DEALLOCATE TrialCursor
SET NOCOUNT OFF
--------------------------------------------------------------------------------



--FAST_FORWARD--
SET NOCOUNT ON
--DECLARE  @ID SMALLINT,@Name VARCHAR(50)
DECLARE TrialCursor CURSOR
FAST_FORWARD FOR 
SELECT LocationID,Name FROM Production.Location
OPEN TrialCursor
IF @@CURSOR_ROWS > 0
BEGIN
	FETCH NEXT FROM TrialCursor INTO @ID,@Name
	WHILE @@FETCH_STATUS = 0 
	BEGIN
		PRINT 'Id: '+CONVERT(VARCHAR(10), @ID) + ', Name: ' + CONVERT(VARCHAR(20), @Name)
		FETCH NEXT FROM TrialCursor INTO @ID,@Name
	END
END
CLOSE TrialCursor
DEALLOCATE TrialCursor
SET NOCOUNT OFF
--------------------------------------------------------------------------------



--READ_ONLY--
SET NOCOUNT ON
--DECLARE  @ID SMALLINT,@Name VARCHAR(50)
DECLARE TrialCursor CURSOR
READ_ONLY FOR 
SELECT LocationID,Name FROM Production.Location
OPEN TrialCursor
IF @@CURSOR_ROWS > 0
BEGIN
	FETCH NEXT FROM TrialCursor INTO @ID,@Name
	WHILE @@FETCH_STATUS = 0 
	BEGIN
		PRINT 'Id: '+CONVERT(VARCHAR(10), @ID) + ', Name: ' + CONVERT(VARCHAR(20), @Name)
		FETCH NEXT FROM TrialCursor INTO @ID,@Name
	END
END
CLOSE TrialCursor
DEALLOCATE TrialCursor
SET NOCOUNT OFF


SET NOCOUNT ON
DECLARE  @ID SMALLINT,@Name VARCHAR(50)
DECLARE TrialCursor CURSOR
OPTIMISTIC FOR 
SELECT LocationID,Name FROM Production.Location
OPEN TrialCursor
IF @@CURSOR_ROWS > 0
BEGIN
	FETCH NEXT FROM TrialCursor INTO @ID,@Name
	WHILE @@FETCH_STATUS = 0 
	BEGIN
		PRINT 'Id: '+CONVERT(VARCHAR(10), @ID) + ', Name: ' + CONVERT(VARCHAR(20), @Name)
		FETCH NEXT FROM TrialCursor INTO @ID,@Name
	END
END
CLOSE TrialCursor
DEALLOCATE TrialCursor
SET NOCOUNT OFF
