USE Day14
GO

SELECT * FROM Student
SELECT * FROM Course
SELECT * FROM CourseEnrolled
SELECT * FROM FeePayment
GO

--1-Create an insert trigger on CourseEnrolled Table, record should be updated in TotalFees Field on the Student table for the respective student.
CREATE TRIGGER dbo.trgInsertCourseEnrolled
ON CourseEnrolled
FOR INSERT 
AS
BEGIN
    DECLARE @Sid INT, @Cid INT, @TotalSid DECIMAL(9,2), @TotalCid DECIMAL(9,2), @RemainSid DECIMAL(9,2)

    SELECT @Sid= StudentID, @Cid= CourseID 
    FROM inserted

    SELECT @TotalSid = TotalFees, @RemainSid = RemainingAmt
    FROM Student
    WHERE StudentID = @Sid

    SELECT @TotalCid = TotalFees
    FROM Course
    WHERE CourseID = @Cid

    SET @TotalSid = @TotalSid + @TotalCid
    SET @RemainSid = @RemainSid + @TotalCid
    
    UPDATE Student
    SET TotalFees = @TotalSid
        ,    RemainingAmt = @RemainSid
    WHERE StudentID = @Sid
    
    PRINT 'Record Updated Successfully in Student Also.'
END
GO

INSERT INTO CourseEnrolled
	VALUES(2, 1)
GO

--2-Create an insert trigger on FeePayment, record should be updated in RemainingAmt Field of the Student Table for the respective student.
CREATE TRIGGER dbo.trgInsertFeePayment
ON FeePayment
FOR INSERT
AS
	DECLARE @Sid INT, @AmountPaid DECIMAL(9,2), @RemainSid DECIMAL(9,2)
		
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
GO

DROP TRIGGER dbo.trgInsertFeePayment

INSERT INTO FeePayment(StudentID,AmountPaid)
	VALUES(1,180000)

SELECT * FROM Student

SELECT * FROM FeePayment
