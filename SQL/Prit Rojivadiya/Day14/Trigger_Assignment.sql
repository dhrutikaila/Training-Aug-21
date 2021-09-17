USE Demo

CREATE TABLE Student
(
StudentId int PRIMARY KEY IDENTITY(1,1),
StudentName varchar(30) NOT NULL,
TotalFees int DEFAULT 0,
RemainingAmt int DEFAULT 0
)

CREATE TABLE Course
(
CourseId int PRIMARY KEY IDENTITY(1,1),
CourseName varchar(50) NOT NULL,
TotalFees int DEFAULT 0
)

CREATE TABLE CourseEnrolled
(
StudentId int CONSTRAINT FK_Studentid FOREIGN KEY REFERENCES Student(StudentId) NOT NULL,
CourseId int CONSTRAINT FK_Courseid FOREIGN KEY REFERENCES Course(CourseId) NOT NULL
)

CREATE TABLE FeePayment
(
StudentId int CONSTRAINT FK_Studentsid FOREIGN KEY REFERENCES Student(StudentId) NOT NULL,
AmountPaid int NOT NULL,
DateOfPayment date not null
)


INSERT INTO Student VALUES ('Prit',0,0), ('Man',0,0), ('Tirth',0,0), ('Krusha',0,0)

INSERT INTO Course VALUES ('Nodejs',10000), ('ReactJS',8000), ('.net',9000), ('PHP',7000)


-- Q1 Create an insert trigger on CourseEnrolled Table, record should be updated in TotalFees Field on the Student table for the respective student.

CREATE TRIGGER tgr_courseEnrolled
ON CourseEnrolled
AFTER INSERT
AS
BEGIN
	DECLARE @fee int
	SELECT @fee = c.TotalFees FROM inserted i
		JOIN Course c ON c.CourseId = i.CourseId

	UPDATE Student
	SET TotalFees = TotalFees + @fee, RemainingAmt = RemainingAmt + @fee
	FROM inserted JOIN Student ON Student.StudentId = inserted.StudentId
END

INSERT INTO CourseEnrolled VALUES (1,1)

SELECT * FROM CourseEnrolled
SELECT * FROM Student



-- Q2 Create an insert trigger on FeePayment, record should be updated in RemainingAmt Field of the Student Table for the respective student.

CREATE TRIGGER tgr_remainingAmt
ON FeePayment
AFTER INSERT
AS
DECLARE @paidfee int
SELECT @paidfee = AmountPaid FROM FeePayment

UPDATE Student
SET RemainingAmt = RemainingAmt - @paidfee
FROM inserted JOIN Student ON Student.StudentId = inserted.StudentId

INSERT INTO FeePayment VALUES(1,5000,'2021-09-09')

SELECT * FROM FeePayment
SELECT * FROM Student