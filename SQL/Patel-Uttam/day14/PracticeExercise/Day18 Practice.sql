USE [Day18 (Trigger)]

INSERT into()
SELECT   

-- Practice Exercise

	-- Trigger
	-- DML Trigger
	-- DDL Trigger
	-- After Trigger
	-- Instead of Trigger


-- Trigger : Trigger is collection of statement execute/fired automatically when certain action/event occur like (insert,update,delete ...) on table or view.
			-- Trigger support three mode for executition of itself (ON/AFTER/INSTEAD OF)


		--	1. Type of Trigger:
			
				-- DML Trigger : trigger execute when DML(update,delete,insert) Statement execute for table.
				-- DDL Trigger : trigger execute when DDL(DROP,ALTER) Statement execute for table.
		
		-- 2. Trigger can be a nested , trigger on table on which table we perform some statement in another trigger.

		-- 3. Trigger can be recursive 




--//////////////////////////////////////////////////////////////////////////////

-- DML Trigger : DML trigger execute when update/delete/insert occur on table or view
					
---------------------------------------------------------------------
-- UPDATE : DML trigger support two tables name inserted,deleted for update trigger

-- UPDATE with FOR to update deptid of DummyDepartments 

ALTER TRIGGER trigger1 
ON DummyEmployees2
FOR UPDATE
AS
IF UPDATE(DepartmentID)
BEGIN
SELECT * FROM inserted
SELECT * FROM deleted

DECLARE @deptid_new int
DECLARE @deptid_old int

DECLARE @deptname varchar(20)
DECLARE @mangid int
DECLARE @locid int

SELECt @deptname = DepartmentName,@mangid = managerID,@locid =  LocationID FROM DummyDepartments WHERE DepartmentID = @deptid_new

PRINT 'Complete'
END

-- Updating DepartmentID
UPDATE DummyEmployees2 SET DepartmentID=30 WHERE DepartmentID = 90 AND EmployeeID BETWEEN 114 AND 119
---------------------------------------------------------------------


---------------------------------------------------------------------
-- DELETE : DML trigger support deleted 1table for DELETE

---- DELETE with INSTEAD OF to prevent deletion of row of DummyDepartments
GO
ALTER TRIGGER trigger2
ON DummyDepartments
INSTEAD OF DELETE
AS
BEGIN
PRINT 'You can''t Delete Data '
RollBack
END
GO
-- Deleting Data from DummyDepartments
DELETE FROM DummyDepartments WHERE DepartmentID = 200
---------------------------------------------------------------------


---------------------------------------------------------------------
-- INSERT : DML trigger support inserted table for INSERT

-- INSERT with AFTER to insert new row to DummyDepartments

CREATE TRIGGER trigger3
ON DummyDepartments
FOR INSERT
AS
BEGIN
	PRINT 'Data Inserted success'
END


--Inserting data into DummyDepartments
INSERT INTO DummyDepartments VALUES (205,'EC',221,1007)

---------------------------------------------------------------------

--//////////////////////////////////////////////////////////////////////////////


--//////////////////////////////////////////////////////////////////////////////
-- DDL Trigger : DDL Trigger execute when definition of table is delete or update.

----------------------------------------------------------------------------
-- ALTER with ON

ALTER TRIGGER Safety1
ON DATABASE
AFTER ALTER_TABLE
AS
BEGIN

PRINT 'you Alter table'

END

-- Alterring table ()
sp_help DummyDepartments;
ALTER TABLE DummyDepartments ALTER COLUMN DepartmentName varchar(35);
GO
sp_help DummyDepartments;

----------------------------------------------------------------------------

----------------------------------------------------------------------------
-- DROP  INSTEAD OF
ALTER TRIGGER Safety2
ON DATABASE
FOR DROP_TABLE
AS
BEGIN
IF(@@ROWCOUNT)=0
RETURN;
PRINT 'you can''t Drop table'
ROLLBACK

END

-- Dropping Table 
DROP TABLE DummyDepartments
SELECT * FROM DummyDepartments
----------------------------------------------------------------------------

--//////////////////////////////////////////////////////////////////////////////




--//////////////////////////////////////////////////////////////////////////////
-- Nested Trigger : Nested Trigger means trigger on table on which we perform query within other trigger.

-----------------------------------------------------------------------------------------------
	-- trigger for insert
	ALTER TRIGGER Trigger3
	ON dbo.DummyDepartments
	FOR Insert
	AS
	BEGIN

		DECLARE @depid int

		SELECT @depid = DepartmentID FROM inserted
		DELETE FROM DummyDepartments WHERE DepartmentID = @depid
	END
	GO

	-- trigger for delete
	-- Trigger2 created already


	-- insert data in DummyDepartments

	INSERT INTO DummyDepartments VALUES(240,'AE',240)

	SELECT * FROM DummyDepartments

-----------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////



--set configure
--//////////////////////////////////////////////////////////////////////////////
SP_Configure 'nested_triggers',1
GO
RECONFIGURE
GO
ALTER DATABASE [Day18 (Trigger)]
SET RECURSIVE_TRIGGERS ON
GO
--////////////////////////////////////////////////////////////////////////////////////



-- Recursive Trigger
--////////////////////////////////////////////////////////////////////////////////////
	ALTER TRIGGER Trigger3
	ON dbo.DummyDepartments
	FOR Insert
	AS
	BEGIN
	IF ((SELECT TRIGGER_NESTLEVEL()) < 32)	
	BEGIN	
		DECLARE @depid int
		DECLARE @dep varchar(25)
		DECLARE @mngid int
		SELECT @depid = DepartmentID ,@dep=DepartmentName , @mngid=ManagerID  FROM inserted
		INSERT INTO DummyDepartments Values (@depid,@dep,@mngid)
	END

	ELSE
	
		PRINT 'limit reach'
	END
	GO



	-- insert data in DummyDepartments

	INSERT INTO DummyDepartments VALUES(230,'AC',230)

	SELECT * FROM DummyDepartments

--////////////////////////////////////////////////////////////////////////////////////
