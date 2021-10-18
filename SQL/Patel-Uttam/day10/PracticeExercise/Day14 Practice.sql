USe PracticeExercise ---[SCROLL(RELATIVE/ABSOLUTE),OPTIMISTIC]


-- Practice Exercise

	--Cursor : Cursor is database object to retrive one by one data from result set.
			-- cursor use to perform some operation/update on database table in singleton fashion.
			-- cursor data type is to assign cursor.
			-- we can assign cursor to variable or parameter too.

			
	--ex
	--SELECT * FROM Shipments_Q1
	DECLARE @Shipnum int
	DECLARE @Shipcode char(2)

	DECLARE cursor1 CURSOR 
	FOR
	SELECT Ship_Num , Ship_CountryCode FROM Shipments_Q1

	OPEN cursor1 
	FETCH NEXT FROM cursor1 into @shipnum ,@shipcode

	PRINT @shipnum
	PRINT @shipcode
	CLOSE cursor1
	DEALLOCATE cursor1
	GO

	

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- DECLARE CURSOR Supports both, 1. syntax based on ISO Standard , 2. synax with use of sets of T-SQL extensions.
	


	-- 1 . ISO standard 

		--	ISO Syntax  
		--DECLARE cursor_name [ INSENSITIVE ] [ SCROLL ] CURSOR   
		--	 FOR select_statement   
		--	 [ FOR { READ ONLY | UPDATE [ OF column_name [ ,...n ] ] } ]  
		--[;]  

	-- In ISO we can add four additional argument suach as [ 'INSENSITIVE','SCROLL' ] , ['READ ONLY','UPDATE']

--**********************************************************************************************************************
	
-- SCROLL
	
	--SELECT * FROM Shipments_Q1
	DECLARE @Shipnum int
	DECLARE @Shipcode char(2)

	DECLARE cursor2 CURSOR	-- bydefault cursor act as FORWARD_ONLY	.	-- If we not add SCROLL then cursor does not support some additional way to access data.
	FOR
	SELECT Ship_Num , Ship_CountryCode FROM Shipments_Q1
	
	OPEN cursor2 
	FETCH NEXT FROM cursor2 into @shipnum ,@shipcode

	PRINT @shipnum
	PRINT @shipcode
	CLOSE cursor2
	DEALLOCATE cursor2
	GO





-- INSENSITIVITY
	
	SELECT * FROM Shipments_Q1
	
	DECLARE cursor3 INSENSITIVE CURSOR	-- If we add INSENSITIVE to cursor then it create the temporary copy of data use by cursor , 
							-- (If midification done in base table , changes not reflect in cursor)
	FOR
	SELECT Ship_Num , Ship_CountryCode FROM Shipments_Q1
	
	DECLARE @Shipnum1 int
	DECLARE @Shipcode1 char(2)
	OPEN cursor3 
	FETCH NEXT FROM cursor3 into @shipnum1 ,@shipcode1

	PRINT @shipnum1
	PRINT @shipcode1
	PRINT '&'
	--PRINT @shipnum2
	--PRINT @shipcode2
	--CLOSE cursor3
	--DEALLOCATE cursor3
	GO

	--UPDATE Shipments_Q1 SET Ship_CountryCode='ZX' WHERE Ship_Num = 2



--**********************************************************************************************************************





--**********************************************************************************************************************

-- READ ONLY and UPDATE

	SELECT * FROM Shipments_Q2
	
	DECLARE @Shipnum1 int
	DECLARE @Shipcode1 char(5)
	DECLARE @Shipquater1 DATE

	DECLARE cursor4 CURSOR READ_ONLY
	FOR
	SELECT Ship_Num , Ship_CountryCode, Ship_Date FROM Shipments_Q2 WHERE Ship_Quarter=2
	--FOR UPDATE OF [Ship_CountryCode]

	--DECLARE @Shipquater1 int
	OPEN cursor4 
	FETCH NEXT FROM cursor4 into @shipnum1 ,@shipcode1,@shipquater1

	UPDATE Shipments_Q2 SET Ship_CountryCode = 'IN' , Ship_Date = GetDate() WHERE CURRENT OF cursor4
	PRINT @shipnum1
	PRINT @shipcode1
	PRINT '&'
	 
	--PRINT @shipnum2
	--PRINT @shipcode2
	CLOSE cursor4
	DEALLOCATE cursor4
	GO

	UPDATE Shipments_Q2 SET Ship_Date = GetDate() WHERE Ship_Num=1
--**********************************************************************************************************************

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------







