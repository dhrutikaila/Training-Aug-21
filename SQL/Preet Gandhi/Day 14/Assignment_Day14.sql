CREATE DATABASE Day14_SQL

CREATE TABLE Student
(
	StudentID INT PRIMARY KEY IDENTITY(1,1),
	StudentName VARCHAR(25) NOT NULL,
	TotalFees DECIMAL(6,0) NOT NULL,
	RemainingAmt DECIMAL(6,0) NOT NULL
)

INSERT INTO Student VALUES
	('Jai Patel',0,0),('Raj Shah',0,0),('Deep Jadeja',0,0),('Manish Agarwal',0,0),('Jayesh Thakkar',0,0)

CREATE TABLE Course
(
	CourseID INT PRIMARY KEY IDENTITY(1,1),
	CourseName VARCHAR(20) NOT NULL,
	TotalFees DECIMAL(6,0) NOT NULL,
	CONSTRAINT chk_Coursename UNIQUE(CourseName)
)

INSERT INTO Course VALUES
	('C++',2500),('Java',5000),('DotNet',10000)


CREATE TABLE CourseEnrolled
(
	StudentID INT NOT NULL,
	CourseID INT NOT NULL,
	CONSTRAINT chk_Student_enroll FOREIGN KEY(StudentID) REFERENCES Student(StudentID),
	CONSTRAINT chk_Course_enroll FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
)

CREATE TABLE FeePayment
(
	StudentID INT NOT NULL,
	AmountPaid DECIMAL(6,0),
	DateOfPayment DATE,
	CONSTRAINT chk_Student_payment FOREIGN KEY(StudentID) REFERENCES Student(StudentID)
)


--1)Create an insert trigger on CourseEnrolled Table, record should be updated in TotalFees Field on the Student table for the respective student.
CREATE TRIGGER trgUpdateTotalFees
ON dbo.CourseEnrolled
FOR INSERT 
AS
BEGIN
	DECLARE @StudentId INT,@CourseId INT,@CourseAmount INT
	SELECT @StudentId = StudentID,@CourseId = CourseID FROM inserted
	SET @CourseAmount = (SELECT TotalFees FROM Course WHERE CourseId = @CourseId)
	UPDATE Student SET TotalFees += @CourseAmount,RemainingAmt += @CourseAmount WHERE StudentId = @StudentId
END

INSERT INTO CourseEnrolled VALUES (3,2)
SELECT * FROM Student
SELECT * FROM CourseEnrolled



--2)Create an insert trigger on FeePayment, record should be updated in RemainingAmt Field of the Student Table for the respective student.
CREATE TRIGGER trgUpdateRemainingAmt
ON dbo.FeePayment
FOR INSERT
AS
BEGIN
	DECLARE @studentId INT,@FeesPaid INT
	SELECT @studentId = StudentID,@FeesPaid = AmountPaid FROM inserted
	UPDATE Student SET RemainingAmt -= @FeesPaid WHERE StudentId = @studentId	
END

INSERT INTO FeePayment VALUES (2,2000,GETDATE())
SELECT * FROM Student
SELECT * FROM FeePayment