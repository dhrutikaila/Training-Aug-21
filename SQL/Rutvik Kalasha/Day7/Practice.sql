With SalaryCTE(EmployeeID) 
AS (SELECT EmployeeID FROM salary where salary >=10000), 
RadixCTE( EmployeeName, EmployeeID ,Salary)  
AS (SELECT FirstName,LastName, EmployeeID From Employees e Join salaryCTE s on e.employeeID = s.EmployeeID) 

