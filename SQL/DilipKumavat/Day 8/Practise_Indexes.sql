USE AdventureWorks2016

CREATE TABLE Student
(
    StudentId INT IDENTITY,
    StudentName NVARCHAR(25) NOT NULL,
    TotalFees INT NOT NULL,
    RemainingAmt INT DEFAULT 0
)

 INSERT INTO Student VALUES ('Raj Thakkar',0,NULL),
							('Preet Gandhi',0,0),
							('Deep Parmar',0,0),
							('Hardik Niranjani',0,0),
							('Dilip Kumavat',0,0),
							('Manish Zala',0,0),
							('Viraj Marvania',0,0)

SELECT * FROM Student



CREATE CLUSTERED INDEX clr_Index
ON Student(StudentName)

CREATE NONCLUSTERED INDEX nclr_Index
ON Student(StudentId)
