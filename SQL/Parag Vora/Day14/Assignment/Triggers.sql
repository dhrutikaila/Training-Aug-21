-- 1)Create an insert trigger on CourseEnrolled Table, record should be updated in TotalFees Field on the Student table for the respective student.

    CREATE TRIGGER trgInsertInfo
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

    -- EXECUTING QUERIES
        INSERT INTO CourseEnrolled VALUES(7,2)
        INSERT INTO CourseEnrolled VALUES(8,4)
        INSERT INTO CourseEnrolled VALUES(1,5)
        INSERT INTO CourseEnrolled VALUES(2,1),(3,5)

-- 2)Create an insert trigger on FeePayment, record should be updated in RemainingAmt Field of the Student Table for the respective student.

    CREATE TRIGGER INSFEES
    ON FeePayment
    FOR INSERT
    AS
    BEGIN
        DECLARE @StudentID INT,@AmountPaid MONEY
        SELECT @StudentID=StudentID,@AmountPaid=AmountPaid FROM INSERTED 
        UPDATE Student
        SET RemainingAmt=RemainingAmt+(TotalFees-@AmountPaid)
        WHERE StudentID=@StudentID
    END

    -- EXECUTING QUERIES
        INSERT INTO FeePayment VALUES(8,20000,'2021-06-09'),(1,12000,'2021-08-16')
        INSERT INTO FeePayment VALUES(7,4200,'2021-06-09')

        
