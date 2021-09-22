--- Create an insert trigger on CourseEnrolled Table, record should be updated in TotalFees Field on the Student table for the respective student.
CREATE TRIGGER insert_data
    ON CourseEnrolled
    FOR INSERT
    AS
    BEGIN
        DECLARE @CourseID int,@StudentID INT
        SELECT @CourseID=CourseID ,@StudentID=StudentID FROM inserted
        UPDATE Student
        SET TotalFees=TotalFees+(SELECT TotalFees FROM Course WHERE CourseID=@CourseID)
        WHERE  StudentID=@StudentID
    END

 INSERT INTO CourseEnrolled VALUES (2,1)

 
  
---Create an insert trigger on FeePayment, record should be updated in RemainingAmt Field of the Student Table for the respective student


select * from FeePayment


CREATE TRIGGER Fees_data
ON FeePayment
FOR INSERT
AS
BEGIN
DECLARE @studentid INT , @amountpaid INT
SELECT @studentid=StudentID,@amountpaid=AmountPaid FROM INSERTED
UPDATE Student
SET RemainingAmt = RemainingAmt+(TotalFees-@amountpaid)
WHERE StudentID=@studentid
END


INSERT INTO FeePayment values (2,6000,'2021-05-25')

