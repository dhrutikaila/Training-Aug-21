/*Student->StudentID, StudentName, TotalFees,RemainingAmt

Course->CourseID,CourseName,TotalFees

CourseEnrolled->StudentID,CourseID

FeePayment->StudentID,AmountPaid,DATEofPayment
*/
create database triggerExample
use TriggerExample

CREATE TABLE Student(
    StudentID INT primary key,
    StudentName VARCHAR(50),
    TotalFees INT,
    RemainingAmt INT
);
CREATE TABLE Course(
    CourseID INT primary key,
    CourseName VARCHAR(100),
    TotalFees INT
);
CREATE TABLE CourseEnrolled(
    StudentID INT CONSTRAINT fkstudent REFERENCES Student(StudentID),
    CourseID INT CONSTRAINT fkCourse REFERENCES Course(CourseID) 
);
CREATE TABLE FeePayment(
    StudentID INT CONSTRAINT fkstudent1 REFERENCES Student(StudentID),
    AmountPaid INT,
    DATEofPayment DATE
);
INSERT INTO Student 
VALUES 
(1,'Nisarg Adalja',0,0),
(2,'Deep Dave',0,0),
(3,'Raviraj Parmar',0,0),
(4,'Dhruvil Patel',0,0),
(5,'Ridham Gandhi',0,0);


INSERT INTO Course
VALUES
(1,'GIT',2000),
(2,'SQL',3000),
(3,'.Net',5000),
(4,'Angular',3000),
(5,'React',4000);


/* Query 1
Create an insert trigger on CourseEnrolled Table, record should be upDATEd in TotalFees Field on the Student table for the respective student.
*/
CREATE TRIGGER trgcourseEnrolled 
ON dbo.CourseEnrolled
FOR INSERT AS
IF @@ROWCOUNT=1
BEGIN
	UPDATE Student
	set TotalFees=TotalFees+(select TotalFees from Course where Course.CourseID=inserted.CourseId),RemainingAmt=(select TotalFees from Course where Course.CourseID=inserted.CourseId)
	 from inserted where inserted.StudentID=Student.StudentID;
END
ELSE 
BEGIN
	UPDATE Student
	SET TotalFees = TotalFees + (SELECT SUM(c.TotalFees) FROM CourseEnrolled ce JOIN Course c ON c.CourseID = ce.CourseId GROUP BY ce.StudentID HAVING ce.StudentID = Student.StudentID), 
	RemainingAmt = RemainingAmt + (SELECT SUM(c.TotalFees) FROM CourseEnrolled ce JOIN Course c ON c.CourseID = ce.CourseId GROUP BY ce.StudentID HAVING ce.StudentID = Student.StudentID)
	WHERE Student.StudentID IN ( SELECT StudentID FROM CourseEnrolled )
END

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


/* Query 2
Create an insert trigger on FeePayment, record should be upDATEd in RemainingAmt Field of the Student Table for the respective student.
*/

ALTER TRIGGER insert_in_FeePayment
ON dbo.FeePayment
for INSERT
as
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
(2,2000,GETDATE());
INSERT INTO FeePayment
VALUES
(5,6000,GETDATE());

INSERT INTO FeePayment
VALUES
(4,5000,GETDATE());

delete FeePayment

SELECT * FROM FeePayment
SELECT * FROM Student
update Student set RemainingAmt=3000  where StudentID=5
