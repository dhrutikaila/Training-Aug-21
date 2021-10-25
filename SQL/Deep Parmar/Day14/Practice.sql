----------------------Trigger----------------------------------------
----------------------DML Trigger----------------------------------
---------------------INSERT_Trigger----------------------------------
USE BUS_RESERVATION
----------------------------------------------------------------------------------------------------
CREATE TRIGGER TR_CANCELLATION
ON CANCELLATION
AFTER INSERT
AS
BEGIN
	DECLARE @ID INT
	DECLARE @CANCELLED_SEAT TINYINT
	DECLARE @STATUS BIT
	DECLARE @Payment_Id INT
	DECLARE @Schedule_Id INT
	

SELECT @ID=INS.Bd_Id,@STATUS=BD.Booking_Status,@Payment_Id=PT.Payment_ID,@Schedule_Id=T.Schedule_Id,@CANCELLED_SEAT=T.Booked_Seat FROM inserted AS INS
JOIN BOOKING_DETAILS AS BD ON BD.Bd_Id=INS.Bd_Id
JOIN TICKETS AS T ON INS.Ticket_Id=T.Ticket_Id
JOIN PAYMENT AS PT ON PT.Ticket_Id=T.Ticket_Id

IF(@STATUS = 1)
BEGIN

UPDATE BOOKING_DETAILS SET Booking_Status=0 WHERE Bd_Id=@ID

UPDATE PAYMENT SET Payment_Status=0 WHERE Payment_ID=@Payment_Id

UPDATE TRAVEL_SCHEDULE SET Available_Seats=Available_Seats + @CANCELLED_SEAT 
WHERE Schedule_Id=@Schedule_Id

END

ELSE
BEGIN
PRINT('THIS TICKET IS Already CANCELLED')
END

END
-------------------------------------------------------------------------
CREATE TRIGGER TR_BOOKING
ON BOOKING_DETAILS
AFTER INSERT
AS
BEGIN
DECLARE @BOOKING_SEAT TINYINT
DECLARE @Schedule_Id INT

SELECT  @BOOKING_SEAT=T.Booked_Seat,@Schedule_Id=INS.Schedule_Id FROM inserted AS INS 
JOIN TICKETS AS T ON INS.User_Id=T.User_Id WHERE INS.Booking_Status=1

UPDATE TRAVEL_SCHEDULE SET Available_Seats=Available_Seats - @BOOKING_SEAT
WHERE Schedule_Id= @Schedule_Id                                         

END

-- IF SOMEONE SUCCESSFULLY BOOKED THEIR TICKETS THEN 
-- Available_Seats=Available_Seats - BOOKED_SEAT

--		SELECT * FROM TICKETS
--		SELECT * FROM BOOKING_DETAILS
--		SELECT * FROM PAYMENT
--		SELECT * FROM TRAVEL_SCHEDULE
--		SELECT * FROM CANCELLATION

--		INSERT INTO TICKETS (Schedule_Id,Booked_Seat,Ticket_Price,Insurance,User_Id) VALUES(1,6,210,1,1)
--		INSERT INTO PAYMENT (Payment_type,Ticket_Id,Payment_Number,Payment_Status,User_Id) VALUES (15,11,'MehulJ@ybl',1,1)
--		INSERT INTO BOOKING_DETAILS (Booking_Date,Booking_Status,Payment_ID,Schedule_Id,User_Id) VALUES('2021-08-20',1,11,1,1)
   

-- IF SOMEONE CANCEL THEIR TICKET THEN 
-- Available_Seats=Available_Seats + CANCELLED_SEAT 

--		INSERT INTO CANCELLATION (Ticket_Id,Bd_Id) VALUES (11,11)


------------------------Trigger_Inside Another Trigger Call---------------------------------
CREATE TRIGGER TRScrapReason
ON OldScrabReason
AFTER INSERT
AS
BEGIN
PRINT('NESTED OF Trigger')
SELECT * FROM inserted

END

---------------------UPDATE_Trigger----------------------------------

USE AdventureWorks2012

CREATE TRIGGER TR_ScrapReason
ON [Production].[ScrapReason]
AFTER UPDATE
AS
BEGIN

SELECT * FROM inserted

INSERT INTO [dbo].[OldScrabReason]
SELECT Name,ModifiedDate FROM deleted

