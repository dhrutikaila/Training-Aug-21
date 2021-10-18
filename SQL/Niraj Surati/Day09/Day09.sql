USE Assignment2

-- 1. Create a batch Select Banking as ‘Bank Dept’, Insurance as ‘Insurance Dept’ and Services as ‘Services Dept’ from employee table

SELECT *
FROM Departments

SELECT *
FROM Employees

SELECT	E.EmployeeID 
	,	E.FirstName
	,	E.LastName
	,	(CASE DepartmentName
		WHEN 'Marketing' THEN 'Marketing Dept'
		WHEN 'IT' THEN 'IT Dept'
		WHEN 'Accounting' THEN 'Accounting Dept'
		ELSE D.DepartmentName
		END) AS 'Department Name'
FROM Employees AS E
INNER JOIN Departments AS D
	ON E.DepartmentID = D.DepartmentID
GO

-- 2. 5 Students Name, Address, City, DOB, Standard need to be inserted in the student table, need to fetch these result from json variable. and select output in the json format

CREATE TABLE Students(
		StudentID INT IDENTITY(1,1)
	,	Name VARCHAR(30) NOT NULL
	,	Address VARCHAR(255) NOT NULL
	,	City VARCHAR(30) NOT NULL
	,	DOB DATE NOT NULL
	,	Standard TINYINT NOT NULL
	,	CONSTRAINT PK_Students_StudentID PRIMARY KEY(StudentID)
)

-- JSON

DECLARE @json NVARCHAR(MAX)
SET @json = N'[
{
	"Name":"Niraj",
	"Address":"Shahpur",
	"City":"Ahmedabad",
	"DOB":"1998-05-12",
	"Standard":10
	},
	{
	"Name":"Sagar",
	"Address":"Shahpur",
	"City":"Ahmedabad",
	"DOB":"1998-02-11",
	"Standard":10
	},
	{
	"Name":"Meet",
	"Address":"Maninagar",
	"City":"Ahmedabad",
	"DOB":"1998-05-18",
	"Standard":1
	},
	{
	"Name":"Vinod",
	"Address":"Airport",
	"City":"Ahmedabad",
	"DOB":"1992-09-06",
	"Standard":12
	},
	{
	"Name":"Amit",
	"Address":"Sarangpur",
	"City":"Ahmedabad",
	"DOB":"1998-03-02",
	"Standard":10
	}
]'

IF(ISJSON(@json) > 0)
BEGIN
	INSERT INTO Students
	SELECT *
	FROM OPENJSON(@json)
	WITH 
	(
			Name VARCHAR(30) 'strict $.Name'
		,	Address VARCHAR(255) 'strict $.Address'
		,	City VARCHAR(30)  'strict $.City'
		,	DOB DATE 'strict $.DOB'
		,	Standard TINYINT 'strict $.Standard'
	)
END
ELSE
BEGIN
	PRINT 'JSON Format is not proper.'
END

SELECT * FROM Students

-- JSON OUTPUT Format

SELECT * 
FROM Students
FOR JSON PATH



