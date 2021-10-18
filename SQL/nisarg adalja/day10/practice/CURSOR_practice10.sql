/*
Cursors

cursor is a database objects to retrive data FROM a result set one row at a time, instead of the T-SQL commands that operate on all the rows in the result set at one time.
We use cursor whe we need to UPDATE records ina database TABLE in singleton fashion means rows by row.

life cycle of Cursor
Declare Cursor
Open
Fetch
Close 
Deallocate

Syntax :

DECLARE cursor_name [ INSENSITIVE ] [ SCROLL ] CURSOR   
     FOR SELECT_statement   
     [ FOR { READ ONLY | UPDATE [ OF column_name [ ,...n ] ] } ]  
[;]  
Transact-SQL Extended Syntax  
DECLARE cursor_name CURSOR [ LOCAL | GLOBAL ]   
     [ FORWARD_ONLY | SCROLL ]   
     [ STATIC | KEYSET | DYNAMIC | FAST_FORWARD ]   
     [ READ_ONLY | SCROLL_LOCKS | OPTIMISTIC ]   
     [ TYPE_WARNING ]   
     FOR SELECT_statement   
     [ FOR UPDATE [ OF column_name [ ,...n ] ] ]  
[;]  
*/-- 1 - Declare Variables
-- * UPDATE WITH YOUR SPECIFIC CODE HERE *
DECLARE @name VARCHAR(50) -- database name 
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

-- 3 - Fetch the next record FROM the cursor
FETCH NEXT FROM db_cursor INTO @name  

-- Set the status for the cursor
WHILE @@FETCH_STATUS = 0  
 
BEGIN  
	-- 4 - Begin the custom business logic
	-- * UPDATE WITH YOUR SPECIFIC CODE HERE *
   	SET @fileName = @path + @name + '_' + @fileDate + '.BAK' 
  	BACKUP DATABASE @name TO DISK = @fileName 

	-- 5 - Fetch the next record FROM the cursor
 	FETCH NEXT FROM db_cursor INTO @name 
END 

-- 6 - Close the cursor
CLOSE db_cursor  

-- 7 - Deallocate the cursor
DEALLOCATE db_cursor 








set nocount on
declare @id int,@empName varchar(50),@salary int
declare cur_emp CURSOR
static for
SELECT EmployeeID,FirstName,Salary FROM Employees
open cur_emp
if @@CURSOR_ROWS >0
BEGIN
FETCH NEXT FROM cur_emp INTO @id,@empName,@salary
while @@FETCH_STATUS=0
begin
PRINT('ID'+convert(varchar(20),@id)+'Name'+@empName)
FETCH NEXT FROM cur_emp INTO @id,@empName,@salary
End
End
Close cur_emp
deallocate cur_emp
set nocount off

set nocount on
declare @id int,@empName varchar(50),@salary int
declare cur_emp CURSOR
static for
SELECT EmployeeID,FirstName,Salary FROM Employees
open cur_emp
if @@CURSOR_ROWS >0
BEGIN
FETCH NEXT FROM cur_emp
while @@FETCH_STATUS=0
begin
PRINT('ID'+convert(varchar(20),@id)+'Name'+@empName)
FETCH NEXT FROM cur_emp
End
End
Close cur_emp
deallocate cur_emp
set nocount off


/* Arguments */

/* 1. cursor_name
Is the name of the Transact-SQL server cursor defined. cursor_name must conform to the rules for identifiers. */

declare cur_emp CURSOR  --here cur_emp is cursor_name

/* 2. INSENSITIVE */
/*Defines a cursor that makes a temporary copy of the data to be used by the cursor. 
All requests to the cursor are answered FROM this temporary TABLE in tempdb; therefore,
modifications made to base TABLEs are not reflected in the data returned by fetches made to this cursor, and this cursor does not allow modifications. 
When ISO syntax is used, if INSENSITIVE is omitted, committed deletes and UPDATEs made to the underlying TABLEs (by any user) are reflected in subsequent fetches. */

-- using insensitive it does not affected if we changes the data INTO the TABLEs it does not affact to this coursor

set nocount on
declare cur_emp1 insensitive CURSOR  
For SELECT top 100 EmployeeID,FirstName,Salary FROM Employees
declare @id1 int,@empName1 varchar(50),@salary1 int
open cur_emp1

UPDATE Employees set FirstName='Nisarg' where EmployeeID=106;
--here this UPDATE can not show at cursor pointing that TABLE
if @@CURSOR_ROWS >0
BEGIN
FETCH NEXT FROM cur_emp1 INTO @id1,@empName1,@salary1
while @@FETCH_STATUS=0
begin
PRINT('ID'+convert(varchar(20),@id1)+'Name'+@empName1)
FETCH NEXT FROM cur_emp1 INTO @id1,@empName1,@salary1
End
End
Close cur_emp1
deallocate cur_emp1
set nocount off

