USE Practice

--Trigger
--DML Trigger

CREATE TRIGGER UpdateTgr
	ON Demo4
		FOR UPDATE
			AS
				SELECT * FROM inserted
				SELECT * FROM deleted

UPDATE Demo4 SET Name = 'John' WHERE Id=1

-----------------------

CREATE TRIGGER DeleteTgr
	ON Demo4
		FOR DELETE
			AS
				PRINT 'Deleted Successfully!'

DELETE FROM Demo4 WHERE Id=17


-----------------------

CREATE TRIGGER InsertTgr
	ON Demo4
		FOR INSERT
			AS
				DECLARE @Name VARCHAR(50),@City VARCHAR(50),@State VARCHAR(40),@IsMarried BIT
				SELECT @Name=Name,@City=City,@State=State,@IsMarried=IsMarried  FROM Demo4
				INSERT INTO Demo6 VALUES (@Name,@City,@State,@IsMarried)

SELECT * FROM DEMO6
SELECT * FROM Demo4

DROP TRIGGER InsertTgr

INSERT INTO Demo4 VALUES ('Prince','Ahmedabad','Gujarat',22,1)


-----------------------

CREATE TRIGGER AfterTgr
	ON Demo6
		AFTER DELETE 
			AS
				PRINT 'Deleted Successfully!'
	
DELETE FROM Demo6 WHERE Name='John'

--DDL Trigger

CREATE TRIGGER DdlTrigger
	ON ALL SERVER 
		FOR DROP_TABLE
			AS
				PRINT 'You dont have permission to drop the table'

ALTER TRIGGER DdlTrigger
	ON ALL SERVER 
		FOR DROP_TABLE
			AS
				PRINT 'You dont have permission to drop the table'
				ROLLBACK TRANSACTION

DROP TRIGGER DdlTrigger

ALTER TRIGGER DdlTrigger
	ON ALL SERVER 
		FOR DROP_TABLE
			AS
				DROP TRIGGER DdlTrigger

-----------------------


--Instead of Trigger

CREATE TRIGGER InsteadOfTgr
	ON Demo4
		INSTEAD OF DELETE
			AS
				PRINT 'Records Cannot be deleted'

DELETE FROM Demo4 WHERE Id=11


--Nested/Recursive Trigger

CREATE TRIGGER NestedDelete1
	ON Demo4
		FOR DELETE
			AS
				DECLARE @Name VARCHAR(30)
				SET @Name = (SELECT Name  FROM deleted)
				DELETE FROM Demo6 WHERE Name = @Name

CREATE TRIGGER NestedDelete2
	ON Demo6
		FOR DELETE
			AS
				DECLARE @Name VARCHAR(30)
				SET @Name = (SELECT Name  FROM deleted)
				DELETE FROM Demo7 WHERE Name = @Name

CREATE TRIGGER NestedDelete3
	ON Demo7
		FOR DELETE
			AS
				DECLARE @Name VARCHAR(30)
				SET @Name = (SELECT Name  FROM deleted)
				DELETE FROM Demo4 WHERE Name = @Name

SELECT * FROM Demo4
SELECT * FROM Demo6
SELECT * FROM Demo7

DELETE FROM Demo4 WHERE Name='John'
DELETE FROM Demo6 WHERE Name='John'

SELECT * INTO Demo4 FROM Demo6

DROP TABLE Demo4

DROP TRIGGER NestedDelete1,NestedDelete2,NestedDelete3

INSERT INTO Demo4 VALUES ('John','Ahmedabad','Guj',22,1)