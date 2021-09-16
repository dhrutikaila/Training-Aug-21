CREATE DATABASE Trigger_database

USE Trigger_database


---- Student->StudentID, StudentName, TotalFees,RemainingAmt

---- Course->CourseID,CourseName,TotalFees

---- CourseEnrolled->StudentID,CourseID

---- FeePayment->StudentID,AmountPaid,DateofPayment


CREATE TABLE Student
(
    StudentId INT PRIMARY KEY IDENTITY,
    StudentName NVARCHAR(25) NOT NULL,
    TotalFees INT NOT NULL,
    RemainingAmt INT DEFAULT 0
)

 INSERT INTO Student VALUES ('Raj Thakkar',0,NULL),
							('Preet Gandhi',0,0),
							('Deep Parmar',0,0),
							('Hardik Niranjani',0,0),
							('Dilip Kumavat',0,0)

SELECT * FROM Student
TRUNCATE TABLE Student
DROP DATABASE Student

CREATE TABLE Course
(
    CourseId INT PRIMARY KEY IDENTITY,
    CourseName NVARCHAR(20) NOT NULL,
    TotalFees INT NOT NULL
)

 INSERT INTO Course VALUES('JavaScript',3000),
						 ('CSS',2000),
						 ('Html',1000),
						 ('React JS',5000),
						 ('SQL',4000)

SELECT * FROM Course
			

CREATE TABLE CourseEnrolled
(
    StudentID INT FOREIGN KEY REFERENCES Student(StudentId) NOT NULL,
    CourseID INT FOREIGN KEY REFERENCES Course(CourseId) NOT NULL
)

TRUNCATE TABLE CourseEnrolled


CREATE TABLE FeePayment
(
    StudentID INT FOREIGN KEY REFERENCES Student(StudentId) NOT NULL,
    AmountPaid INT NOT NULL,
    DateofPayment DATE NOT NULL
)

---- Create an insert trigger on CourseEnrolled Table, record should be updated in TotalFees Field on the Student table for the respective student. ---

CREATE TRIGGER trgCourseEnrolled
ON CourseEnrolled
FOR INSERT 
AS
BEGIN
	DECLARE @CourseId INT,@StudentId INT,@Fees INT
	SELECT @CourseId = CourseID,@StudentId = StudentID FROM inserted
	SET @Fees = (SELECT TotalFees FROM Course WHERE CourseId = @CourseId)
	UPDATE Student SET TotalFees = @Fees,RemainingAmt = @Fees WHERE StudentId = @StudentId
	SELECT * FROM Student
END

INSERT INTO CourseEnrolled VALUES (1,4)
SELECT * FROM Student

---- Create an insert trigger on FeePayment, record should be updated in RemainingAmt Field of the Student Table for the respective student. ---

CREATE TRIGGER trgFeesPaymentINSERT
ON FeePayment
FOR INSERT
AS
BEGIN
	DECLARE @studentId INT,@PaidFees INT,@CurrentDate DATE
	SELECT @studentId = StudentID,@PaidFees = AmountPaid,@CurrentDate = DateofPayment  FROM inserted
	UPDATE Student SET RemainingAmt -= @PaidFees WHERE StudentId = @studentId
	SELECT * FROM Student
END

INSERT INTO FeePayment VALUES (1,2500,GETDATE())
SELECT * FROM Student
TRUNCATE TABLE FeePayment