/* SCROLL
Specifies that all fetch options (FIRST, LAST, PRIOR, NEXT, RELATIVE, ABSOLUTE) are available. If SCROLL is not specified in an ISO DECLARE CURSOR, NEXT is the only fetch option supported. SCROLL cannot be specified if FAST_FORWARD is also specified. If SCROLL is not specified then only the fetch option NEXT is available and the cursor becomes FORWARD_ONLY.
*/

-- we do not use scroll during declaration of cursor then only next option is used in fetch statement
-- if we use scroll during cursor declaration then we can use FIRST, LAST, PRIOR, NEXT, RELATIVE, ABSOLUTE options in fetch statement

set nocount on
declare cur_emp1 scroll CURSOR  
For SELECT top 100 EmployeeID,FirstName,Salary FROM Employees
declare @id1 int,@empName1 varchar(50),@salary1 int
open cur_emp1
if @@CURSOR_ROWS >0
BEGIN
FETCH LAST FROM cur_emp1 INTO @id1,@empName1,@salary1
-- it fetch the last row FROM the TABLE means it points to last row of the top 100 rows
while @@FETCH_STATUS=0
begin
PRINT('ID'+convert(varchar(20),@id1)+'Name'+@empName1)
FETCH NEXT FROM cur_emp1 INTO @id1,@empName1,@salary1
End
End
Close cur_emp1
deallocate cur_emp1
set nocount off



set nocount on
declare cur_emp1 scroll CURSOR  
For SELECT top 100 EmployeeID,FirstName,Salary FROM Employees
declare @id1 int,@empName1 varchar(50),@salary1 int
open cur_emp1
if @@CURSOR_ROWS >0
BEGIN
FETCH FIRST FROM cur_emp1 INTO @id1,@empName1,@salary1
-- it fetch the first row FROM the TABLE means it points to last row of the top 100 rows
while @@FETCH_STATUS=0
begin
PRINT('ID'+convert(varchar(20),@id1)+'Name'+@empName1)
FETCH NEXT FROM cur_emp1 INTO @id1,@empName1,@salary1
End
End
Close cur_emp1
deallocate cur_emp1
set nocount off


set nocount on
declare cur_emp1 scroll CURSOR  
For SELECT top 100 EmployeeID,FirstName,Salary FROM Employees
declare @id1 int,@empName1 varchar(50),@salary1 int
open cur_emp1
--UPDATE Employees set FirstName='Nisarg' where EmployeeID=106;
--here this UPDATE can not show at cursor pointing that TABLE
if @@CURSOR_ROWS >0
BEGIN
FETCH PRIOR FROM cur_emp1 INTO @id1,@empName1,@salary1
-- it fetch the prior row FROM the TABLE means it points to last row of the top 100 rows
while @@FETCH_STATUS=0
begin
PRINT('ID'+convert(varchar(20),@id1)+'Name'+@empName1)
FETCH NEXT FROM cur_emp1 INTO @id1,@empName1,@salary1
End
End
Close cur_emp1
deallocate cur_emp1
set nocount off



set nocount on
declare cur_emp1 scroll CURSOR  
For SELECT top 100 EmployeeID,FirstName,Salary FROM Employees
declare @id1 int,@empName1 varchar(50),@salary1 int
open cur_emp1
if @@CURSOR_ROWS >0
BEGIN
FETCH Last FROM cur_emp1 
FETCH Absolute 2 FROM cur_emp1
-- it fetch the last row FROM the TABLE means it points to last row of the top 100 rows
while @@FETCH_STATUS=0
begin
PRINT('ID'+convert(varchar(20),@id1)+'Name'+@empName1)
FETCH NEXT FROM cur_emp1 
--FETCH NEXT FROM cur_emp1 INTO @id1,@empName1,@salary1
End
End
Close cur_emp1
deallocate cur_emp1
set nocount off


set nocount on
declare cur_emp1 scroll CURSOR  
For SELECT top 100 EmployeeID,FirstName,Salary FROM Employees
declare @id1 int,@empName1 varchar(50),@salary1 int
open cur_emp1
if @@CURSOR_ROWS >0
BEGIN
FETCH First FROM cur_emp1 
-- it fetch 3rd row after current curser point to the row
FETCH relative 2 FROM cur_emp1
-- it fetch the last row FROM the TABLE means it points to last row of the top 100 rows
while @@FETCH_STATUS=0
begin
PRINT('ID'+convert(varchar(20),@id1)+'Name'+@empName1)
FETCH NEXT FROM cur_emp1 
--FETCH NEXT FROM cur_emp1 INTO @id1,@empName1,@salary1
End
End
Close cur_emp1
deallocate cur_emp1
set nocount off

