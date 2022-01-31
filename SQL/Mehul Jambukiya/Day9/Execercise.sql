/*Create a batch Select Banking as ‘Bank Dept’, Insurance as ‘Insurance Dept’ and Services as
‘Services Dept’ from employee table*/

--USE JOINPRACTICE

SELECT Employee_Id, First_Name+' '+Last_Name AS [Name],Salary,Joining_Date,Manager_Id,'Department' =  
CASE Department
	WHEN 'Banking' THEN 'Bank Dept'
	WHEN 'Insurance' THEN 'Insurance Dept'
	WHEN 'Services' THEN 'Services Dept'
	END
FROM Employee
GO

/*5 Students Name, Address, City, DOB, Standard need to be inserted in the student table,
need to fetch these result from json variable. and select output in the json format*/

--USE ADVENTUREWORKS2017

DECLARE @student NVARCHAR(MAX)

SET @student = '[{"Name":"abc1","Address":"address1","City":"City1","DOB":"01/01/2000","Standard":"5"},
				{"Name":"abc2","Address":"address2","City":"City2","DOB":"01/02/2000","Standard":"6"},
				{"Name":"abc3","Address":"address3","City":"City3","DOB":"01/03/2000","Standard":"7"},
				{"Name":"abc4","Address":"address4","City":"City4","DOB":"01/04/2000","Standard":"8"},
				{"Name":"abc5","Address":"address5","City":"City5","DOB":"01/05/2000","Standard":"9"}]'


CREATE TABLE StudentData
(
Name NVARCHAR(MAX),
Address NVARCHAR(MAX),
City NVARCHAR(MAX),
DOB NVARCHAR(MAX),
Standard NVARCHAR(MAX)
)



IF(ISJSON(@student)>0)
	BEGIN
		INSERT INTO StudentData SELECT * FROM OPENJSON(@student)
			WITH
			(
			Name NVARCHAR(MAX) '$.Name',
			Address NVARCHAR(MAX) '$.Address',
			City NVARCHAR(MAX) '$.City',
			DOB NVARCHAR(MAX) '$.DOB',
			Standard NVARCHAR(MAX) '$.Standard'	
			)
	END

SELECT * FROM StudentData FOR JSON AUTO	

