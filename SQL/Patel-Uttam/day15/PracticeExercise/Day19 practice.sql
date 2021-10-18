USE [Day19 (Index and Transaction)]


 --Practice Exercise

	-- index
	-- Transaction


----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------

	-- Index : Index are use by query to find data more quickly from table or view 
			-- Index can be given to table or view
			-- In MSSQL Clustered Index is assign to primary key by-default and unique Index to Unique.
			-- two way to create index
				-- First, from Object Explorer
				-- Second, by using ' CREATE INDEX(with type) 'Index_name' ON 'table_name'


-- Clustered Index : 
--////////////////////////////////////////////////////////////////////////////////////////////////////////

	-- Employee

	CREATE CLUSTERED INDEX IX_clustered 
	ON dbo.Employee(EMPLOYEE_ID)
	
	SELECT * FROM Employee WHERE SALARY BETWEEN 700000 AND 1000000



	-- Employees 

	CREATE CLUSTERED INDEX IX_clustered_Employees
	ON dbo.Employees(EmployeeID)

	SELECT * FROM Employees WHERE Salary BETWEEN 10000 AND 20000



--////////////////////////////////////////////////////////////////////////////////////////////////////////




-- Non-Clustered Index
--////////////////////////////////////////////////////////////////////////////////////////////////////////

	-- Employee
	CREATE NONCLUSTERED INDEX NON_IX_FirstName
	ON dbo.Employee(FIRST_NAME ASC)

	CREATE NONCLUSTERED INDEX NON_IX_Salary
	ON dbo.Employee(SALARY ASC)

	SELECT * FROM Employee WHERE FIRST_NAME like 'T%'
	SELECT * FROM Employee WHERE SALARY BETWEEN 500000 AND 750000



	-- Employees
	CREATE NONCLUSTERED INDEX NON_IX_Salary_Employees
	ON Employees(Salary ASC)

	SELECT * FROM Employees WHERE Salary BETWEEN 10000 AND 20000

--////////////////////////////////////////////////////////////////////////////////////////////////////////

----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------





----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
-- Transaction : As simple Transaction means any deduction and Addition between two entity as single task.
			--   similarly, Tranction in T-SQL is refes to the any INSERT/UPDATE/DELETE/any logical Operations between to two or more table as one working unit.
			--   Transaction work on ACID properties.

				-- Atomicity : ATOMICITY means either whole Traction should be Done 100 % or Cancel , Simply 1 or 0.  
				-- Consistency : Consistency means Transaction should be work same of similar condition.
				-- Isolation : Isolation means no iterference between Transactions.
				-- Durability : Durability means all data should be Intact either Changes done completetly or even in failure of Transaction.

		-- Two type of Transaction
			-- Implicitly
			-- Explicitly


--Implicitly Transaction : We don't need to start Transaction.
						-- We just need to specify commit or rollback for transaction
						-- To set Transaction Implicitly ' SET IMPLICIT_TRANSACTIONS ON/OFF ' 
----------------------------------------------------------------------------------------------------------------------------------------------

--1

SET IMPLICIT_TRANSACTIONS ON
GO

INSERT INTO Shipments_Q1 VALUES(2,'US',GetDate(),2)
ROLLBACK Transaction

SET IMPLICIT_TRANSACTIONS OFF
GO

SELECT * FROM Shipments_Q1


--2
SET IMPLICIT_TRANSACTIONS ON
GO

DELETE FROM Shipments_Q1 WHERE Ship_Num = 1 AND Ship_CountryCode = 'US'
COMMIT Transaction

SET IMPLICIT_TRANSACTIONS OFF
GO

SELECT * FROM Shipments_Q1

----------------------------------------------------------------------------------------------------------------------------------------------



-- Explicitly Transaction : To define Explicitly Transaction we need to use command (BEGIN,COMMIT,ROLLBACK,SET). 
----------------------------------------------------------------------------------------------------------------------------------------------

-- 1
BEGIN TRANSACTION Transaction_1

	-- Statement 1
	INSERT INTO Shipments_Q2 VALUES(2,'UK',GetDate(),2)
	-- Statement 2
	DELETE FROM Shipments_Q2 WHERE Ship_Num = 2 AND Ship_CountryCode = 'UK'

	COMMIT TRANSACTION Transaction_1

	SELECT * FROM Shipments_Q2


-- 2
BEGIN TRANSACTION Transaction_2
BEGIN TRY
	-- Statement 1
	SELECT EMPLOYEE_ID FROM Employee WHERE EMPLOYEE_ID = 3
	-- Statement 2
	UPDATE Employee SET DEPARTMENT = 'Insurance' WHERE EMPLOYEE_ID = 3
	SAVE TRANSACTION Transaction_2
	UPDATE Employee SET SALARY = STR('adfgh') WHERE EMPLOYEE_ID = 3
	COMMIT TRANSACTION Transaction_2	
END TRY

BEGIN CATCH

	SELECT * FROM Employee
	ROLLBACK Transaction Transaction_2
	--UPDATE Employee SET SALARY = 600000 WHERE EMPLOYEE_ID = 3
	--COMMIT TRANSACTION Transaction_2
	--PRINT 'commit'
END CATCH

SELECT * FROM Employee
----------------------------------------------------------------------------------------------------------------------------------------------


-- dirty read : dirty read means when one transaction permitted to read data that has been try to modify by another tranc and has not been commited yet.
			--  dirty read only happend when TRANSACTION ISOLATION LEVEL set to READ UNCOMMITED. 
----------------------------------------------------------------------------------------------------------------------------------------------
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN transaction t
	UPDATE Employees SET Salary = Salary+1000 
	WAITFOR DELAY '00:00:10'
	COMMIT TRANSACTION t


-- To achive dirty read set isolation level read uncommited
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

BEGIN transaction t0
	SELECT * FROM Employees 

	Commit tran t0

SET TRANSACTION ISOLATION LEVEL READ COMMITTED


----------------------------------------------------------------------------------------------------------------------------------------------



-- Isolation levels :
		--serializable : serializable isolation means aquiring locks on resources while transaction.
					--   so ,in serializable isolation ther is no such possibility for side effect of concurrency.
					--   biggest drowback is we can't achive concurreny IN transactions.

		--Snapshot : Snapshot isolation means no aquiring of resorces while transaction.
				--   Snapshot isolation use version of tables and store in tempDB.
				--   Snapshot isolation work for concurrent transaction without losing acid properties, like data consistency in base table.
----------------------------------------------------------------------------------------------------------------------------------------------
--///////////////////////////////////////////////////////////////////
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN transaction t1
	UPDATE Employees SET Salary = Salary+1000 
	WAITFOR DELAY '00:00:10'
	COMMIT TRANSACTION t1


--
BEGIN transaction t2
	SELECT * FROM Employees 

	Commit tran t2

--///////////////////////////////////////////////////////////////////


--///////////////////////////////////////////////////////////////////
SET TRANSACTION ISOLATION LEVEL SNAPSHOT 

BEGIN transaction t3
	UPDATE Employees SET Salary = Salary+1000 
	WAITFOR DELAY '00:00:20'
	COMMIT TRANSACTION t3


--
BEGIN transaction t4
	SELECT * FROM Employees 

	Commit tran t4

----------------------------------------------------------------------------------------------------------------------------------------------