------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	-- 2 . Set of T-SQL extensions 

		--	Set of T-SQL extensions
		
			--DECLARE cursor_name CURSOR [ LOCAL | GLOBAL ]   
			--     [ FORWARD_ONLY | SCROLL ]   
			--     [ STATIC | KEYSET | DYNAMIC | FAST_FORWARD ]   
			--     [ READ_ONLY | SCROLL_LOCKS | OPTIMISTIC ]   
			--     [ TYPE_WARNING ]   
			--     FOR select_statement   
			--     [ FOR UPDATE [ OF column_name [ ,...n ] ] ]  
			--[;]  

	-- In ISO we can add some additional argument suach as [ LOCAL | GLOBAL ]   
														-- [ FORWARD_ONLY | SCROLL ]   
														-- [ STATIC | KEYSET | DYNAMIC | FAST_FORWARD ]   
														-- [ READ_ONLY | SCROLL_LOCKS | OPTIMISTIC ]   
														-- [ TYPE_WARNING ]
														-- [UPDATE]	
--**********************************************************************************************************************
	
-- LOCAL / GLOBAL and  SCROLL / FORWARD ONLY
	

	--LOCAL / GLOBAL

	--SELECT * FROM Shipments_Q1
	DECLARE @Shipnum int
	DECLARE @Shipcode char(2)

	DECLARE cursor51 CURSOR	GLOBAL		--[GLOBAL/LOCAL]
	FOR
	SELECT Ship_Num , Ship_CountryCode FROM Shipments_Q1
	
	OPEN cursor51 
	FETCH NEXT FROM cursor51 into @shipnum ,@shipcode  --NEXT
	FETCH FIRST FROM cursor51 into @shipnum ,@shipcode --FIRST
	FETCH LAST FROM cursor51 into @shipnum ,@shipcode --LAST
	PRINT @shipnum
	PRINT @shipcode
	--CLOSE cursor51
	--DEALLOCATE cursor51
	GO

	--/////////////////////////////////////////////////// 
	-- if we declare above cursor with Global then this batch execute and it also  
	-- If we declare above cursor local then execution of this batch return "'cursor_name' does no exist".

	DECLARE @Shipnum int
	DECLARE @Shipcode char(2)
	
	FETCH FIRST FROM cursor51 into @Shipnum , @Shipcode
	PRINT @Shipnum 
	PRINT @Shipcode
	--CLOSE cursor51
	GO
	--///////////////////////////////////////////////////


	
	-- FORWARD_ONLY / SCROLL

	DECLARE @shipnum int
	DECLARE @shipcode varchar(2)

	DECLARE cursor52 CURSOR 	--[FORWARD_ONLY/SCROLL] [BY DEFUALT FORWARD_ONLY]
	FOR
	SELECT Ship_Num,Ship_CountryCode FROM Shipments_Q1
	GO
	DECLARE @shipnum int
	DECLARE @shipcode varchar(2)

	OPEN cursor52
	FETCH NEXT FROM cursor52 into @shipnum , @shipcode		--[In FORWARD_ONLY we can only use NEXT in 'FETCH FROM ' / In SCROLL we can use [NEXT,FIRST,LAST,PRIOR,ABSOLUTE,RELATIVE] in 'FETCH FROM ']
	PRINT @shipnum
	PRINT @shipcode
	CLOSE cursor52
	--DEALLOCATE cursor52
	GO

	--/////////////////////////////////////////////////// 
	-- if we declare above cursor with SCROLL then all three fetch query of batch execute  
	-- if we declare above cursor with FORWARD_ONLY then only NEXT fetch query of batch execute  and return ['fetch type FIRST/LAST cannot be used with forward only.']

	DECLARE @Shipnum int
	DECLARE @Shipcode char(2)
	OPEN cursor52
	FETCH FIRST FROM cursor52 into @Shipnum , @Shipcode
	PRINT @Shipnum 
	PRINT @Shipcode
	PRINT 'First'
	FETCH LAST FROM cursor52 into @Shipnum , @Shipcode
	PRINT @Shipnum 
	PRINT @Shipcode
	PRINT 'LAST'
	FETCH NEXT FROM cursor52 into @Shipnum , @Shipcode
	PRINT @Shipnum 
	PRINT @Shipcode
	PRINT 'NEXT' 


	CLOSE cursor52
	GO
	--///////////////////////////////////////////////////

--**********************************************************************************************************************



--**********************************************************************************************************************
 
