
CREATE DATABASE TriggerDb
USE TriggerDb

--Student->StudentID, StudentName, TotalFees,RemainingAmt
--Course->CourseID,CourseName,TotalFees
--CourseEnrolled->StudentID,CourseID
--FeePayment->StudentID,AmountPaid,DateofPayment


 CREATE TABLE Student
 (
	StudentID INT CONSTRAINT Student_StudentID_Pk PRIMARY KEY IDENTITY(1,1),
	StudentName VARCHAR(50) CONSTRAINT Student_StudentName_NotNull NOT NULL,
	TotalFees MONEY CONSTRAINT Student_TotalFees_Def DEFAULT 0,
	RemainingAmount MONEY CONSTRAINT Student_RemainingAmount_Def DEFAULT 0
 )

 CREATE TABLE Course
 (
	CourseID INT CONSTRAINT Course_CourseID_Pk PRIMARY KEY IDENTITY(1,1),
	CourseName VARCHAR(50) CONSTRAINT Course_CourseName_NotNull NOT NULL,
	TotalFees MONEY CONSTRAINT Course_TotalFees_NotNull NOT NULL,
 )

 CREATE TABLE CourseEnrolled
 (
	StudentID INT CONSTRAINT CourseEnrolled_StudentID_Fk NOT NULL FOREIGN KEY REFERENCES Student(StudentID) ON DELETE NO ACTION ON UPDATE CASCADE,
	CourseID INT CONSTRAINT CourseEnrolled_CourseID_Fk NOT NULL FOREIGN KEY REFERENCES Course(CourseID) ON DELETE NO ACTION ON UPDATE CASCADE
 )

 CREATE TABLE FeePayment
 (
	StudentID INT CONSTRAINT FeePayment_StudentID_Fk FOREIGN KEY REFERENCES Student(StudentID) ON DELETE NO ACTION ON UPDATE CASCADE,
	AmountPaid MONEY CONSTRAINT FeePayment_AmountPaid_NotNull NOT NULL,
	DateofPayment DATETIME CONSTRAINT FeePayment_DateOfPayment DEFAULT GETDATE()
 )

/*1.Create an insert trigger on CourseEnrolled Table, record should be updated in 
TotalFees Field on the Student table for the respective student.*/

CREATE TRIGGER UpdateTotalFees
	ON CourseEnrolled
		FOR INSERT
			AS
				DECLARE @Fees MONEY,@CourseId INT,@StudentId INT
				SET @CourseId = (SELECT CourseID FROM inserted)
				SET @StudentId = (SELECT StudentID FROM inserted)
				SET @Fees = (SELECT TotalFees FROM Course WHERE CourseID=@CourseId)
				UPDATE Student 
					SET 
						TotalFees = TotalFees + @Fees,
						RemainingAmount = RemainingAmount + @Fees 
							WHERE StudentID=@StudentId


/*2.Create an insert trigger on FeePayment, record should be updated in RemainingAmt
Field of the Student Table for the respective student.*/

CREATE TRIGGER UpdateRemainingFees
	ON FeePayment
		FOR INSERT 
			AS
				DECLARE @StudentId INT,@FeesPaid MONEY
				SET @StudentId = (SELECT StudentID FROM inserted)
				SET @FeesPaid = (SELECT AmountPaid FROM inserted)
				UPDATE Student 
					SET 
						RemainingAmount = RemainingAmount - @FeesPaid 
							WHERE StudentID=@StudentId


DROP TRIGGER UpdateRemainingFees,UpdateTotalFees
DROP TABLE FeePayment,CourseEnrolled,Course,Student

SELECT * FROM Student
INSERT INTO Student (StudentName) VALUES ('John'),('Roy'),('Steven')

SELECT * FROM Course
INSERT INTO Course VALUES ('SQL',3500),('BootStrap',3000)

SELECT * FROM CourseEnrolled
INSERT INTO CourseEnrolled VALUES (1,1)
INSERT INTO CourseEnrolled VALUES (1,2)
INSERT INTO CourseEnrolled VALUES (2,2)

SELECT * FROM FeePayment

INSERT INTO FeePayment (StudentID,AmountPaid) VALUES (1,2500)
INSERT INTO FeePayment (StudentID,AmountPaid) VALUES (2,1500)