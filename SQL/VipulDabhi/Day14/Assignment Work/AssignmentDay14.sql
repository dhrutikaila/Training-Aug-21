
CREATE TABLE Student
(
	StudentID INT PRIMARY KEY,
	StudentName VARCHAR(40),
	TotalFees INT,
	RemeiningAmt INT
)
INSERT INTO Student
	VALUES(1,'John',10000,2100),
		  (2,'Methues',20000,5000),
		  (3,'stiven',15000,0)
CREATE TABLE Course
(
	CourseID INT PRIMARY KEY,
	CourseName VARCHAR(40),
	TotalFees INT
)
INSERT INTO Course
	VALUES(101,'C++',10000),
		  (102,'Tally',5000)

CREATE TABLE CourseEnrolled
(
	StudentID INT ,
	CourseID INT,
	FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
	FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
)
INSERT INTO CourseEnrolled
	VALUES(1,101)
		  
CREATE TABLE FeePayment
(
	StudentID INT,
	AmountPaid INT,
	DateOfPayment DATETIME,
	FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
)

---!**!Assignment Queries!**!

--Create an insert trigger on CourseEnrolled Table, record should be updated in TotalFees Field 
--on the Student table for the respective student.

DROP TRIGGER  tr_CourseEnrolled
CREATE TRIGGER tr_AddIntoCourseEnrolled
ON CourseEnrolled
FOR INSERT
AS BEGIN
	
	DECLARE @CourseID INT,@StudentID INT,@Fees INT
	SET @Fees = (SELECT TotalFees FROM Course WHERE CourseID = @CourseID)
	SELECT  @CourseID = CourseID,@StudentID = StudentID FROM inserted
	UPDATE Student SET TotalFees = TotalFees + @Fees , RemeiningAmt =  RemeiningAmt + @Fees
		
END


--Create an insert trigger on FeePayment, record should be updated in RemainingAmt Field of the 
--Student Table for the respective student.


INSERT INTO CourseEnrolled 
	VALUES(1,101)

ALTER TRIGGER tr_FeePayment
ON FeePayment
FOR INSERT
AS BEGIN
	
	DECLARE @StudentID INT,@AmountPaid INT
	SELECT @StudentID = StudentID,@AmountPaid = AmountPaid FROM inserted
	UPDATE Student SET RemeiningAmt = RemeiningAmt - @AmountPaid WHERE StudentID = @StudentID

END

INSERT INTO FeePayment 
	VALUES(2,5000,'09-09-2021')
