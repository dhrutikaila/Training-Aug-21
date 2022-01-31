---Scalar Function
SELECT * FROM Employees

CREATE FUNCTION fun_empDetails(@id INT)
RETURNS INT 
AS
BEGIN 
DECLARE @experience INT 
SELECT @experience = DATEDIFF(YY,HireDate,GETDATE()) FROM Employees WHERE EmployeeID=@id
RETURN @experience
END

--CALL THE FUNCTION
SELECT dbo.fun_empDetails(101)

SELECT FirstName+' '+LastName 'NAME' , EXPERIENCE = dbo.fun_empDetails(EmployeeID)  FROM EmployeeS


---TABLE-VALUED FUNCTION
CREATE FUNCTION getdetails(@empid INT)
RETURNS TABLE 
AS
RETURN (
SELECT FirstName , LastName , HireDate , JobId FROM Employees WHERE EmployeeID = @empid
)

SELECT * FROM dbo.getdetails(105)