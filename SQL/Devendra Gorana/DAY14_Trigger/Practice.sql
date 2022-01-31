--TRIGGER--
--Create Trigger After Deletion
CREATE TRIGGER After_Triger ON Employees
AFTER DELETE
AS
PRINT 'Deletion Successful'

DELETE FROM Employees WHERE FirstName = 'Luis'

--Delete The Trigger
DROP TRIGGER After_Triger

--Create Trigger Instead of Deletion
ALTER TRIGGER Instead_Of_Triger ON Employees
INSTEAD OF DELETE
AS
PRINT 'Records Cannot be deleted'

DELETE FROM Employees WHERE FirstName = 'Luis'

--Detete the Trigger
DROP TRIGGER Instead_Of_Triger

--Create Trigger for update
CREATE TRIGGER Update_trg ON Employees
FOR UPDATE
AS
SELECT * FROM inserted
SELECT * FROM deleted


UPDATE Employees SET LastName = 'Khan' WHERE FirstName = 'Roy'
--Delete The Trigger
DROP TRIGGER Update_trg


ALTER TRIGGER Update_trg ON Employees
FOR UPDATE
AS BEGIN

INSERT INTO CHANGESEMPLOYEE
SELECT * FROM deleted
END

--SELECT * INTO CHANGESEMPLOYEE FROM Employees WHERE 1=0


UPDATE Employees SET LastName = 'Mheta' WHERE FirstName = 'Roy'


SELECT * FROM Employees
SELECT * FROM CHANGESEMPLOYEE

--Delete the Trigger
DROP TRIGGER Update_trg

