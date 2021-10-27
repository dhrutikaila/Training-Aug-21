CREATE DATABASE TriggerTask

use TriggerTask

CREATE TABLE Student
(StudentID INT PRIMARY KEY ,
StudentName VARCHAR(30),
TotalFees MONEY,
RemainingAmt MONEY)


INSERT INTO Student VALUES (1,'Shreya',8000,2000),(2,'Diya',7000,1000),(3,'Dharal',8000,1000)

CREATE TABLE Course
(CourseID INT PRIMARY KEY,
CourseName VARCHAR(30),
TotalFees MONEY)

INSERT INTO Course VALUES (101,'INTERNET OF THINGS',20000),(102,'MACHINE LEARNING',30000),(103,'ARTIFICIAL INTELLIGENCE',35000)

CREATE TABLE CourseEnrolled(
StudentID INT CONSTRAINT CourseEnrolled_StudentID_fk  REFERENCES Student(StudentID) ,
CourseID INT CONSTRAINT CourseEnrolled_CourseID_fk  REFERENCES Course(CourseID)
)

INSERT INTO CourseEnrolled  VALUES (1,101),(1,102),(2,103),(3,101),(3,103)

CREATE TABLE FeePayment(
StudentID INT CONSTRAINT FeePayment_StudentID_fk  REFERENCES Student(StudentID) ,
AmountPaid MONEY,
DateofPayment DATE)

INSERT INTO FeePayment VALUES (1,6000,'2021-08-07'),(1,6000,'2021-08-05'),(3,7000,'2021-08-09')

--Create an insert trigger on CourseEnrolled Table, record should be updated in TotalFees Field on the Student table for the respective student.

ALTER TRIGGER [dbo].Q1_tgrStudent ON CourseEnrolled
FOR INSERT
AS
BEGIN

DECLARE @CourseId INT,@stuId INT,@totalFees MONEY
SELECT @stuId=StudentID,@CourseId=CourseID FROM CourseEnrolled
SELECT @totalFees=TotalFees FROM Course WHERE CourseID=@CourseId

UPDATE Student SET TotalFees=TotalFees+@totalFees WHERE StudentID=@stuId

END

INSERT INTO CourseEnrolled VALUES (2,102)

SELECT * FROM Student
SELECT * FROM CourseEnrolled

--Create an insert trigger on FeePayment, record should be updated in RemainingAmt Field of the Student Table for the respective student

SELECT * FROM FeePayment
SELECT * FROM Student


ALTER TRIGGER Q2_tgrStudent ON FeePayment
FOR INSERT
AS
BEGIN

DECLARE  @stuId INT,@totalFees MONEY,@amtPaid MONEY

SELECT @stuId=StudentID FROM FeePayment
SELECT @amtPaid=AmountPaid FROM FeePayment

UPDATE Student SET RemainingAmt=TotalFees-@amtPaid WHERE StudentID=@stuId

END

SELECT * FROM Student
SELECT * FROM FeePayment

INSERT INTO FeePayment VALUES (2,3000,'2021-05-1')