---SELECT QUERY

---- select firstname and lastname from employee table

SELECT FirstName,LastName FROM Employee


--- select firstname,employeeid and hiredate from employee whose departmentid is 90

SELECT FirstName,EmployeeID,HireDate FROM Employee
 WHERE DepartmentID=90

---select firstname,lastname employeeid  employee whose salary between 5000 to 10000

SELECT FirstName,LastName,EmployeeID FROM Employee
WHERE Salary BETWEEN 5000 AND 10000

select * from Employee

---UPDATE QUERY

 --- change salary of employee to 10000 whose ID is 109

 UPDATE Employee SET Salary=10000
 WHERE EmployeeID=109

----change the commissionpct .20 of employees table for those employees whose salary between 8000 to 12000

UPDATE Employee SET CommissionPct=.20 WHERE Salary BETWEEN 8000 AND 14000