--  STATIC / DYNAMIC 
	
	SELECT * FROM Shipments_Q2
	
	--/////////////////////////////////////////////////////////////////////////
	
	-- Static : Static specifies that result set fetch by cursor is from tempory-copy created when first time cursor declared. 
			--  By Declaring cursor Static, performing fetches of row using cursor is not reflactes changing made in related row in base table.
	
	DECLARE cursor61 CURSOR	STATIC							
	FOR
	SELECT Ship_Num , Ship_CountryCode FROM Shipments_Q2
		
	DECLARE @Shipnum1 int
	DECLARE @Shipcode1 char(2)
	OPEN cursor61 
	FETCH NEXT FROM cursor61 

	PRINT @shipnum1
	PRINT @shipcode1
	PRINT '&'
	--PRINT @shipnum2
	--PRINT @shipcode2
	--CLOSE cursor61
	--DEALLOCATE cursor61
	GO
	--/////////////////////////////////////////////////////////////////////////

	
	--/////////////////////////////////////////////////////////////////////////
	
	-- Dynamic : Dynamic specifies that result set fetch by cursor is direct from base table . 
			--  By Declaring cursor Dynamic, performing fetches of row using cursor is reflactes all changing made in related row in base table.

	DECLARE cursor62 CURSOR DYNAMIC								
	FOR
	SELECT Ship_Num , Ship_CountryCode FROM Shipments_Q2

	DECLARE @Shipnum1 int
	DECLARE @Shipcode1 char(2)
	OPEN cursor62 
	FETCH NEXT FROM cursor62 into @shipnum1 ,@shipcode1

	PRINT @shipnum1
	PRINT @shipcode1
	PRINT '&'
	--PRINT @shipnum2
	--PRINT @shipcode2
	--CLOSE cursor62
	--DEALLOCATE cursor62
	GO

	--/////////////////////////////////////////////////////////////////////////

	
	--UPDATE Shipments_Q2 SET Ship_CountryCode = 'IN' WHERE Ship_Num=1
	--INSERT INTO Shipments_Q2 VALUES(4,'DC',GetDate(),2)
	--DELETE Shipments_Q2 WHERE Ship_Num=2



--**********************************************************************************************************************





--**********************************************************************************************************************

-- FAST_FORWARD / KEYSET

	--////////////////////////////////////////////////////////////////////////////////////////////////////////////
	-- FAST_FORWARD : Fast_Forward Specifies cursor as FORWARD_ONLY and READ_ONLY       
					--Fast_Forward use to optimize performance of cursor
					--Fast_Forward can't specified with SCROll AND FOR_UPDATE
	
	SELECT * FROM Shipments_Q3
	
	
	DECLARE cursor7 CURSOR FAST_FORWARD
	FOR
	SELECT Ship_Num , Ship_CountryCode FROM Shipments_Q3
	
	DECLARE @Shipnum1 int
	DECLARE @Shipcode1 char(3)

	OPEN cursor7 
	FETCH LAST FROM cursor7 into @shipnum1 ,@shipcode1

	UPDATE Shipments_Q3 SET Ship_CountryCode = 'IN' , Ship_Date = GetDate() WHERE CURRENT OF cursor7
	PRINT @shipnum1
	PRINT @shipcode1
	PRINT '&'
	 
	--PRINT @shipnum2
	--PRINT @shipcode2
	--CLOSE cursor7
	--DEALLOCATE cursor7
	GO

	--////////////////////////////////////////////////////////////////////////////////////////////////////////////



	--////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	--KEYSET : KEYSET specifies the set of key use to identify each row uniquely, These set of key are stored in tempdb.
			-- Functoinality of KEYSET lies between STATIC and DYNAMIC , in KEYSET update and delete in base table reflacte in cursor but insertion in base table doesn't reflacte in cursor.
			-- KEYSET fetch the row data from base-table using these set of key.
			-- It can only move from first to last or last to first , order of rows and membership is fixed when cursor open.
	
	
	SELECT * FROM Employee

	DECLARE cursor8 CURSOR KEYSET 
	FOR 
	SELECT EMPLOYEE_ID ,  FIRST_NAME , SALARY  FROM Employee

	OPEN cursor8

	DECLARE @id int ,@name varchar(25),@salary varchar(25)
	
	FETCH LAST FROM cursor8 into @id,@name,@salary
	
	WHILE @@FETCH_STATUS = 0
		BEGIN
			PRINT @id  
			PRINT @name 
			PRINT @salary
			FETCH NEXT FROM cursor8 into @id,@name,@salary
		END

	--CLOSE cursor8
	--DEALLOCATE cursor8
	GO

	-----------------------------------------------------------

	UPDATE Employee SET FIRST_NAME = 'RUMIT' WHERE EMPLOYEE_ID = 12 -- RUTVIK to RUMIT 
	INSERT INTO Employee VALUES (12,'RUTVIK','RAJ',500000.00,DATEDIFF(MM,GetDate(),9)	,'Accounting',	0)
	--DELETE Employee WHERE EMPLOYEE_ID = 11
	--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--**********************************************************************************************************************




