CREATE TABLE Student
(
 StudentID INT  NOT NULL,
 StudentName VARCHAR(10) NOT NULL,
 TotalFees MONEY   NOT NULL,
 RemainingAmt MONEY NULL
 CONSTRAINT PKSTDID PRIMARY KEY(StudentID)
);
INSERT INTO Student VALUES (1,'DHRUTI','5000','100');

CREATE TABLE Course
(
CourseID INT  NOT NULL,
CourseName VARCHAR(10),
TotalFees MONEY NOT NULL
CONSTRAINT PKCOUID PRIMARY KEY(CourseID)
);
INSERT INTO Course VALUES (1,'C#','200');

CREATE TABLE CourseEnrolled
(
StudentID INT NOT NULL,
CourseID INT NOT NULL
CONSTRAINT PKCOU_STDID PRIMARY KEY(CourseID,StudentID),
CONSTRAINT FKCource_enrolledstd FOREIGN KEY(StudentID) REFERENCES Student(StudentID),
CONSTRAINT FKCource_enrolledcource FOREIGN KEY(CourseID) REFERENCES Course(CourseID)

);

CREATE TABLE FeePayment
(
StudentID INT NOT NULL,
AmountPaid MONEY NOT NULL,
DateofPayment DATE DEFAULT GETDATE()
);



--Create an insert trigger on CourseEnrolled Table, record should be updated in TotalFees Field on the Student table for the respective student.
CREATE TRIGGER  updatedStudenttable
ON CourseEnrolled
AFTER INSERT  
AS BEGIN
DECLARE @FEES MONEY
SELECT @FEES= C.TotalFees FROM inserted I
JOIN Course C ON C.CourseID =I.CourseID
UPDATE Student
SET TotalFees= TotalFees +@FEES,RemainingAmt=RemainingAmt +@FEES 
FROM inserted  JOIN Student ON Student.StudentID=inserted.StudentID      
 END
 INSERT INTO  CourseEnrolled
VALUES (1,1); 
SELECT * FROM CourseEnrolled
SELECT * FROM Student


--Create an insert trigger on FeePayment, record should be updated in RemainingAmt Field of the Student Table for the respective student.
CREATE TRIGGER  updatedRemainingAmt
ON FeePayment
AFTER INSERT
AS 
DECLARE @AmountPaid MONEY
SELECT @AmountPaid =AmountPaid FROM FeePayment

UPDATE Student 
SET RemainingAmt= RemainingAmt + @AmountPaid
FROM inserted JOIN Student ON Student.StudentID = inserted.StudentID

INSERT INTO FeePayment VALUES(1,3000,'2-11-2000');
SELECT *FROM FeePayment
SELECT * FROM Student
