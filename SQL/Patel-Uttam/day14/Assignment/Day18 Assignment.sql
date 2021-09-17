USE [Day18 (Trigger)]

-- Assignment

/*

Table
------------------------------------------------------------------------------------

Student->StudentID, StudentName, TotalFees,RemainingAmt

Course->CourseID,CourseName,TotalFees

CourseEnrolled->StudentID,CourseID

FeePayment->StudentID,AmountPaid,DateofPayment
------------------------------------------------------------------------------------


Create an insert trigger on CourseEnrolled Table, record should be updated in TotalFees Field on the Student table for the respective student.
Create an insert trigger on FeePayment, record should be updated in RemainingAmt Field of the Student Table for the respective student.


*/


-----------------------------------------------------------------------------------------------

--CREATE TABLE Course
--(
--	CourseID int Primary Key, 
--	CourseName varchar(50) NOT NULL, 
--	TotalFees int NOT NULL

--);

--CREATE TABLE Student
--(
--	StudentID int Primary Key, 
--	StudentName varchar(25) NOT NULL, 
--	TotalFees int NULL DEFAULT 0,
--	RemainingAmt int NULL DEFAULT 0

--);

--CREATE TABLE CourseEnrolled
--(
--	StudentID int NOT NULL CONSTRAINT FK_stdID FOREIGN KEY REFERENCES Student(StudentID),
--	CourseID int NOT NULL CONSTRAINT FK_cosID FOREIGN KEY REFERENCES Course(CourseID)
--);

--CREATE TABLE FeePayment
--(
--	StudentID int NOT NULL,
--	AmountPaid int NOT NULL,
--	DateofPayment DATE DEFAULT GetDate()

--);

INSERT INTO Course VALUES (2021,'C',3500),(2022,'JAVA',5000),(2023,'Python',7000),(2024,'Compiler Design',4000),(2025,'Web development',4500)

--SELECT * FROM Student

INSERT INTO Student(StudentID , StudentName) VALUES (5,'Harsh'),(2,'Rutul'),(1,'Jinesh'),(3,'Marmik'),(4,'Om')

-----------------------------------------------------------------------------------------------





--Create an insert trigger on CourseEnrolled Table, record should be updated in TotalFees Field on the Student table for the respective student.
-----------------------------------------------------------------------------------------------

GO
ALTER TRIGGER trigger_test_1
ON CourseEnrolled
FOR INSERT
AS 
BEGIN
	 
		 DECLARE @stdid int
		 DECLARE @crsid int
		 DECLARE @crsamount int
 
  
		  -- select studentid
		  SELECT @stdid=StudentID , @crsid=CourseID FROM inserted
		  -- select course amount
		  SELECT @crsamount=TotalFees FROM Course WHERE CourseID = @crsid
		  
		  IF (@stdid) IN (SELECT StudentID FROM Student WHERE StudentID=@stdid) AND (@crsid) IN (SELECT CourseID FROM Course WHERE CourseID=@stdid)
		  BEGIN
		  
		  -- add course amount to Student table
		  UPDATE Student SET TotalFees = TotalFees+@crsamount , RemainingAmt = RemainingAmt+@crsamount WHERE StudentID=@stdid
		  END
		  
		  ELSE
		  BEGIN
			PRINT 'Invalid StudenID or CourseID '
		  END

	END
	PRINT 'Done'
	PRINT @stdid
	PRINT @crsid
	PRINT @crsamount
GO

-- insert in CourseEnrolled
 INSERT INTO CourseEnrolled VALUES(4,2024)

--SELECT * FROM CourseEnrolled
-----------------------------------------------------------------------------------------------



--Create an insert trigger on FeePayment, record should be updated in RemainingAmt Field of the Student Table for the respective student.
-----------------------------------------------------------------------------------------------
GO
ALTER TRIGGER Trigger_test_2
ON [Day18 (Trigger)].dbo.FeePayment
FOR INSERT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @stdid int
	DECLARE @credit_amount int
	DECLARE @total_amount int
	DECLARE @remain_amount int
	DECLARE @date DATE 

	SELECT @stdid=StudentID , @credit_amount=AmountPaid FROM inserted

	IF (@stdid) IN ( SELECT DISTINCT StudentID FROM CourseEnrolled)
	BEGIN
		SELECT @total_amount = TotalFees , @remain_amount = RemainingAmt FROM [Day18 (Trigger)].dbo.Student WHERE StudentID=@stdid

		IF (@credit_amount) <= (@remain_amount)
		BEGIN
			UPDATE [Day18 (Trigger)].dbo.Student SET RemainingAmt = (RemainingAmt-@credit_amount) WHERE StudentID = @stdid
			PRINT 'now you have' + STR(@remain_amount -@credit_amount) + '  Remain to Pay'
		END
		ELSE
		BEGIN
			PRINT 'You just have to pay '+STR(@remain_amount) + '  Not ' + STR(@credit_amount) + ' /// '+' or you don''t have remain amount to pay'
			ROLLBACK ;
		END
	END
	ELSE
	BEGIN
		PRINT 'StudentID ' + STR(@stdid,1000) + ' ' + 'has not enrolled in any course'
		ROLLBACK ;
	END
	SET NOCOUNT OFF;
END

-- insert into Feeinsert
INSERT INTO FeePayment(StudentID,AmountPaid) VALUES(2,1500)

--SELECT * FROM FeePayment

--SELECT * FROM Student

-----------------------------------------------------------------------------------------------
