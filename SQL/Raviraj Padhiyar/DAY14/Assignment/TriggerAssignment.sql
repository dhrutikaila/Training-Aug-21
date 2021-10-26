--Student->StudentID, StudentName, TotalFees,RemainingAmt

--Course->CourseID,CourseName,TotalFees

--CourseEnrolled->StudentID,CourseID

--FeePayment->StudentID,AmountPaid,DateofPayment


CREATE TABLE Student (
	StudentID INT PRIMARY KEY IDENTITY(1,1),
	StudentName VARCHAR(30) NOT NULL,
	TotalFees INT,
	RemainingAmt INT,
)

CREATE TABLE Course
(
CourseID INT PRIMARY KEY IDENTITY(1,1),
CourseName VARCHAR(30) NOT NULL,
CourseFees INT NOT NULL			
)


CREATE TABLE CourseEnrolled
(
	CourseId INT CONSTRAINT fk_Course_id FOREIGN KEY REFERENCES Course(CourseID),
	StudentID INT CONSTRAINT fk_Studnet_id FOREIGN KEY REFERENCES Student(StudentID)
)

CREATE TABLE FeePayment
(
		StudentID INT CONSTRAINT fk_Studnet_id_FeePayment FOREIGN KEY REFERENCES Student(StudentID),
		AmountPaid INT,
		DateOfPayment DATE
)



---------initial data insertion


INSERT INTO Student 
VALUES 
('Rakesh Sharma',0,0),
('Rohan Mishra',0,0),
('Abhi Parmar',0,0),
('Kuldeep Patel',0,0),
('Mish Gupta',0,0)


INSERT INTO Course
VALUES
('GIT',2000),
('SQL',3000),
('.Net',5000),
('Angular',3000),
('React',4000)



--Create an insert trigger on CourseEnrolled Table, record should be updated in TotalFees Field on the Student table for the respective student.

SELECT * FROM Student
SELECT * FROM Course


-----trigger ---------------------------------------

CREATE TRIGGER t_CourseEnrolled
ON dbo.CourseEnrolled
FOR INSERT AS
IF @@ROWCOUNT = 1
BEGIN
	UPDATE Student
	SET TotalFees = TotalFees + (SELECT CourseFees FROM Course
	WHERE Course.CourseID = inserted.CourseId)
	,RemainingAmt = RemainingAmt + (SELECT CourseFees FROM Course
	WHERE Course.CourseID = inserted.CourseId)
	FROM inserted
	WHERE Student.StudentID = inserted.StudentID
END
ELSE 
BEGIN
	UPDATE Student
	SET TotalFees = TotalFees + (
		SELECT SUM(c.CourseFees) FROM CourseEnrolled ce
		JOIN Course c ON c.CourseID = ce.CourseId
		GROUP BY ce.StudentID
		HAVING ce.StudentID = Student.StudentID
	), RemainingAmt = RemainingAmt + (
		SELECT SUM(c.CourseFees) FROM CourseEnrolled ce
		JOIN Course c ON c.CourseID = ce.CourseId
		GROUP BY ce.StudentID
		HAVING ce.StudentID = Student.StudentID)
	WHERE Student.StudentID IN ( SELECT StudentID FROM CourseEnrolled )
END

--------Trigger created---------------------------


-------------inserting data-----------------------

INSERT INTO CourseEnrolled 
VALUES
(1,1),
(2,1),
(2,2),
(5,2),
(3,2),
(2,3),
(3,4),
(4,4),
(1,4),
(2,4),
(1,5),
(5,5)

SELECT * FROM Student
SELECT * FROM CourseEnrolled


--------------------------------------------------------------------------------------------------------



----Create an insert trigger on FeePayment, record should be updated in RemainingAmt Field of the Student Table for the respective student.


CREATE TRIGGER t_insert_FeePayment
ON dbo.FeePayment
AFTER INSERT AS
IF @@ROWCOUNT = 1
BEGIN
	UPDATE Student
	SET RemainingAmt = RemainingAmt - inserted.AmountPaid
	FROM inserted
	WHERE Student.StudentID = inserted.StudentID
END
ELSE
BEGIN
	UPDATE Student
	SET RemainingAmt = RemainingAmt - (SELECT AmountPaid FROM inserted
	WHERE Student.StudentID = inserted.StudentID )
	WHERE Student.StudentID IN (SELECT StudentID FROM inserted)
END


INSERT INTO FeePayment
VALUES
(2,10000,GETDATE()),
(4,5000,GETDATE()),
(5,6000,GETDATE())

SELECT * FROM FeePayment
SELECT * FROM Student
