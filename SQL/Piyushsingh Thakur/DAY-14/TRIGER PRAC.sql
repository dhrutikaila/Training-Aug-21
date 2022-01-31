--USE CARS

CREATE TRIGGER trig 
ON Student
AFTER INSERT
AS
DECLARE @Age INT,
@City VARCHAR(50)

SELECT @Age= age from inserted 
SELECT @City=city  FROM inserted 

BEGIN
	IF @Age >18
		BEGIN
		PRINT'YOU ARE NOT ELIGIBLE '
		ROLLBACK
		END
	ELSE IF @City='SURAT'
		BEGIN
		PRINT'CITY IS NOT ALLOWED'
		ROLLBACK
		END
	ELSE
		BEGIN
		PRINT'STUDENT DTAILES INSERTED SUCCESSFULLY'
		END
END

INSERT INTO Student VALUES (1234,'SHUBH','PATEL',22,'AHMEDABAD')
INSERT INTO Student VALUES (1234,'SHUBH','PATEL',12,'SURAT')
INSERT INTO Student VALUES (1234,'SHUBH','PATEL',12,'AHMEDABAD')
SELECT * FROM Student

-------------------------------------------


CREATE TABLE Studhistory
(Id INT PRIMARY KEY IDENTITY(1,1),
  ColoumName varchar(45) NOT NULL,  
  OldValue varchar(45) NOT NULL,      
  NewValue varchar(45) NOT NULL,  
  TimeOfUpdate DATETIME NOT NULL
 
)
SELECT * FROM Studhistory
---------------------------------------------
CREATE TRIGGER afterupdate 
ON Student
AFTER UPDATE
AS
DECLARE @Id INT,
@AdmissionNo VARCHAR(50),
@OldAdmissionNo VARCHAR(50),
@FirstName VARCHAR(50),
@OldFirstName VARCHAR(50),
@LastName VARCHAR(50),
@OldLastName VARCHAR(50),
@City VARCHAR(50),
@OldCity VARCHAR(50)

SELECT @Id = id FROM inserted 
SELECT @AdmissionNo = admission_no FROM inserted
SELECT @OldAdmissionNo = admission_no FROM deleted 
SELECT @FirstName = first_name FROM inserted 
SELECT @OldFirstName = first_name FROM deleted 
SELECT @LastName = last_name FROM inserted 
SELECT @OldLastName = last_name FROM deleted 
SELECT @City = city FROM inserted 
SELECT @OldCity = city FROM deleted 

BEGIN
	IF UPDATE(admission_no)
		BEGIN
		INSERT INTO Studhistory
		VALUES ('admission_no',@AdmissionNo,@OldAdmissionNo,GETDATE())
		END
	ELSE IF UPDATE(first_name)
		BEGIN
		INSERT INTO Studhistory
		VALUES ('first_name',@FirstName,@OldFirstName,GETDATE())
		END
	ELSE IF UPDATE(last_name)
		BEGIN
		INSERT INTO Studhistory
		VALUES ('last_name',@LastName,@OldLastName,GETDATE())
		END
	ELSE IF UPDATE(city)
		BEGIN
		INSERT INTO Studhistory
		VALUES ('city',@City,@OldCity,GETDATE())
		END
	
END
SELECT * FROM Student


UPDATE Student SET admission_no=2345,city='nikol' WHERE first_name='SHUBH'
UPDATE Student SET first_name='MODI' WHERE admission_no='4213'
UPDATE Student SET last_name='VASANI' WHERE first_name='SHUBH'
UPDATE Student SET city='SURAT' WHERE first_name='SHUBH'

---------------------------------------------------
SELECT * INTO StudBackup FROM Student WHERE 1=0
SELECT * FROM StudBackup
--DROP TABLE StudBackup


alter TRIGGER afterdelete
ON Student
AFTER DELETE
AS
DECLARE @Id INT,
@AdmissionNo VARCHAR(50),
@FirstName VARCHAR(50),
@LastName VARCHAR(50),
@Age int,
@City VARCHAR(50)

SELECT @Id = id FROM deleted I
SELECT @AdmissionNo = admission_no FROM deleted 
SELECT @FirstName = first_name FROM deleted 
SELECT @LastName = last_name FROM deleted 
SELECT @Age= age FROM deleted
SELECT @City = city FROM deleted 

BEGIN
	INSERT INTO StudBackup 
	VALUES(@AdmissionNo,@FirstName,@LastName,@Age,@City)
	PRINT'DATA HAS BEEN DELETED AND BACKED UP SUCCESSFULL'
END


DELETE  FROM Student WHERE age=15
SELECT * FROM StudBackup
select * from Student

------------------------------------------------------




