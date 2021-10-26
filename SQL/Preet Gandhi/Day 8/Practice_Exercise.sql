USE AdventureWorks2016


--CREATE TABLE FOR CLUSTERED INDEX--
CREATE TABLE Student
(
	StudentID INT IDENTITY(1,1),
	StudentName VARCHAR(25) NOT NULL,
	TotalFees DECIMAL(6,0) NOT NULL,
	RemainingAmt DECIMAL(6,0) NOT NULL
	CONSTRAINT chk_StudentID UNIQUE(StudentID)
)
INSERT INTO Student VALUES
	('Jai Patel',0,0),('Raj Shah',0,0),('Deep Jadeja',0,0),('Manish Agarwal',0,0),('Jayesh Thakkar',0,0)

SELECT * FROM Student


--CREATE CLUSTERED INDEX--
CREATE CLUSTERED INDEX IX_Student
ON dbo.Student(StudentName)

SELECT * FROM Student



CREATE TABLE Student1
(
	StudentID INT IDENTITY(1,1),
	StudentName VARCHAR(25) NOT NULL,
	TotalFees DECIMAL(6,0) NOT NULL,
	RemainingAmt DECIMAL(6,0) NOT NULL
	CONSTRAINT chk_Student UNIQUE(StudentID)
)

INSERT INTO Student1 VALUES
	('Jai Patel',5,5),('Raj Shah',2,2),('Deep Jadeja',3,3),('Manish Agarwal',1,1),('Jayesh Thakkar',4,4)


SELECT * FROM Student1

CREATE NONCLUSTERED INDEX IX_Student1
ON dbo.Student1 (RemainingAmt)
SELECT * FROM Student1

Truncate table student1





