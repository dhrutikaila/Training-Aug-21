---Indexes in sql ---

USE SampleDB
   --create indexes--
   --USE :  We can faster to retrive data from table 
CREATE INDEX IX_Employees_JobId
ON Employees JobId

  sp_Helpindex Employees  --we can get all the index which table have 

  --drop indexes--
  DROP INDEX Employees.IX_Employees_JobId

  --Types of Clustered Index
	--Clustered Index
		--a table can have only one clustered index.
		--one cluster index contain multipal column that type of index call as 
			--composite clustered index
			CREATE CLUSTERED INDEX IX_Employees_Jobid_Salary
			ON Employees (JobId ASC,Salary ASC)
		--it is faster than non clustered index..
		--clustered index doesn't require additional disk space..
		--Note: id column is marked as primary key.primary key constraint create 
		        --indexes automatically if no clustered index already exists on the 
				--table.

	--Non Clustered Index
		--A table can have more then one non clustered index
		--ex. foreign author book have two index..1.first page and 2.on last page
		--non clustered index store separately from the tabel ..so it's required 
		  --additional storage space..
		  CREATE NonClustered INDEX IX_Employees_FirstName
		  ON Employees (FirstName)

---Transaction in sql---
USE SampleDB

--BEGIN TRANSACTION MEANS not perfect commit in table or Update 
	--whenever we open new query window or connection there we type select query 
	  --we can't get result but we only see executing query..
BEGIN TRANSACTION 
UPDATE Employees SET Salary = 5000 WHERE EmployeeID=106
--if we want to see another connection in uncommited data we need to write command
--like
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

--Rollback transaction :: whatever we try to update in table ..after rollback command 
						--not update in table or not commit transaction ..
  BEGIN TRANSACTION 
  UPDATE Employees SET Salary = 5000 WHERE EmployeeID=106

  ROLLBACK TRANSACTION 

--COMMIT TRANSACTION :: Means completely update in table 
 BEGIN TRANSACTION 
  UPDATE Employees SET Salary = 5000 WHERE EmployeeID=106

  COMMIT TRANSACTION 

  --ex..
  CREATE PROCEDURE spUpdateSalaryAndDepartment
  @TEMPSALARY DECIMAL(8,2),@TEMPDEPT VARCHAR(30)
  AS 
  BEGIN TRY 
	BEGIN TRANSACTION 
		UPDATE Employees SET Salary = @TEMPSALARY WHERE EmployeeID = 106

		UPDATE Departments SET DepartmentName = @TEMPDEPT WHERE DepartmentID = 60
	COMMIT TRANSACTION 
	PRINT 'TRANSACTION COMMITTED'
  END TRY 
  BEGIN CATCH 
	ROLLBACK TRANSACTION 
	PRINT 'TRANSACTION ROLLED BACK'
  END CATCH 
  
  EXECUTE spUpdateSalaryAndDepartment 5500,'IT DEPT'
  --TRANSACTION COMMITTED

  EXECUTE spUpdateSalaryAndDepartment 5500,NULL   
  --TRANSACTION ROLLED BACK     ----Department name column contain not null value


--Implicit Transaction 
SET IMPLICIT_TRANSACTIONS ON
 INSERT INTO Departments VALUES(280,'NEW DEPT',0,1700)
SET IMPLICIT_TRANSACTIONS OFF
 
