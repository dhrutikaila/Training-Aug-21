CREATE TABLE Student(
	StudentId INT IDENTITY(1,1) PRIMARY KEY,
	StudentName VARCHAR(100),
	TotalFees INT NULL,
	RemainingAmt INT NULL
)
CREATE TABLE Course(
	CourseId INT IDENTITY(1,1) PRIMARY KEY,
	CourseName VARCHAR(100),
	TotalFees INT
)
CREATE TABLE CourseEnrolled(
	StudentId INT,
	CourseId INT,
	UNIQUE(StudentId,CourseId)

)
ALTER TABLE CourseEnrolled ADD CONSTRAINT CK_StudentId_CourseEnrolled FOREIGN KEY(StudentID) REFERENCES  Student(StudentId)
ALTER TABLE CourseEnrolled ADD CONSTRAINT CK_CourseId_CourseEnrolled FOREIGN KEY(CourseId) REFERENCES  Course(CourseId)
CREATE TABLE FeePayment(
	StudentId INT,
	AmountPaid INT,
	DateofPayment DATE
)
ALTER TABLE FeePayment ADD CONSTRAINT CK_StudentId_FeePayment FOREIGN KEY(StudentId) REFERENCES  Student(StudentId)

INSERT INTO Student VALUES('Dhruvit',0,0)
INSERT INTO Course VALUES ('IT',50000)


--task-1-Create an insert trigger on CourseEnrolled Table, record should be updated in TotalFees Field on the Student table for the respective student.

CREATE TRIGGER CourseEnrolled_Insert ON CourseEnrolled 
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @StudentId INT, @Fee INT,@CourseId INT
	SELECT @StudentId=INSERTED.StudentId,@CourseId=inserted.CourseId FROM INSERTED
	SELECT @Fee=TotalFees FROM Course WHERE CourseId=@CourseId
	UPDATE Student
	SET TotalFees=TotalFees+@Fee,RemainingAmt=RemainingAmt+@Fee WHERE StudentId=@StudentId
END

INSERT INTO CourseEnrolled VALUES (1,1)
SELECT * FROM Student




--task-2-Create an insert trigger on FeePayment, record should be updated in RemainingAmt Field of the Student Table for the respective student.
CREATE TRIGGER FeePayment_Insert ON FeePayment 
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @StudentId INT, @Fee INT
	SELECT @StudentId=INSERTED.StudentId,@Fee=INSERTED.AmountPaid FROM INSERTED
	UPDATE Student
	SET RemainingAmt=RemainingAmt-@Fee WHERE StudentId=@StudentId
END
INSERT INTO FeePayment VALUES(1,20000,GETDATE())