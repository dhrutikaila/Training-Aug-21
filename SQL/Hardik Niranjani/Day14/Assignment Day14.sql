/*
Student->StudentID, StudentName, TotalFees,RemainingAmt

Course->CourseID,CourseName,TotalFees

CourseEnrolled->StudentID,CourseID

FeePayment->StudentID,AmountPaid,DateofPayment
*/


CREATE TABLE Student
(
	StudentId INT PRIMARY KEY IDENTITY,
	StudentName NVARCHAR(25) NOT NULL,
	TotalFees INT NOT NULL,
	RemainingAmt INT DEFAULT 0
)


 INSERT INTO Student VALUES ('Dilip Kumavat',0,0),
							('Raj Thakkar',0,0), 
							('Hardik Niranjani',0,0),
							('Preet Gandhi',0,0),
							('Deep Parmar',0,0)
							
							

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

CREATE TABLE CourseEnrolled
(
	StudentID INT FOREIGN KEY REFERENCES Student(StudentId) NOT NULL,
	CourseID INT FOREIGN KEY REFERENCES Course(CourseId) NOT NULL
)

CREATE TABLE FeePayment
(
	StudentID INT FOREIGN KEY REFERENCES Student(StudentId) NOT NULL,
	AmountPaid INT NOT NULL,
	DateofPayment DATE NOT NULL
)



-- ================================================================================

--(1)
--Create an insert trigger on CourseEnrolled Table, record should be updated in TotalFees Field on 
--the Student table for the respective student.

CREATE TRIGGER tr_StudentUpdate_Insert
ON CourseEnrolled
FOR INSERT
AS
BEGIN

	DECLARE @CourseId INT,
			@StudentId INT,
			@Fees INT

	SELECT @CourseId = CourseID, @StudentId = StudentID FROM inserted
	SET @Fees = (SELECT TotalFees FROM Course WHERE CourseId = @CourseId)
	
	UPDATE Student 
		   SET TotalFees += @Fees, 
		       RemainingAmt += @Fees 
		       WHERE StudentId = @StudentId
END

SELECT * FROM Student
INSERT INTO CourseEnrolled VALUES (3,5)
INSERT INTO CourseEnrolled VALUES (4,5)
INSERT INTO CourseEnrolled VALUES (5,4)
INSERT INTO CourseEnrolled VALUES (5,5)


-- ================================================================================

--(2)
--Create an insert trigger on FeePayment, record should be updated in RemainingAmt 
--Field of the Student Table for the respective student.

CREATE TRIGGER tr_Student_FeePayment_Update_RemainingAmt
ON FeePayment
FOR INSERT
AS
BEGIN
	DECLARE @Id INT,
			@AmountPid INT,
			@DateOfPayment DATE
	
	SELECT @Id = StudentID, @AmountPid = AmountPaid, @DateOfPayment = DateofPayment FROM inserted
	UPDATE Student SET RemainingAmt -= @AmountPid WHERE StudentID = @Id
END

SELECT * FROM Student
INSERT INTO FeePayment VALUES (1, 500, GETDATE())
INSERT INTO FeePayment VALUES (3, 3200, GETDATE())
INSERT INTO FeePayment VALUES (3, 2200, GETDATE())
INSERT INTO FeePayment VALUES (4, 8200, GETDATE())
INSERT INTO FeePayment VALUES (5, 1200, GETDATE())