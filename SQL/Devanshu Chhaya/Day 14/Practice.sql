--===== After and For Trigger
use Practice
ALTER TRIGGER Triggerforinsert
ON dbo.Student
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
		
	INSERT INTO UPDATEDSTU
		(StudentID, StudentName, TotalFees,UpdatedON,Status)
	SELECT i.StudentID,StudentName,TotalFees,GETDATE(),'Updated' from Inserted i

	
	IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
		
	INSERT INTO UPDATEDSTU
		(StudentID, StudentName, TotalFees, UpdatedON,Status)
	SELECT i.StudentID,StudentName,TotalFees,GETDATE(),'Inaserted' from Inserted i

	
	IF NOT EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
		
	INSERT INTO UPDATEDSTU
		(StudentID, StudentName, TotalFees, UpdatedON,Status)
	SELECT d.StudentID,StudentName,TotalFees,GETDATE(),'Deleted' from Deleted d
END


CREATE TABLE UPDATEDSTU(
	StudentID INT,
	StudentName VARCHAR(50),
	TotalFees Money,
	UpdatedON DATETIME,
	Status varchar(25)
)

select * from Student

UPDATE Student SET TotalFees=150000 WHERE StudentID=7

INSERT INTO Student VALUES('Ajay',85000,25000)


SELECT * FROM UPDATEDSTU

--- =======

USE AdventureWorks2012

SELECT * FROM Purchasing.PurchaseOrderDetail

SELECT * FROM Purchasing.PurchaseOrderHeader

CREATE TRIGGER NewOrderDetail ON Purchasing.PurchaseOrderDetail
FOR INSERT AS 
IF @@ROWCOUNT=1
BEGIN
	UPDATE Purchasing.PurchaseOrderHeader 
	SET SubTotal=SubTotal+LineTotal
	FROM inserted
	WHERE PurchaseOrderHeader.PurchaseOrderID=inserted.PurchaseOrderID
END

BEGIN 
	UPDATE Purchasing.PurchaseOrderHeader
	SET SubTotal=SubTotal+
		(SELECT SUM(LineTotal)
			FROM inserted
			WHERE PurchaseOrderHeader.PurchaseOrderID=inserted.PurchaseOrderID)
	FROM inserted
	WHERE PurchaseOrderHeader.PurchaseOrderID IN (SELECT PurchaseOrderID FROM inserted)
END
	
INSERT INTO Purchasing.PurchaseOrderDetail VALUES
(4012,'2014-07-24 00:00:00.000',6000,884,41.57,249420.00,6000.00,0.00,6000.00,'2015-08-12 12:25:46.483')

			
----========== Instade of trigger

CREATE TABLE Department
(
  ID INT PRIMARY KEY,
  Name VARCHAR(50)
)

INSERT INTO Department VALUES(1, 'IT'),
(2, 'HR'),
(3, 'Sales')


CREATE TABLE Employee
(
  ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Gender VARCHAR(50),
  DOB DATETIME,
  Salary DECIMAL(18,2),
  DeptID INT
)

INSERT INTO Employee VALUES(1, 'Pranaya', 'Male','1996-02-29 10:53:27.060', 25000, 1),
(2, 'Priyanka', 'Female','1995-05-25 10:53:27.060', 30000, 2),
(3, 'Anurag', 'Male','1995-04-19 10:53:27.060',40000, 2),
(4, 'Preety', 'Female','1996-03-17 10:53:27.060', 35000, 3),
(5, 'Sambit', 'Male','1997-01-15 10:53:27.060', 27000, 1),
(6, 'Hina', 'Female','1995-07-12 10:53:27.060', 33000, 2)

CREATE VIEW EmployeeDetails
AS
	SELECT E.ID, E.Name, E.Gender, E.Salary, D.Name AS DepartmentName
	FROM Employee E JOIN Department D ON E.DeptID=D.ID

SELECT * FROM EmployeeDetails

CREATE TRIGGER Insteadeof_EmployeeDetails ON EmployeeDetails
INSTEAD OF INSERT AS
BEGIN
	DECLARE @DepartmentID INT
	SELECT @DepartmentID=D.ID
	FROM Department D JOIN inserted I
	ON   D.Name= I.DepartmentName

	IF(@DepartmentID IS NULL)
	BEGIN
		PRINT 'Invalid departmentID please enter valid id'
	END

	INSERT INTO Employee(ID,Name,Gender,Salary,DeptID)
	SELECT ID,Name,Gender,Salary,@DepartmentID
	FROM inserted
END

INSERT INTO EmployeeDetails VALUES(7,'Yuvraj','Male',60000,'IT')	 

SELECT * FROM Employee

SELECT * FROM EmployeeDetails


