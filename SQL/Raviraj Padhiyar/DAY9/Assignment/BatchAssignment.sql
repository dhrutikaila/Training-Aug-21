SELECT d.DepartmentName FROM Employees e
	INNER JOIN Departments d ON d.DepartmentID = e.DepartmentID

-- Create a batch Select Banking as ‘IT Dept’, Insurance as ‘Sales Dept’ and Services as ‘Executive Dept’ from employee table

Select e.EmployeeID, e.FirstName, e.LastName, e.Salary,e.JoiningDate, DepartmentName= 
Case
    when d.DepartmentName ='IT' then 'IT Dept.'
    when d.DepartmentName ='Sales' then 'Sales Dept.'
    when d.DepartmentName ='Executive' then 'Executive Dept.'
end
FROM Employees e
INNER JOIN Departments d ON d.DepartmentID = e.DepartmentID
GO

