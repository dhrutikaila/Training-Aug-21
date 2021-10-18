/* Stored Procedures*/
/* A Stored Procedure is a previously written SQL Stateent which has been Stored or saved INTO the database.*/
/* One of The Things that will save you time when running the same query over and over again is to CREATE stored procedure, which you can then execute FROM within the database's Command Environment.*/
/* Right-click Stored Procedures and Choose New Stored Procedure */

CREATE PROCEDURE AllEmployeesWithDept  
WITH EXECUTE AS CALLER  
AS  
    SET NOCOUNT ON;  
    SELECT * 
    FROM Employees e
    INNER JOIN Departments d
      ON e.DepartmentID = d.DepartmentID 
    inner Join Employees m 
    on e.ManagerID= m.EmployeeID   
    ORDER BY e.FirstName ASC;  
GO  

--with parameter
CREATE PROCEDURE AllEmployeesWithDept2 
	@FirstName nvarchar(50),
	@LastName  nvarchar(50)
AS  
    SET NOCOUNT ON;  
    SELECT * 
    FROM Employees e
    INNER JOIN Departments d
      ON e.DepartmentID = d.DepartmentID 
    inner Join Employees m 
    on e.ManagerID= m.EmployeeID   
    where e.FirstName=@FirstName and e.LastName=@LastName ORDER BY e.FirstName;  
GO
SELECT * FROM Employees
execute AllEmployeesWithDept2 N'Deep',N'Adalja';

--with default parameter

CREATE PROCEDURE AllEmployeesWithDept3 
	@FirstName nvarchar(50)=N'Deep',
	@LastName  nvarchar(50)=N'Adalja'
AS  
    SET NOCOUNT ON;  
    SELECT * 
    FROM Employees e
    INNER JOIN Departments d
      ON e.DepartmentID = d.DepartmentID 
    inner Join Employees m 
    on e.ManagerID= m.EmployeeID   
    where e.FirstName=@FirstName and e.LastName=@LastName ORDER BY e.FirstName;  
GO
--SELECT * FROM Employees
execute AllEmployeesWithDept3;
execute AllEmployeesWithDept3 @LastName=N'Dave';
execute AllEmployeesWithDept3 @LastName=N'Adalja',@FirstName='Deep';

--

DECLARE @employeeData NVARCHAR(MAX) = 
N'[
	{
		"Name":"Nisarg",
		"Address":"c/5,
		Manglam Heights,
		Sola","City":"Ahmedabad",
		"DOB":"2000-02-26"
	},
	{
		"Name":"Deep",
		"Address":"Vyas Banglows,Ranip",
		"City":"Ahmedabad",
		"DOB":"2000-02-02"
	},
	{
		"Name":"Dhruvil",
		"Address":"A-35,Golden Tower,gota",
		"City":"Ahmedabad",
		"DOB":"2000-05-16"
	},
	{
		"Name":"Jenil",
		"Address":"ParmarEstate",
		"City":"Sanand",
		"DOB":"2000-05-05"
	},
	{
		"Name":"Ridham",
		"Address":"Malabar heigts,Gota",
		"City":"Ahemdabad",
		"DOB":"2000-10-05"
	}
]';

INSERT INTO Students
SELECT 
	*
FROM OPENJSON(@studentData)
 end
 GO


CREATE PROCEDURE uspGetInfoFROMJson
@userData NVARCHAR(MAX)=NULL
AS
BEGIN
	IF @userData IS NULL
	BEGIN
       PRINT 'ERROR: You must provide a json string.'  
       RETURN(1)  
	END


SET NOCOUNT ON
SELECT * FROM OPENJSON(@userData)
WITH (
	userName VARCHAR(10) '$.name',
	userSurname VARCHAR(10) '$.surname',
	userPhoneNumber VARCHAR(10) '$.PhoneNumber'
)
RETURN (0);
END

EXEC uspGetInfoFROMJson N'[{"name":"nisarg","surname":"adalja","PhoneNumber":"7802043370"},{"name":"sagar","surname":"patel","PhoneNumber":"6581523545"}]'


--json as output
SELECT * FROM Employee
ALTER PROCEDURE JsonAsOutput
@Salary int,
@salary1 int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM Employee where Salary between @Salary and @salary1
	FOR JSON AUTO
  return
	SET NOCOUNT OFF;
END

EXEC JsonAsOutput 15000,22000


