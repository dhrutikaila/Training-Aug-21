USE Assignment2
GO

-- Assignment

CREATE TABLE Student(
		StudentID INT IDENTITY(1,1)
	,	StudentName NVARCHAR(30) 
	,	TotalFees MONEY DEFAULT 0
	,	RemainingAmt MONEY DEFAULT 0
	,	CONSTRAINT PKStudentStudentID PRIMARY KEY(StudentID)
)

CREATE TABLE Course(
		CourseID INT IDENTITY(1,1)
	,	CourseName NVARCHAR(30)
	,	TotalFees MONEY DEFAULT 0
	,	CONSTRAINT PKCourseCourseID PRIMARY KEY(CourseID)
)

CREATE TABLE CourseEnrolled(
		StudentID INT 
	,	CourseID INT
	,	CONSTRAINT PKCourseEnrolled PRIMARY KEY(StudentID,CourseID)
	,	CONSTRAINT FKCourseEnrolledStudent FOREIGN KEY(StudentID) REFERENCES Student(StudentID)
	,	CONSTRAINT FKCourseEnrolledCourse FOREIGN KEY(CourseID) REFERENCES Course(CourseID)
)

CREATE TABLE FeePayment(
		StudentID INT
	,	AmountPaid MONEY DEFAULT 0
	,	DateofPayment DATE DEFAULT GETDATE()
)

--DROP Table Student
--DROP Table Course
--DROP Table CourseEnrolled
--DROP Table FeePayment

--  Insert Values

INSERT INTO Student(StudentName)
VALUES ('Niraj Surati')
	,	('Sagar Bhatt')
	,	('Meet Shah')
	,	('Vinod Patel')
	,	('Manthan Mehta')

INSERT INTO Course
VALUES ('MCA',150000)
	,	('BCA',100000)
	,	('Bcom',100000)
	,	('Mcom',150000)
GO

-- 1. Create an insert trigger on CourseEnrolled Table, record should be updated in TotalFees Field on the Student table for the respective student.

CREATE TRIGGER trgCourseEnrolled
ON CourseEnrolled
FOR INSERT 
AS
BEGIN
	DECLARE @Sid INT , @Cid INT, @TotalSid MONEY, @TotalCid MONEY, @RemainSid MONEY
		
		SELECT @Sid= StudentID 
		FROM inserted

		SELECT @Cid= CourseID 
		FROM inserted
	
		SELECT @TotalSid = TotalFees
		FROM Student
		WHERE StudentID = @Sid

		SELECT @TotalCid = TotalFees
		FROM Course
		WHERE CourseID = @Cid

		SELECT @RemainSid = RemainingAmt
		FROM Student
		WHERE StudentID = @Sid

	SET @TotalSid = @TotalSid + @TotalCid
	SET @RemainSid = @RemainSid + @TotalCid

		UPDATE Student
		SET TotalFees = @TotalSid
			,	RemainingAmt = @RemainSid
		WHERE StudentID = @Sid
		PRINT 'Record Updated Successfully in Student Also.'
END
GO

DROP TRIGGER trgCourseEnrolled
GO

INSERT INTO CourseEnrolled VALUES(5,4)
Go 

SELECT *
FROM Student
GO

-- 2. Create an insert trigger on FeePayment, record should be updated in RemainingAmt Field of the Student Table for the respective student.

CREATE TRIGGER trgFeePayment
ON FeePayment
FOR INSERT 
AS
BEGIN
	DECLARE @Sid INT, @AmountPaid MONEY, @RemainSid MONEY
		
	SELECT @Sid= StudentID 
		,	@AmountPaid = AmountPaid
	FROM inserted
	
	SELECT @RemainSid = RemainingAmt
	FROM Student
	WHERE StudentID = @Sid

	SET @RemainSid = @RemainSid - @AmountPaid
	
	IF @RemainSid < 0
	BEGIN
		PRINT 'Record Couldn''t be Updated.'
		ROLLBACK
	END
	ELSE
	BEGIN
		UPDATE Student
		SET RemainingAmt = @RemainSid
		WHERE StudentID = @Sid
		PRINT 'Record Updated Successfully in Student Also.'
	END
END
GO

DROP TRIGGER trgFeePayment

INSERT INTO FeePayment(StudentID,AmountPaid)
	VALUES(1,130000)

SELECT * FROM Student

SELECT * FROM FeePayment