/* Forword_ONLY */

set nocount on
declare cur_emp1 CURSOR  FORWARD_ONLY  
For SELECT top 100 EmployeeID,FirstName,Salary FROM Employees
declare @id1 int,@empName1 varchar(50),@salary1 int
open cur_emp1
if @@CURSOR_ROWS >0
BEGIN
--only next option will be use in fetch statement
--if we use other options then it will give error
FETCH NEXT FROM cur_emp1 
while @@FETCH_STATUS=0
begin
PRINT('ID'+convert(varchar(20),@id1)+'Name'+@empName1)
FETCH PRIOR FROM cur_emp1 
--FETCH NEXT FROM cur_emp1 INTO @id1,@empName1,@salary1
End
End
Close cur_emp1
deallocate cur_emp1
set nocount off

/* Fast_forward */
DECLARE cur_emp1 CURSOR FAST_FORWARD
FOR
SELECT EmployeeID,FirstName FROM Employees
order by EmployeeID
open cur_emp1
if @@CURSOR_ROWS >0
BEGIN
FETCH First FROM cur_emp1 
-- it fetch 3rd row after current curser point to the row
FETCH relative 2 FROM cur_emp1
-- it fetch the last row FROM the TABLE means it points to last row of the top 100 rows
while @@FETCH_STATUS=0
begin
--PRINT('ID'+convert(varchar(20),@id1)+'Name'+@empName1)
UPDATE Employees set FirstName='Nisarg' where CURRENT OF cur_emp1
FETCH NEXT FROM cur_emp1 
--FETCH NEXT FROM cur_emp1 INTO @id1,@empName1,@salary1
End
End
Close cur_emp1
deallocate cur_emp1
set nocount off

/* READ_ONLY */
/* READ ONLY
Prevents UPDATEs made through this cursor. The cursor cannot be referenced in a WHERE CURRENT OF clause in an UPDATE or DELETE statement. This option overrides the default capability of a cursor to be UPDATEd.*/
set nocount on
DECLARE cur_emp1 CURSOR READ_ONLY
FOR
SELECT EmployeeID,FirstName FROM Employees
order by EmployeeID
open cur_emp1
if @@CURSOR_ROWS >0
BEGIN
FETCH First FROM cur_emp1 
UPDATE Employees set FirstName='Nisarg' where EmployeeID=106

-- it fetch 3rd row after current curser point to the row
FETCH relative 2 FROM cur_emp1
-- it fetch the last row FROM the TABLE means it points to last row of the top 100 rows
while @@FETCH_STATUS=0
begin
--PRINT('ID'+convert(varchar(20),@id1)+'Name'+@empName1)
UPDATE Employees set FirstName='Nisarg' where CURRENT OF cur_emp1
FETCH NEXT FROM cur_emp1 
--FETCH NEXT FROM cur_emp1 INTO @id1,@empName1,@salary1
End
End
Close cur_emp1
deallocate cur_emp1
set nocount off

/* DYNAMIC */
/* When a cursor is CREATEd with dynamic attribute all the changes made to rows inside cursor or outside cursor are visible when you fetch the new record. By default, if STATIC or FAST_FORWARD is not specified the cursor is CREATEd as dynamic.*/
set nocount on
DECLARE cur_emp1 CURSOR DYNAMIC
FOR
SELECT EmployeeID,FirstName FROM Employees
open cur_emp1
UPDATE Employees set FirstName="Nisarg" where EmployeeID=108 
FETCH relative 2 FROM cur_emp1
-- it fetch the last row FROM the TABLE means it points to last row of the top 100 rows
while @@FETCH_STATUS=0
begin
--PRINT('ID'+convert(varchar(20),@id1)+'Name'+@empName1)
UPDATE Employees set FirstName='Nisarg' where CURRENT OF cur_emp1
FETCH NEXT FROM cur_emp1 
--FETCH NEXT FROM cur_emp1 INTO @id1,@empName1,@salary1
End
Close cur_emp1
deallocate cur_emp1
set nocount off

 /* SCROLL_LOCKS */
/* When the cursor is CREATEd with SCROLL_LOCKS attribute the rows which are fetched INTO cursor are locked.

Execute the below statements to CREATE a cursor with SCROLL_LOCKS.*/

