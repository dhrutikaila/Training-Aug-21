--INSERT TRIGGER (CALCULATE AMOUNT  OF SESSION )

		CREATE  TRIGGER SESSION_PRICE
		ON SessionRecord
		FOR INSERT 
		AS
		BEGIN
			DECLARE @SessionID INT ,@PORTID INT ,@UNITS decimal(5,2)
			SELECT @SessionID=SessionID ,@PORTID=PORTID,@UNITS=UNITS FROM inserted
			UPDATE SessionRecord
			SET Amount=@UNITS*(SELECT ChargesPerKWH FROM ConnectionPort where PortID=@PORTID )
			where SessionID=@SessionID
		END

		INSERT INTO SessionRecord 
		VALUES (2,4,'2021-08-01 09:30:00.000','2021-08-01 10:30:00.000',0,5.56,'P134987256LJS','1','2021-08-01 00:00:00.000',0)
	
		SELECT * FROM SessionRecord  

--Delete TRIGGER 

		CREATE TRIGGER SET_DELETE
		ON Employees
		FOR DELETE
		AS
		BEGIN
			PRINT 'DELETION NOT ALLOW PLEASE UPDATE ISDELETED AS 1'
			ROLLBACK TRANSACTION
		END



		DELETE FROM Employees  where EmployeeID=11


--UPDATE TRIGGER

		CREATE TRIGGER UPDATE_ISDELETE
		ON Employees
		FOR UPDATE
		AS
		BEGIN
			DECLARE @EmployeeID int,@IsDeleted bit
			SELECT @EmployeeID=EmployeeID,@IsDeleted=IsDeleted FROM INSERTED
			if @IsDeleted=1
			PRINT 'EmployeeID  '+cast(@EmployeeID as varchar)+' ISDELETE SET AS 1'
		END



		UPDATE Employees 
		SET IsDeleted=1 
		WHERE EmployeeID=11



--AFTER DELETE

		USE DAY6

		CREATE TRIGGER EMP_DEL
		ON Employees
		AFTER DELETE
		AS
		BEGIN
			PRINT 'Deletion Successful'
		END


		DELETE  FROM Employees 
		WHERE EmployeeID=110


--INSTERD OF DELETE

		CREATE TRIGGER SET_DELETE_A
		ON Employees
		INSTEAD OF DELETE
		AS
		BEGIN
			PRINT 'DELETION NOT ALLOW PLEASE UPDATE ISDELETED AS 1'
		END

		SELECT * FROM Employees

		DELETE FROM Employees  where EmployeeID=100

--2

		CREATE TRIGGER SET_ISDELETE
		ON Employees
		INSTEAD OF DELETE
		AS
		BEGIN
			DECLARE @EmployeeID INT
			SELECT @EmployeeID=EmployeeID FROM deleted
			UPDATE Employees
			SET IsDeleted=1
			WHERE EmployeeID=@EmployeeID
			PRINT 'DELETION NOT ALLOW BUT  ISDELETED SET AS 1'
		END

		DELETE FROM Employees  WHERE EmployeeID=13
		SELECT * FROM Employees



--DDL TRIGGER 

		CREATE TRIGGER SAFETY
		ON DATABASE
		FOR DROP_TABLE,ALTER_TABLE 
		AS
		BEGIN
			PRINT 'NOT ALLOW TO DELETE AND ALTER'
			ROLLBACK TRANSACTION
		END

		DROP TABLE Employees


--ALTER TRIGGER

		ALTER TRIGGER SAFETY
		ON DATABASE
		FOR DROP_TABLE,ALTER_TABLE 
		AS
		BEGIN
			PRINT 'NOT ALLOW TO DELETE AND ALTER'
			ROLLBACK TRANSACTION
		END

--DROP TRIGGER

	   DROP TRIGGER SAFETYY

	
--DIRECT RECURSIVE TRIGGER
	    
		ALTER DATABASE evf SET RECURSIVE_TRIGGERS ON
		GO
		
		USE DAY4


		ALTER TRIGGER NESTED
		ON Employees
		FOR UPDATE 
		AS
		BEGIN
			PRINT 'IN 1ND TRIGGER'
			UPDATE Employees
			SET FirstName='vraj'
			WHERE EmployeeID=3
		END


		UPDATE Employees
		SET FirstName='vraj'
		WHERE EmployeeID=3
	


	 
