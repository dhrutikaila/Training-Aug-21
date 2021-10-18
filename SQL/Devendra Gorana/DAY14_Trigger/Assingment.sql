--Assingment
--Create tables
/*
Student->StudentID, StudentName, TotalFees,RemainingAmt

Course->CourseID,CourseName,TotalFees

CourseEnrolled->StudentID,CourseID

FeePayment->StudentID,AmountPaid,DateofPayment
*/

--Assingment 1
--Create an insert trigger on CourseEnrolled Table, record should be updated in TotalFees Field on the Student table for the respective student.


CREATE TABLE Students (StudentID Int PRIMARY KEY NOT NULL, StudentName VARCHAR(50), TotalFees Int, RemainingAmt Int)
CREATE TABLE Course (CourseID Int PRIMARY KEY NOT NULL, CourseName Varchar(30), Fees Int) 
CREATE TABLE CourseEnrolled (StudentID Int FOREIGN KEY REFERENCES Students(StudentID), CourseID Int FOREIGN KEY REFERENCES Course(CourseID)) 
CREATE TABLE FeePayment (StudentID Int FOREIGN KEY REFERENCES Students(StudentID), AmountPaid Int, DateOfPayment DATE) 

INSERT INTO Students VALUES(101, 'Devendra', 0, 0)
INSERT INTO Students VALUES(102, 'Saurav', 0, 0)
INSERT INTO Students VALUES(103, 'Sanjay', 0, 0)
INSERT INTO Students VALUES(104, 'Ravi', 0, 0)
INSERT INTO Students VALUES(105, 'Pankaj', 0, 0)
INSERT INTO Students VALUES(106, 'Devil', 0, 0)
INSERT INTO Students VALUES(107, 'Vishal', 0, 0)
INSERT INTO Students VALUES(108, 'Bhavik', 0, 0)

INSERT INTO Course VALUES(1, 'C++', 7000)
INSERT INTO Course VALUES(2, 'Java', 9000)
INSERT INTO Course VALUES(3, 'Python', 18000)
INSERT INTO Course VALUES(4, 'Php', 15000)
INSERT INTO Course VALUES(5, 'NodeJS', 12000)

ALTER TRIGGER Enrolled_Course ON CourseEnrolled 
FOR INSERT 
AS BEGIN
DECLARE @Fees Int = (SELECT Course.Fees FROM Course 
JOIN CourseEnrolled ON Course.CourseID = CourseEnrolled.CourseID 
WHERE Course.CourseID = CourseEnrolled.CourseID) 

UPDATE Students SET Students.TotalFees = Students.TotalFees + @Fees FROM Students 
JOIN CourseEnrolled ON Students.StudentID = CourseEnrolled.StudentID

UPDATE Students SET Students.RemainingAmt = Students.RemainingAmt + @Fees FROM Students 
JOIN CourseEnrolled ON Students.StudentID = CourseEnrolled.StudentID

END

INSERT INTO CourseEnrolled VALUES (101, 3)
----------------------------------------------------------------------------------------------------

--Assingment 2
--Create an insert trigger on FeePayment, record should be updated in RemainingAmt Field of the Student Table for the respective student.

CREATE TRIGGER Fees_Payment ON FeePayment 
FOR INSERT 
AS BEGIN 
UPDATE Students SET Students.RemainingAmt = Students.RemainingAmt - FeePayment.AmountPaid FROM Students 
JOIN FeePayment ON Students.StudentID = FeePayment.StudentID
END

INSERT INTO FeePayment VALUES (101, 7000, '2021-08-19')

-------------------------------------------------------------------------------------------------------

SELECT * FROM Students
SELECT * FROM Course
SELECT * FROM CourseEnrolled
SELECT * FROM FeePayment

