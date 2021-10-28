USE TRIGGE
CREATE TABLE Student
(
	StudentID INT CONSTRAINT StudentID_PK PRIMARY KEY,
	StudentName VARCHAR(40),
	TotalFees MONEY,
	RemainingAmt MONEY
)

CREATE TABLE Course
(
	CourseID  INT CONSTRAINT CourseID_PK PRIMARY KEY,
	CourseName VARCHAR(40),
	TotalFees MONEY,
)

CREATE TABLE CourseEnrolled
(
	StudentID INT CONSTRAINT StudentID_FK FOREIGN KEY REFERENCES  Student(StudentID),
	CourseID INT CONSTRAINT CourseID_FK FOREIGN KEY  REFERENCES   Course(CourseID)
	CONSTRAINT CourseID_StudentID_PK PRIMARY KEY (StudentID,CourseID)
)
 

CREATE TABLE FeePayment
(
	StudentID INT CONSTRAINT StudentID_FFK FOREIGN KEY REFERENCES  Student(StudentID),
	AmountPaid MONEY,
	DateofPayment DATETIME
)


INSERT INTO Course 
VALUES(1,'CSS',2500),(2,'HTML',2500),(3,'SQL',4000)

INSERT INTO Student 
VALUES(1,'KARAN',0.00,0.00),(2,'VIVEK',0.00,0.00),(3,'VIVEK',0.00,0.00)

INSERT INTO FeePayment 
VALUES(1,20000,'10-04-2020'),(2,20000,'12-04-2020')

INSERT INTO Student 
VALUES(1,'rjk',0.00,0.00),(2,'VIVEK',0.00,0.00),(3,'Vishal',0.00,0.00)


--Create an insert trigger on CourseEnrolled Table, record should be updated in TotalFees Field on the Student table for the respective student.

		CREATE TRIGGER CourseEnrol_Trigger
		ON CourseEnrolled
		AFTER INSERT   
		AS
		BEGIN
			UPDATE Student
			SET TotalFees=TotalFees + (SELECT TotalFees FROM Course WHERE CourseID=I.CourseID),
			RemainingAmt=RemainingAmt + (SELECT TotalFees FROM Course WHERE CourseID=I.CourseID)
			FROM Inserted AS [I] 
			WHERE Student.StudentID=I.StudentID
		END


		INSERT INTO CourseEnrolled 
		       VALUES(1,1),(2,1),(3,1)

		SELECT * FROM Student
		
		
---Create an insert trigger on FeePaymnt, record should be updated in RemainingAmt Field of the              Student Table for the respective student.

		CREATE TRIGGER FeePaymnt_Trigger
		ON FeePayment
		FOR INSERT
		AS
		BEGIN
			UPDATE Student
			SET RemainingAmt = RemainingAmt-I.AmountPaid
			FROM INSERTED  AS [I]
			WHERE Student.StudentID=I.StudentID
		END



       INSERT INTO FeePayment 
	          VALUES(3,2500,'10-04-2020'),(1,2500,'10-04-2020')

	   SELECT * FROM Student




