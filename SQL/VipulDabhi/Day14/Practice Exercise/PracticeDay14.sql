--!**!Trigger!**!


--Syntax
/*CREATE TRIGGER triger_name
ON{OBJECT NAME}
{FOR | AFTER | INSTEAD OF } { event_type [ 
,....] |
DDL_DATABASE_LEVEL_EVENT }
{ AS
{ sql_statement [...n] }
}*/

--!**!Using a DML trigger with a reminder message!**!

CREATE TRIGGER reminder1  
ON Sales.Customer  
AFTER INSERT, UPDATE   
AS RAISERROR ('Notify Customer Relations', 16, 10);  
GO  

--!**!Using a DML trigger with a reminder e-mail message!**!

CREATE TRIGGER reminder2  
ON Sales.Customer  
AFTER INSERT, UPDATE, DELETE   
AS  
   EXEC msdb.dbo.sp_send_dbmail  
        @profile_name = 'AdventureWorks2012 Administrator',  
        @recipients = 'danw@Adventure-Works.com',  
        @body = 'Don''t forget to print a report for the sales force.',  
        @subject = 'Reminder';  
GO  


---********


DROP TRIGGER tr_EmployeeInsert
CREATE TRIGGER tr_EmployeeInsert
ON Employees
FOR INSERT
AS
BEGIN
	SELECT * FROM inserted
	SELECT * FROM deleted
END

INSERT INTO Employees 
	VALUES(209,'Steven','King','not available','515.123.4567','1987-06-17','AD_PRES',32600.00,0.10,0,90)

-------------------

DROP TRIGGER tr_EmployeeInsertByIfCondition
CREATE TRIGGER tr_EmployeeInsertByIfCondition
ON Employees
FOR INSERT
AS
BEGIN
		
		DELETE FROM Employees WHERE EmployeeID IN (207,208,209,210,211)

END

INSERT INTO Employees 
	VALUES(209,'Steven','King','not available','515.123.4567','1987-06-17','AD_PRES',32600.00,0.10,0,90)

SELECT * FROM Employees

--!**!AFTER Trigger!**!
DROP TRIGGER tr_DeleteEmployee
ALTER TRIGGER tr_DeleteEmployee
ON Employees
AFTER DELETE
AS BEGIN
	PRINT 'Deletion is Done!!!!!! '
END

DELETE FROM Employees WHERE EmployeeID IN (207,208,209,210,211)


--!**!INSTEAD OF Trigger!**!
DROP TRIGGER tr_DepartmentDelete
ALTER TRIGGER tr_DepartmentDelete
ON dbo.Departments
INSTEAD OF DELETE
AS BEGIN
	PRINT 'Deletion Of Department Is Not Allowed' 
END

DELETE FROM  Departments WHERE DepartmentID = 10

SELECT * FROM Departments WHERE DepartmentID = 60

--!**!NESTED Trigger!**!

CREATE TRIGGER tr_deleteDepartment
ON Departments
FOR DELETE
AS BEGIN
	
	DECLARE @DepartmentID INT
	SELECT @DepartmentID = DepartmentID FROM deleted
	DELETE FROM Employees WHERE DepartmentID = @DepartmentID

END

ALTER TRIGGER tr_deleteEmployee
ON Employees
FOR DELETE
AS BEGIN

	INSERT  INTO EmployeeHistory SELECT * FROM deleted
	
END

DELETE FROM Departments WHERE DepartmentID = 90

SELECT * FROM EmployeeHistory
SELECT * INTO EmployeeHistory FROM Employees WHERE 1=0
SELECT * FROM Employees WHERE DepartmentID = 90



--!**!Direct Recurvise Trigger!**!

ALTER TRIGGER tr_EMPUpdate
ON EMP
FOR UPDATE
AS BEGIN

	UPDATE EMP SET EmployeeID = 111 WHERE EmployeeID = 100

END

UPDATE EMP SET EmployeeID = 100 WHERE EmployeeID = 111
SELECT * FROM EMP


--!**!Indirect Recursive trigger!**!

select * into EMP1 FROM EMP
select * into EMP2	 FROM EMP
select * into EMP3 FROM EMP
select * from emp1

ALTER TRIGGER tr_EMP1
ON EMP1
FOR UPDATE
AS
BEGIN
	DECLARE @Firstname VARCHAR(20)
	SELECT @Firstname =FirstName FROM deleted
	UPDATE EMP2 SET Firstname = 'AAA' WHERE FirstName  = @Firstname
END

ALTER TRIGGER tr_EMP2
ON EMP2
FOR UPDATE
AS
BEGIN
	DECLARE @Firstname VARCHAR(20)
	SELECT @Firstname =FirstName FROM deleted
	UPDATE EMP3 SET Firstname = 'AAA' WHERE FirstName  = @Firstname
END

ALTER TRIGGER tr_EMP3
ON EMP3
FOR UPDATE
AS
BEGIN
	DECLARE @Firstname VARCHAR(20)
	SELECT @Firstname =FirstName FROM deleted
	UPDATE EMP1 SET Firstname = 'AAA' WHERE FirstName  = @Firstname
END


UPDATE EMP1 SET FirstName = 'rrr' WHERE FirstName = 'Lex'
SELECT * FROM EMP2