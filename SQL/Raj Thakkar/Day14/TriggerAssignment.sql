--Create tables to perform trigger operations
CREATE TABLE Student
(
    StudentId INT PRIMARY KEY IDENTITY,
    StudentName NVARCHAR(30) NOT NULL,
    TotalFees INT NOT NULL,
    RemainingAmt INT
)

 INSERT INTO Student VALUES ('Jerry',0,0),
							('Anna',0,0),
							('Hrufna',0,0),
							('Juan',0,0),
							('Alice',0,0)

CREATE TABLE Course
(
    CourseId INT PRIMARY KEY IDENTITY,
    CourseName NVARCHAR(30) NOT NULL,
    TotalFees INT NOT NULL
)

 INSERT INTO Course VALUES('C',1000),
						 ('C++',2000),
						 ('C#',3000),
						 ('SQL',5000),
						 ('Python',4000)

			

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


--Create an insert trigger on CourseEnrolled Table, record should be updated in TotalFees Field on the Student table for the respective student.
CREATE TRIGGER TRGCourseEnrolled
ON CourseEnrolled
FOR INSERT 
AS
BEGIN
	DECLARE @CourseId INT,@StudentId INT,@Fees INT
	SELECT @CourseId = CourseID,@StudentId = StudentID FROM inserted
	SET @Fees = (SELECT TotalFees FROM Course WHERE CourseId = @CourseId)
	UPDATE Student 
	SET TotalFees += @Fees,RemainingAmt += @Fees 
	WHERE StudentId = @StudentId
END

INSERT INTO CourseEnrolled VALUES (1,5)

SELECT * FROM Student

 



--Create an insert trigger on FeePayment, record should be updated in RemainingAmt Field of the Student Table for the respective student.
CREATE TRIGGER TRGFeesPayment
ON FeePayment
FOR INSERT
AS
BEGIN
	DECLARE @studentId INT,@PaidFees INT,@CurrentDate DATE
	SELECT @studentId = StudentID,@PaidFees = AmountPaid,@CurrentDate = DateofPayment  FROM inserted
	UPDATE Student 
	SET RemainingAmt -= @PaidFees 
	WHERE StudentId = @studentId
END

INSERT INTO FeePayment VALUES (1,4000,GETDATE())
SELECT * FROM Student


