
--- Create an insert trigger on CourseEnrolled Table, record should be updated in TotalFees Field on the Student table for the respective student.

ALTER TRIGGER UpdateDetail 
ON CourseEnrolled
FOR INSERT AS
IF @@ROWCOUNT=1
BEGIN
	UPDATE Student
	SET TotalFees=TotalFees+(SELECT TotalFees FROM Course WHERE inserted.CourseID=Course.CourseID)
	FROM inserted
	WHERE Student.StudentID=inserted.StudentID
END
ELSE
BEGIN
	UPDATE Student
	SET TotalFees=TotalFees+
	(SELECT SUM(TotalFees) 
		FROM Course 
		WHERE CourseID IN (SELECT CourseID FROM inserted WHERE Student.StudentID=inserted.StudentID))
	FROM inserted
	WHERE Student.StudentID IN( SELECT StudentID FROM inserted)
END


---- Create an insert trigger on FeePayment, record should be updated in RemainingAmt Field of the Student Table for the respective student.

CREATE TRIGGER UpdateFees 
ON FeePayment 
FOR INSERT AS
IF @@ROWCOUNT=1
BEGIN
	UPDATE Student
	SET RemainingAmount=RemainingAmount-AmountPaid
	FROM inserted
	WHERE Student.StudentID=inserted.StudentID  		 
END
ELSE
BEGIN
	UPDATE Student
	SET RemainingAmount=RemainingAmount-(SELECT SUM(AmountPaid) FROM inserted WHERE Student.StudentID=inserted.StudentID)
	FROM inserted
	WHERE Student.StudentID=inserted.StudentID
END

