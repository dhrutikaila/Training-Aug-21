--------------DAY-14--------------
USE SANDY
-------ASSIGNMENT
--Student->StudentID, StudentName, TotalFees,RemainingAmt
Create Table Student(
StudentID Int Primary Key,
StudentName Varchar(100) Not Null,
TotalFees Int,
RemainingAMt Int
)
--Course->CourseID,CourseName,TotalFees
Create Table Course(
CourseID Int Primary Key,
CourseName Varchar(30),
TotalFees Int
)
--CourseEnrolled->StudentID,CourseID
Create Table CourseEnrolled(
StudentID Int Foreign Key References DBO.Student(StudentID),
CourseID Int Foreign Key References DBO.Course(CourseID)
)

--FeePayment->StudentID,AmountPaid,DateofPayment
Create Table FeePayment(
StudentID Int Foreign Key References DBO.Student(StudentID),
AmountPaid Int,
DateOfPayment Date
)

--Create an insert trigger on CourseEnrolled Table, record should be updated in TotalFees Field on the Student table for the respective student.
Create Trigger UpdateTotalFees ON CourseEnrolled
For INSERT
AS
BEGIN
Declare @CourseFee Int,@CourseID Int,@StudentID Int
Select @CourseID = CourseID,@StudentID = StudentID From inserted
Select @CourseFee = TotalFees From Course Where CourseID = @CourseID
Update Student
SET TotalFees = TotalFees + @CourseFee
Where StudentID = @StudentID
END

--QUERIES
INSERT INTO CourseEnrolled VALUES
(2,115)
--Create an insert trigger on FeePayment, record should be updated in RemainingAmt Field of the Student Table for the respective student.
Create Trigger UpdateRemainingAmt ON FeePayment
For Insert
As
BEGIN
Declare @AmountPaid Int,@StudentID Int
Select @AmountPaid = AmountPaid,@StudentID=StudentID From inserted
Update Student
Set RemainingAMt = RemainingAMt-@AmountPaid
WHERE StudentID = @StudentID
END

--QUERIES
INSERT INTO FeePayment VALUES
(2,20000,SYSDATETIME())
--SELECT
SELECT * FROM Student
SELECT * FROM Course
SELECT * FROM CourseEnrolled
SELECT * FROM FeePayment
--INSERT
INSERT INTO STUDENT VALUES
(1, 'HARSH', 95000, 45000),
(2, 'SANDIP', 100000, 50000),
(3, 'UTTAM', 101000, 51000),
(4, 'RUTVIK', 102000, 52000),
(5, 'KULDIP', 95000, 45000),
(6, 'ANSHU', 95000, 45000)

INSERT INTO COURSE VALUES 
(111,'PYTHON', 95000),
(112,'HTML/CSS', 5000),
(113,'SQL', 6000),
(114,'NODE', 7000),
(115,'ANGULAR', 8000),
(116,'REACT', 9000)

INSERT INTO CourseEnrolled VALUES
(1,111),
(2,112),
(3,113),
(4,114),
(5,111),
(6,111)

INSERT INTO FeePayment VALUES 
(1, 50000, '2021-08-05'),
(2, 50000, '2021-06-22'),
(3, 50000, '2021-05-30'),
(4, 50000, '2021-07-07'),
(5, 50000, '2021-06-16'),
(6, 50000, '2021-06-18')