---Table Data into String JSON Fromat
SELECT * FROM Departments FOR JSON PATH

---Json STRING Fromat Insert Into Table
DECLARE @json NVARCHAR(MAX)
SET @json = '{"DepartmentID":51,"DepartmentName":"Administration","ManagerID":225,"LocationID":1700}';

INSERT INTO Departments
SELECT DepartmentID, DepartmentName, ManagerID, LocationID 
FROM OPENJSON(@json)
WITH
(
DepartmentID decimal(4,0) '$.DepartmentID', 
DepartmentName varchar(30) '$.DepartmentName', 
ManagerID decimal(6,0) '$.ManagerID', 
LocationID decimal(4,0) '$.LocationID'
)
SELECT * FROM Departments

---ISJSON Query
DECLARE @json NVARCHAR(MAX)
SET @json = '{"DepartmentID":51,"DepartmentName":"Administration","ManagerID":225,"LocationID":1700}';

IF (ISJSON(@json)) > 0
BEGIN

SELECT DepartmentID, DepartmentName, ManagerID, LocationID 
FROM OPENJSON(@json)
WITH
(
DepartmentID decimal(4,0) '$.DepartmentID', 
DepartmentName varchar(30) '$.DepartmentName', 
ManagerID decimal(6,0) '$.ManagerID', 
LocationID decimal(4,0) '$.LocationID'
)
END

DECLARE @json NVARCHAR(MAX);
SET @json = '{"DepartmentID":51,"DepartmentName":"Administration","ManagerID":225,"LocationID":1700}';
SET @json = JSON_MODIFY(@json, '$.DepartmentName', 'Manager');
SELECT modifiedJson = @json

DECLARE @json NVARCHAR(MAX)
SET @json = '{"DepartmentID":51,"DepartmentName":"Administration","ManagerID":225,"LocationID":1700}';

IF (ISJSON(@json)) > 0
BEGIN 
PRINT 'String Is Valid'
END


---Assingment Json

CREATE TABLE Student (StudentName VARCHAR(20), Address VARCHAR(40), City VARCHAR(20), DOB DATE, Standard INT)
INSERT INTO Student VALUES('Dev', '43/1 mahashaktinagar', 'Ahmedabad', '2000-08-19', 12)



DECLARE @json_Student NVARCHAR(MAX)
SET @json_Student = 
'{"StudentName":"Devendra", "Address":"mirzapur", "City":"Gandhinagar", "DOB":"1998-06-13", "Standard":6}, 
{"StudentName":"Ravi", "Address":"Chandkheda", "City":"Surat", "DOB":"2005-07-03", "Standard":2}, 
{"StudentName":"Pankaj", "Address":"Ranip", "City":"Surat", "DOB":"1999-09-09", "Standard":7}, 
{"StudentName":"Sanjay", "Address":"Pragtinagar", "City":"Rajkot", "DOB":"1994-13-10", "Standard":10}, 
{"StudentName":"Saurabh", "Address":"Ghatlodiya", "City":"Ahmedabad", "DOB":"1997-04-14", "Standard":1}';

INSERT INTO Student
SELECT StudentName, [Address], City, DOB, [Standard] 
FROM OPENJSON(@json_Student)
WITH
(
StudentName Varchar(20) '$.StudentName' 
[Address] VARCHAR(40) '$.Address', 
City VARCHAR(20) '$.City', 
DOB DATE '$.DOB', 
[Standard] INT '$.Standard'
)
GO

SELECT * FROM Student FOR JSON PATH 

SELECT * FROM Student FOR JSON AUTO