--NESTED TRIGGER

--ERROR--Maximum stored procedure, function, trigger, or view nesting level exceeded (limit 32).
--SET ISDELETED AS 1 IN Employees AND ALSO EmployeeWorksAt


		ALTER TRIGGER SET_ISDELETE
		ON Employees
		INSTEAD OF DELETE
		AS
		BEGIN
			DECLARE @EmployeeID INT
			SELECT @EmployeeID=EmployeeID FROM deleted
				UPDATE Employees
				SET IsDeleted=1
				WHERE EmployeeID=@EmployeeID
			PRINT '1'
			PRINT 'DELETION NOT ALLOW BUT  ISDELETED SET AS 1'
		END

		--1
		DELETE FROM Employees  WHERE EmployeeID=3
		SELECT * FROM Employees


		ALTER TRIGGER UPDATE_Employees_ISDELETE
		ON Employees
		FOR UPDATE
		AS
		BEGIN
			DECLARE @EmployeeID int,@IsDeleted bit
			SELECT @EmployeeID=EmployeeID,@IsDeleted=IsDeleted FROM INSERTED
			if @IsDeleted=1
			PRINT '2'
			PRINT ' IN UPDATE_Employees_ISDELETE'
				update EmployeeWorksAt
				SET IsDeleted=1
				WHERE EmployeeID=@EmployeeID
       	END


		ALTER TRIGGER UPDATE_EmployeeWorksAt
		ON EmployeeWorksAt
		FOR UPDATE
		AS
		BEGIN
			DECLARE @EmployeeID int,@IsDeleted bit
			PRINT '3'
			SELECT @EmployeeID=EmployeeID,@IsDeleted=IsDeleted FROM INSERTED
			if @IsDeleted=1
			PRINT 'UPDATE_EmployeeWorksAt'
		END


		UPDATE Employees SET IsDeleted=1  WHERE EmployeeID=3

		
		SELECT * FROM EmployeeWorksAt
        SELECT * from Employees
		


--INDIRECT RECURSIVE TRIGGER

     

		CREATE TRIGGER SET_ISDELETE
		ON Employees
		INSTEAD OF DELETE
		AS
		BEGIN
			DECLARE @EmployeeID INT
			SELECT @EmployeeID=EmployeeID FROM deleted
				UPDATE Employees
				SET IsDeleted=1
				WHERE EmployeeID=@EmployeeID
			PRINT '1'
			PRINT 'DELETION NOT ALLOW BUT  ISDELETED SET AS 1'
		END

		--1
		DELETE FROM Employees  WHERE EmployeeID=3
		SELECT * FROM Employees


		ALTER TRIGGER UPDATE_Employees_ISDELETE
		ON Employees
		FOR UPDATE
		AS
		BEGIN
			DECLARE @EmployeeID int,@IsDeleted bit
			SELECT @EmployeeID=EmployeeID,@IsDeleted=IsDeleted FROM INSERTED
			if @IsDeleted=1
			PRINT '2'
			PRINT ' IN UPDATE_Employees_ISDELETE'
				update EmployeeWorksAt
				SET IsDeleted=1
				WHERE EmployeeID=@EmployeeID
       	END


		ALTER TRIGGER UPDATE_EmployeeWorksAt
		ON EmployeeWorksAt
		FOR UPDATE
		AS
		BEGIN
			DECLARE @EmployeeID int,@IsDeleted bit
			PRINT '3'
			SELECT @EmployeeID=EmployeeID,@IsDeleted=IsDeleted FROM INSERTED
			DELETE FROM Employees  WHERE EmployeeID=3

			if @IsDeleted=1
			PRINT 'UPDATE_EmployeeWorksAt'
		END


		UPDATE Employees SET IsDeleted=1  WHERE EmployeeID=3

		
		SELECT * FROM EmployeeWorksAt
        SELECT * from Employees
--===========================================================	
--ERROR 

--Msg 570, Level 16, State 1, Procedure UPDATE_EmployeeWorksAt, Line 9 [Batch Start Line 273]INSTEAD OF triggers do not support direct recursion. The trigger execution failed.

--===========================================================