--**********************************************************************************************************************
-- READ_ONLY / SCROLL_LOCKS / OPTIMISTIC 

	-- READ_ONLY covered



	--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	-- SCROLL_LOCKS : SCROLL_LOCKS Specifies that update or delete made through cursor is succeed always.

	DECLARE cursor9 CURSOR SCROLL_LOCKS
	FOR 
	SELECT EMPLOYEE_ID ,  FIRST_NAME , SALARY  FROM Employee

	OPEN cursor9	

	DECLARE @id int ,@name varchar(25),@salary varchar(25)
	
	FETCH NEXT FROM cursor9 into @id,@name,@salary
	WHILE @@FETCH_STATUS = 0
		BEGIN
			PRINT @id
			FETCH NEXT FROM cursor9 into @id,@name,@salary
			IF @id = 10
			BEGIN
			UPDATE Employee SET FIRST_NAME = 'UTTAM' , SALARY = 600000 WHERE CURRENT OF cursor9
			PRINT 'Update'
			END
		END
			
			
	CLOSE cursor9
	--DEALLOCATE cursor9
	GO
	SELECT * FROM Employee

	--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	
	
	--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	-- OPTIMISTIC : It simillar to SCROLL_LOCK ,but the difference is if row is updated after cursor declare it not allow update from cursor. 

	DECLARE cursor10 CURSOR OPTIMISTIC
	FOR 
	SELECT EMPLOYEE_ID ,  FIRST_NAME , SALARY  FROM Employee

	OPEN cursor10	

	DECLARE @id int ,@name varchar(25),@salary varchar(25)
	
	FETCH NEXT FROM cursor10 into @id,@name,@salary
	WHILE @@FETCH_STATUS = 0
		BEGIN
			PRINT @id
			WAITFOR DELAY '00:00:2' 
			FETCH NEXT FROM cursor10 into @id,@name,@salary
			--IF @id = 10
			--BEGIN
			--UPDATE Employee SET FIRST_NAME = 'UTTAM' , SALARY = 600000 WHERE CURRENT OF cursor10
			--UPDATE Employee SET FIRST_NAME = 'PRADIP' , SALARY = 600000 WHERE CURRENT OF cursor10
			--PRINT 'Update'
			--END
		END
			
			
	CLOSE cursor10
	--DEALLOCATE cursor10
	GO
	
	---------------------------------------------------------------
	UPDATE Employee SET FIRST_NAME = 'PRADIP', SALARY = 500000 WHERE EMPLOYEE_ID = 10	-- UTTAM to PRADIP
	
	SELECT * FROM Employee
	
	
	--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	


	
--**********************************************************************************************************************

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------








------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Cursor OPEN / FETCH / CLOSE / DEALLOCATE

--OPEN : 'OPEN' is use to open a defined cursor to perform further operation on cursor like Fetch..
		
		DECLARE cur CURSOR 
		FOR 
		SELECT * FROM Employee

		OPEN cur


-- FETCH : 'FETCH' is use to fetch or retrive row one by one from cursor to perform opretion like update,delete or data manipulation ..
		--  to use 'FETCH' cursor has to be open.  
		-- there are different	orders to fetch data.
		-- By using 'into' we can assign fetch data to variable.

		--1
		FETCH NEXT FROM cur

		--2	
		DECLARE @id int,@name1 varchar(20),@name2 varchar(20),@sal int,@date Date,@dept varchar(20),@mid int
		FETCH NEXT FROM cur	into @id,@name1,@name2,@sal,@date,@dept,@mid

		PRINT @id 
		PRINT @name1


-- CLOSE : 'CLOSE' use to explicitly close cursor , it good to close cursor after we done with it
		--  After cursor close if we have to perform fetch then we have to first open cursor  
		CLOSE cur


-- DEALLOCATE : 'DEALLOCATE' use to delete cursor or it's definition and to free system resources allocated to cursor.
			-- 	After DEALLOCATE if we need cursor then we have to execute query to declare cursor

		DEALLOCATE cur
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
