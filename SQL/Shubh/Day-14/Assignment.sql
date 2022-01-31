--Assignment:
--Student->StudentID, StudentName, TotalFees,RemainingAmt
--Course->CourseID,CourseName,TotalFees
--CourseEnrolled->StudentID,CourseID
--FeePayment->StudentID,AmountPaid,DateofPayment


CREATE TABLE Student (StudentID INT PRIMARY KEY, StudentName VARCHAR(50), TotalFees INT, RemainingAmt INT)
CREATE TABLE Course (CourseID INT PRIMARY KEY, CourseName VARCHAR(50), TotalFees INT)
CREATE TABLE CourseEnrolled (StudentID INT, CourseID INT)
CREATE TABLE FeePayment (StudentID INT, AmountPaid INT, DateOfPayment DATE)
ALTER TABLE CourseEnrolled ADD CONSTRAINT FkCourseId FOREIGN KEY (CourseID) REFERENCES Course(CourseID) 
ALTER TABLE CourseEnrolled ADD CONSTRAINT FkStudentId FOREIGN KEY (StudentID) REFERENCES Student(StudentID) 
ALTER TABLE FeePayment ADD CONSTRAINT FkStudentIdFees FOREIGN KEY (StudentID) REFERENCES Student(StudentID) 
GO

--1. Create an insert trigger on CourseEnrolled Table, record should be updated in TotalFees Field on the Student table for the respective student.
CREATE TRIGGER Cursenrol
ON CourseEnrolled
FOR INSERT
AS
BEGIN

DECLARE @StudentId INT, @Fees INT, @CourseId INT
SELECT @StudentId=inserted.StudentId, @CourseId=inserted.CourseID FROM inserted
SELECT @Fees= TotalFees FROM Course WHERE CourseID=@CourseId
UPDATE Student
SET TotalFees = TotalFees+@Fees, 
	RemainingAmt = (SELECT CASE WHEN RemainingAmt IS NULL THEN 0
							ELSE RemainingAmt-@Fees END) 
	WHERE StudentID=@StudentId
END

INSERT INTO Student (StudentID, StudentName) VALUES (1,'Srp'),(4, 'Spd'),(2, 'CheckCheck'),(3, 'CHECK')
INSERT INTO Course VALUES (1,'Meme',100000),(2,'Chess',200000)
INSERT INTO CourseEnrolled VALUES (2,2),(1,1)
SELECT * FROM Student
GO


--2. Create an insert trigger on FeePayment, record should be updated in RemainingAmt Field of the Student Table for the respective student.
CREATE TRIGGER FeePay
ON FeePayment
FOR INSERT
AS
BEGIN
DECLARE @StudentId INT, @Fees INT
SELECT @StudentId=inserted.StudentId,@Fees=inserted.AmountPaid FROM inserted
UPDATE Student
SET RemainingAmt = RemainingAmt-@Fees,
	TotalFees= TotalFees+@Fees
	 WHERE StudentID=@StudentId
SELECT * FROM inserted
END
GO
INSERT INTO FeePayment VALUES (2,10001,GETDATE())
SELECT * FROM Student