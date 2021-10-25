--Assignment:
CREATE DATABASE Student_INFO

USE Student_INFO
--Student->StudentID, StudentName, TotalFees,RemainingAmt


CREATE TABLE Student
(
StudentID INT PRIMARY KEY,
StudentName VARCHAR(20) NOT NULL,
TotalFees DECIMAL(7,2) NOT NULL,
RemainingAmt DECIMAL(7,2) NOT NULL
)
INSERT INTO Student VALUES (1,'Deep',35000,5000),
						   (2,'Kamlesh',15000,0),
						   (3,'Mahesh',0,15000),
						   (4,'Ramesh',5000,5000),
						   (5,'Dhruvesh',10000,5000)



--Course->CourseID,CourseName,TotalFees
CREATE TABLE Course
(
CourseID INT PRIMARY KEY,
CourseName VARCHAR(20) NOT NULL,
TotalFees DECIMAL(7,2) NOT NULL
)
INSERT INTO Course VALUES (101,'.NET',15000),
						  (102,'Node',15000),
						  (103,'PHP',10000),
						  (104,'Java',15000),
						  (105,'SSMS',20000)



--CourseEnrolled->StudentID,CourseID
--Here,I Make Many_To_Many Relationship

CREATE TABLE CourseEnrolled
(
StudentID INT NOT NULL,
CourseID INT NOT NULL,
CONSTRAINT FK_StudentID FOREIGN KEY (StudentID) REFERENCES Student(StudentID), 
CONSTRAINT FK_CourseID FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
)

INSERT INTO CourseEnrolled VALUES (1,101),
								  (2,104),
								  (1,105),
								  (3,102)


--FeePayment->StudentID,AmountPaid,DateofPayment

CREATE TABLE FeePayment
(
StudentID INT NOT NULL,
AmountPaid DECIMAL(7,2) NOT NULL,
DateofPayment DATE,
CONSTRAINT FK_Student_ID FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
)

INSERT INTO FeePayment VALUES (1,10000,'2021-08-02'),
							  (2,15000,'2021-08-15'),
							  (1,20000,'2021-08-20')




--Create an insert trigger on CourseEnrolled Table, record should be updated in TotalFees Field on the Student table for the respective student.

CREATE TRIGGER TR_Student_TotalFees
ON CourseEnrolled
AFTER INSERT
AS
BEGIN
DECLARE @StudentID INT
DECLARE @CourseID INT
DECLARE @Total_Fees DECIMAL(7,2)

SELECT @StudentID=StudentID,@CourseID=CourseID FROM inserted
SELECT @Total_Fees=TotalFees FROM Course WHERE CourseID=@CourseID
UPDATE Student SET TotalFees=TotalFees+@Total_Fees,RemainingAmt+=@Total_Fees  WHERE StudentID=@StudentID

END

INSERT INTO CourseEnrolled VALUES (5,105)


SELECT * FROM CourseEnrolled
SELECT * FROM Student

--Create an insert trigger on FeePayment, record should be updated in RemainingAmt Field of the Student Table for the respective student.

CREATE TRIGGER TR_Student_RemainingAmt
ON FeePayment
AFTER INSERT
AS
BEGIN
DECLARE @StudentID INT
DECLARE @AmountPaid DECIMAL(7,2)

SELECT @AmountPaid=AmountPaid,@StudentID=StudentID FROM inserted
UPDATE Student SET RemainingAmt=RemainingAmt-@AmountPaid WHERE StudentID=@StudentID

END

INSERT INTO FeePayment VALUES (5,5000,'2021-07-09')

SELECT * FROM FeePayment
SELECT * FROM Student
