
---find  experience of employee 

--Creating Scalar Function
ALTER FUNCTION experience (@date date)
RETURNS float
AS
BEGIN

RETURN datediff(yy,@date,getdate())	
END



SELECT *,dbo.experience(hiredate) FROM Employees
SELECT * FROM Employees


----create  table valued function
---employee name and manager name

CREATE FUNCTION findmanagerfun (@name nvarchar(25))  
RETURNS TABLE  
AS  
RETURN   
(  
   SELECT M.EmployeeID,M.firstname ,E.employeeid AS 'manager',E.firstname'manager_name' 
   from employees E join employees M on E.EmployeeID=M.managerid  and E.FirstName=@name


)

SELECT * FROM findmanagerfun('den') 



----first name, salary of all employees whose salary is above average for their departments 


CREATE FUNCTION findavg ()  
RETURNS TABLE  
AS  
RETURN   
(  
  SELECT FirstName,LastName,salary,DepartmentID  FROM employees WHERE salary > (SELECT avg(Salary)as 'salary'  FROM employees)
	
)

select * from findavg()
