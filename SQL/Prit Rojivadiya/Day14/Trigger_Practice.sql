USE AdventureWorks2012

-- DDL Trigger

CREATE DATABASE db3
use db3
CREATE TABLE demo
(
id int,
name varchar(20)
)

CREATE TRIGGER tgr_safety
ON DATABASE
FOR ALTER_TABLE,DROP_TABLE
AS
PRINT 'Table from db3 cannot be alter of drop'
ROLLBACK

DROP TABLE demo
ALTER TABLE demo
ADD Email varchar(50)


--------------------------------------------------------------------------------------------------------


-- Insert Trigger

CREATE TRIGGER InsertShift
ON Humanresources.Shift
FOR INSERT
AS
	DECLARE @modefiedDate Datetime
	SELECT @modefiedDate = ModifiedDate FROM inserted
	IF(@modefiedDate != GETDATE())
	BEGIN
		PRINT 'Please enter current date'
		ROLLBACK TRANSACTION
	END

SELECT * FROM HumanResources.Shift
INSERT INTO HumanResources.Shift VALUES ('Noon','01:00:00.0000000','05:00:00.0000000','2008-04-30 00:00:00.000')


--------------------------------------------------------------------------------------------------------


-- Delete Trigger

CREATE TRIGGER delete_dept
ON HumanResources.Department
FOR DELETE
AS
PRINT 'Deletion not allowed'
ROLLBACK TRANSACTION
RETURN

DELETE FROM HumanResources.Department WHERE DepartmentID = 1


--------------------------------------------------------------------------------------------------------


-- Update Trigger

CREATE TRIGGER updated_rate
ON HumanResources.EmployeePayHistory
FOR UPDATE
AS
IF UPDATE(Rate)
BEGIN
	DECLARE @avgRate FLOAT
	SELECT @avgRate = AVG(Rate) FROM HumanResources.EmployeePayHistory
	IF (@avgRate > 15)
	BEGIN
		PRINT 'Average rate cannot be greater than 15'
		ROLLBACK TRANSACTION
	END
END


UPDATE HumanResources.EmployeePayHistory
SET Rate = 125 WHERE BusinessEntityID = 1



--------------------------------------------------------------------------------------------------------



-- after delete trigger

use Demo
SELECT * FROM Employees

CREATE TRIGGER deleteEmp
ON Employees
AFTER DELETE
AS
PRINT 'Deleted successfully'

DELETE FROM Employees WHERE EmployeeID = 3



--------------------------------------------------------------------------------------------------------



-- instead of delete trigger


CREATE TRIGGER deleteEmployee
ON Employees
INSTEAD OF DELETE
AS
PRINT 'Cannot delete'
GO

DELETE FROM Employees WHERE EmployeeID = 2



--------------------------------------------------------------------------------------------------------



-- after insert,update trigger

CREATE TRIGGER reminder1  
ON Sales.Customer  
AFTER INSERT, UPDATE   
AS RAISERROR ('Notify Customer Relations', 16, 10);  
GO

UPDATE Sales.Customer
SET ModifiedDate = '2021-04-04' WHERE TerritoryID = 1




--------------------------------------------------------------------------------------------------------



-- using trigger in view to change column from different tables

use Demo
SELECT * FROM Employee
SELECT * FROM Incentive

CREATE VIEW empIncentiveView
AS
SELECT * FROM Employee e
	JOIN Incentive i ON e.Emp_id = i.Emp_Ref_Id

SELECT * FROM empIncentiveView

UPDATE empIncentiveView
SET Incentive_Amount = 3500,Salary = 35002 WHERE Emp_id = 2

ALTER TRIGGER tgrUpdateView
ON [dbo].[empIncentiveView]
INSTEAD OF UPDATE
AS
BEGIN
	--SELECT * FROM inserted
	--SELECT * FROM deleted

	IF(UPDATE(Salary))
	BEGIN
		UPDATE Employee
		SET Salary = inserted.Salary
		FROM inserted JOIN Employee ON Employee.Emp_id = inserted.Emp_id
	END

	
	IF(UPDATE(Incentive_Amount))
	BEGIN
		UPDATE Incentive
		SET Incentive_Amount = inserted.Incentive_Amount
		FROM inserted JOIN Incentive ON Incentive.Emp_Ref_id = inserted.Emp_Ref_id
	END

END
GO



--------------------------------------------------------------------------------------------------------



-- Nested Trigger

use db2
SELECT * FROM Departments
SELECT * FROM Employees
SELECT * FROM JobHistory

CREATE TRIGGER tgr_deleteDept
ON Departments
FOR DELETE
AS
DELETE FROM Employees WHERE DepartmentID IN (SELECT DepartmentID FROM deleted)

CREATE TRIGGER tgr_deleteEmp
ON Employees
FOR DELETE
AS
DELETE FROM JobHistory WHERE DepartmentID IN (SELECT DepartmentID FROM deleted)

DELETE FROM Departments WHERE DepartmentID = 110