DECLARE DefaultCursor CURSOR SCROLL_LOCKS
FOR
SELECT EmployeeID,FirstName FROM Employees
 
OPEN DefaultCursor
 
FETCH NEXT FROM DefaultCursor
UPDATE Employees SET FirstName = 'LockTest' where EmployeeID=101
close DefaultCursor
deallocate DefaultCursor
SELECT * FROM Employees

/* OPTIMISTIC */
/* This attribute will not UPDATE or delete data inside the cursor by using the CURRENT OF when the data is modified by another user in a different session after fetch. It throws an error as shown in the below image. */

DECLARE DefaultCursor CURSOR optimistic
FOR
SELECT EmployeeID,FirstName FROM Employees
 
OPEN DefaultCursor
SELECT * FROM sys.dm_exec_cursors(20)
FETCH NEXT FROM DefaultCursor
while @@FETCH_STATUS=0
begin
--waitfor delay '00:00:10'
--PRINT('ID'+convert(varchar(20),@id1)+'Name'+@empName1)
UPDATE Employees set FirstName='Nisarg' where CURRENT OF DefaultCursor
FETCH NEXT FROM DefaultCursor 
--FETCH NEXT FROM cur_emp1 INTO @id1,@empName1,@salary1
End
close DefaultCursor
deallocate DefaultCursor
SELECT * FROM Employees


/* FOR UPDATE */
/* This attribute specifies the updaTABLE columns in the cursor. Only columns which are specified are updaTABLE. If no column list was provided all columns of the TABLE can be UPDATEd.

Sample cursor with no columns specified for an UPDATE. In this case, all columns in the TABLE test can be UPDATEd inside the SQL Server cursor using the CURRENT OF. */


DECLARE DefaultCursor CURSOR
FOR
SELECT EmployeeID,FirstName FROM Employees
 FOR UPDATE of 
OPEN DefaultCursor
SELECT * FROM sys.dm_exec_cursors(20)
FETCH NEXT FROM DefaultCursor
while @@FETCH_STATUS=0
begin
--PRINT('ID'+convert(varchar(20),@id1)+'Name'+@empName1)
UPDATE Employees set FirstName='TestLOCK' where CURRENT OF DefaultCursor
FETCH NEXT FROM DefaultCursor 
--FETCH NEXT FROM cur_emp1 INTO @id1,@empName1,@salary1
End
close DefaultCursor
deallocate DefaultCursor
SELECT * FROM Employees

/* specific column specified in for UPDATE*/
/* IN this UPDATE can not perform bcz we specified column FirstNaame only in for UPDATE statement and we try to UPDATE FirstName and LastName column so it does not UPDATE*/

DECLARE DefaultCursor CURSOR
FOR
SELECT EmployeeID,FirstName FROM Employees
 FOR UPDATE of [FirstName]
OPEN DefaultCursor
SELECT * FROM sys.dm_exec_cursors(20)
FETCH NEXT FROM DefaultCursor
while @@FETCH_STATUS=0
begin
--PRINT('ID'+convert(varchar(20),@id1)+'Name'+@empName1)
UPDATE Employees set FirstName='DEEP',LastName='Adalja' where CURRENT OF DefaultCursor
FETCH NEXT FROM DefaultCursor 
--FETCH NEXT FROM cur_emp1 INTO @id1,@empName1,@salary1
End
close DefaultCursor
deallocate DefaultCursor
SELECT * FROM Employees

/* it UPDATEd bcz we specified UPDATE columns  */
DECLARE DefaultCursor CURSOR
FOR
SELECT EmployeeID,FirstName FROM Employees
 FOR UPDATE of [FirstName],[LastName]
OPEN DefaultCursor
SELECT * FROM sys.dm_exec_cursors(20)
FETCH NEXT FROM DefaultCursor
while @@FETCH_STATUS=0
begin
--PRINT('ID'+convert(varchar(20),@id1)+'Name'+@empName1)
UPDATE Employees set FirstName='Deep',LastName='Adalja' where CURRENT OF DefaultCursor
FETCH NEXT FROM DefaultCursor 
--FETCH NEXT FROM cur_emp1 INTO @id1,@empName1,@salary1
End
close DefaultCursor
deallocate DefaultCursor
SELECT * FROM Employees




/*SELECT_statement
Is a standard SELECT statement that defines the result set of the cursor. The keywords FOR BROWSE, and INTO are not allowed within SELECT_statement of a cursor declaration.

SQL Server implicitly converts the cursor to another type if clauses in SELECT_statement conflict with the functionality of the requested cursor type. */

