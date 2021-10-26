CREATE TABLE Student
(
StudentId INT IDENTITY(1,1) PRIMARY KEY,
StudentName VARCHAR(30),
TotalFees INT ,
RemainingAmt INT 
)

CREATE TABLE Course
(
CourseId INT IDENTITY(1,1) PRIMARY KEY,
CourseName VARCHAR(20),
TotalFees INT
)
CREATE TABLE CourseEnrolled
(
CourseId INT, 
StudentId INT FOREIGN KEY REFERENCES Student(StudentID)
)
CREATE TABLE FeePayment
(
StudentId INT,
AmountPaid INT,
DateofPayment DATE
)


-----------------------------------------
--1)Create an insert trigger on CourseEnrolled Table, record should be updated in TotalFees Field on 
--  the Student table for the respective student.
CREATE TRIGGER FEESUPDATE
ON CourseEnrolled
AFTER INSERT
AS
BEGIN
	DECLARE @Sid INT,
	@Cid INT,
	@Fee INT
	SELECT @Sid= StudentId FROM inserted
	SELECT @Cid= CourseId FROM inserted
	SELECT @Fee=TotalFees FROM Course WHERE CourseId=@Cid
	UPDATE Student
	SET TotalFees=TotalFees+@Fee,RemainingAmt=RemainingAmt+@Fee WHERE StudentId=@Sid
END

INSERT INTO CourseEnrolled VALUES (1,2)
INSERT INTO CourseEnrolled VALUES (2,3)

------------------------------
ALTER TABLE FeePayment ADD CONSTRAINT FkONFeePayment FOREIGN KEY(StudentId) REFERENCES  Student(StudentId)
--2)Create an insert trigger on FeePayment, record should be updated in RemainingAmt Field of the Student Table for 
--  the respective student.
CREATE TRIGGER FEESINSERT
ON FeePayment 
AFTER INSERT
AS
BEGIN
	
	DECLARE @Sid INT,
	@Fee INT
	SELECT @Sid=StudentId FROM INSERTED
	SELECT @Fee=AmountPaid FROM INSERTED
	UPDATE Student
	SET RemainingAmt=RemainingAmt-@Fee WHERE StudentId=@Sid
END
INSERT INTO FeePayment VALUES(20000,GETDATE())