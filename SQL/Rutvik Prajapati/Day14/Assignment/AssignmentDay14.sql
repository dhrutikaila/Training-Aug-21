CREATE DATABASE StudentDB
				---ASSIGNMENT---
--Student->StudentID, StudentName, TotalFees,RemainingAmt

--Course->CourseID,CourseName,TotalFees

--CourseEnrolled->StudentID,CourseID

--FeePayment->StudentID,AmountPaid,DateofPayment

CREATE TABLE Student(
StudentID INT PRIMARY KEY NOT NULL, 
StudentName VARCHAR(20), 
TotalFees MONEY,
RemainingAmt MONEY
);
							--(1,'Parth',25000,5000),
							--(2,'Pranay',30000,7000)
INSERT INTO Student (StudentID,StudentName)VALUES(5,'Neel')

CREATE TABLE Course(
CourseID INT PRIMARY KEY NOT NULL,
CourseName VARCHAR(50),
TotalFees MONEY
);

INSERT INTO Course VALUES(1,'Web Development',25000),
						(2,'Mobile development',30000)

CREATE TABLE CourseEnrolled(
CourseEnrolledId INT PRIMARY KEY
StudentID INT CONSTRAINT FK_STU_ID FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
CourseID INT CONSTRAINT FK_Course_ID FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

INSERT INTO CourseEnrolled VALUES(1,1,1),
								(2,2,2)

CREATE TABLE FeePayment(
FeePaymentId INT PRIMARY KEY,
StudentID INT CONSTRAINT FK_Student_Id FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
AmountPaid MONEY,
DateofPayment DATE
);

INSERT INTO FeePayment VALUES (1,1,20000,'2021-09-09'),
								(2,2,23000,'2021-08-11')

--Create an insert trigger on CourseEnrolled Table, record should be updated in 
	--TotalFees Field on the Student table for the respective student.
	ALTER TRIGGER tr_SutdentWithCourse_Insert
	ON CourseEnrolled
	AFTER INSERT
	AS 
	BEGIN 
	IF @@ROWCOUNT = 1
		BEGIN 
			DECLARE @TempCourseId INT ,@TempStudentId INT
			SELECT @TempCourseId = CourseID,@TempStudentId = StudentID FROM inserted

			UPDATE Student 
			SET TotalFees = ISNULL(TotalFees,0) + (SELECT TotalFees FROM Course WHERE CourseID = @TempCourseId),
				RemainingAmt = ISNULL(RemainingAmt,0) + (SELECT TotalFees FROM Course WHERE CourseID = @TempCourseId)
			WHERE StudentID = @TempStudentId		
		END
	ELSE 
		BEGIN 
			UPDATE Student 
			SET TotalFees = ISNULL(TotalFees,0)+(SELECT SUM(TotalFees) FROM Course C 
				INNER JOIN inserted I ON C.CourseID=I.CourseID 
				GROUP BY I.StudentID
				HAVING Student.StudentID = I.StudentID),
				RemainingAmt = ISNULL(RemainingAmt,0) + (SELECT SUM(TotalFees) FROM Course C 
				INNER JOIN inserted I ON C.CourseID=I.CourseID 
				GROUP BY I.StudentID
				HAVING Student.StudentID = I.StudentID)
			WHERE StudentID IN (SELECT StudentID FROM inserted)
		END 
	END

	---insert value in courseEnrolled table 
	INSERT INTO CourseEnrolled VALUES(10,4,1),
										(11,4,1),
										(12,5,2),
										(13,5,2)
	

	select * from CourseEnrolled
	select * from Student
--Create an insert trigger on FeePayment, record should be updated in RemainingAmt 
	--Field of the Student Table for the respective student.
	alter TRIGGER tr_UpdateInRemainingAmt
	ON FeePayment
	AFTER INSERT
	AS 
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
				WHERE Student.StudentID = inserted.StudentID)
			WHERE StudentID IN (SELECT StudentID FROM inserted)
		END
	----INSERT VALUE IN FEEPAYMENT TABLE 
	INSERT INTO FeePayment VALUES (3,1,20000,GETDATE())

	select * from Student
	SELECT * FROM FeePayment