END

UPDATE [Production].[ScrapReason] SET Name='DEEP' WHERE ScrapReasonID=1

SELECT * FROM OldScrabReason
SELECT * FROM Production.ScrapReason


--------------------------DELETE_Trigger-----------------------------

CREATE TRIGGER TRScrapReason1
ON [dbo].[OldScrabReason]
AFTER DELETE
AS
BEGIN

SELECT * FROM deleted

END

DELETE FROM [dbo].[OldScrabReason] WHERE ScrapReasonID=2

SELECT * FROM [dbo].[OldScrabReason]

------------------------------------------------------------------------------------------
CREATE TRIGGER TR_ProductCategory
ON [Production].[ProductCategory]
INSTEAD OF DELETE
AS
BEGIN
  SELECT 'Sample Instead of trigger' as [Message]
END

DELETE FROM [Production].[ProductCategory] WHERE ProductCategoryID=2

SELECT * FROM [Production].[ProductCategory]

--------------------------DISABLE/ENABLE TRIGGER------------------------------------------------
DISABLE TRIGGER TR_ProductCategory ON [Production].[ProductCategory]

ENABLE TRIGGER TR_ProductCategory ON [Production].[ProductCategory]


---------------------------Dropping a trigger------------------
DROP TRIGGER TR_ProductCategory


-------------------------------Indirect Recursion--------------------------------
CREATE TABLE Temp1 (id INT)
INSERT INTO Temp1 values (1),(2)
 
CREATE TABLE Temp2 (id INT)
INSERT INTO Temp2 values (1),(2)

CREATE TABLE Temp3(id INT)
INSERT INTO Temp3 values (1),(2)

 
CREATE TRIGGER TR_Temp1 
ON Temp1
FOR UPDATE 
AS
BEGIN
UPDATE TEMP2 set ID ='5' where id in (select id from inserted)
END
GO
 
CREATE TRIGGER TR_Temp2 on Temp2
FOR UPDATE 
AS
BEGIN
UPDATE Temp3 set ID ='5' where id in (select id from inserted)
END


CREATE TRIGGER TR_Temp3 on Temp3
FOR UPDATE 
AS
BEGIN
UPDATE Temp1 set ID ='5' where id in (select id from inserted)
END

UPDATE Temp1 set ID ='5' where id =1

EXEC sp_configure 'nested triggers', 0

--------------------------------Trigger For View----------------------------------------

-- Write a SQL statement to increase the minimum and maximum salary of PU_CLERK by 2000 as well as the salary for those employees by 20%
--and commission by 10%
USE TEST
GO

	CREATE VIEW EmployeeSalary
	AS
	SELECT EMP.EmployeeID,EMP.JobId,EMP.Salary,EMP.CommissionPct,J.min_salary,J.max_salary,EMP.ManagerID FROM Employees AS EMP
	JOIN jobs AS J ON J.job_id=EMP.JobId

	
	CREATE TRIGGER Employee_Salary
	ON EmployeeSalary
	INSTEAD OF UPDATE
	AS
	BEGIN
	DECLARE @job_id VARCHAR(10)
	DECLARE @minimum_salary DECIMAL(6,0)
	DECLARE @maximum_salary DECIMAL(6,0)
	DECLARE @salary DECIMAL(8,2)
	DECLARE @commission DECIMAL(2,2)
	DECLARE @ManagerID INT
	
	SELECT @job_id=JobId, @minimum_salary=min_salary,@maximum_salary=max_salary,@salary=Salary,@commission=CommissionPct FROM inserted

	UPDATE jobs SET min_salary=@minimum_salary,max_salary=@maximum_salary WHERE job_id=@job_id

	UPDATE Employees SET Salary=@salary,CommissionPct=@commission WHERE JobId=@job_id
	END


	UPDATE EmployeeSalary 
	SET min_salary=min_salary+2000,
	max_salary=max_salary+2000,
	Salary=Salary+(Salary * 0.20),
	CommissionPct=CommissionPct+(CommissionPct * 0.10) 
	WHERE JobId='PU_CLERK'


	SELECT * FROM EmployeeSalary WHERE JobId='PU_CLERK'
	SELECT * FROM Employees WHERE JobId='PU_CLERK'
	SELECT * FROM jobs WHERE job_id='PU_CLERK'
