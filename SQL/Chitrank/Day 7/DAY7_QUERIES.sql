/*
1.Write a query to rank employees based on their salary for a month
*/

with myCTE(Rank,EmployeeID,Salary)
as
(select ROW_NUMBER() OVER(ORDER BY SALARY)[Rank],EmployeeID,Salary FROM Employees)
SELECT * FROM myCTE 

/*
2.Select 4th Highest salary from employee table using ranking function
*/
with myCTE(Rank,EmployeeID,Salary)
as
(SELECT DENSE_RANK() OVER(ORDER BY SALARY DESC)[Rank],EmployeeID,Salary FROM Employees)
select * from myCTE where rank =4

/*
3.Get department, total salary with respect to a department from employee table.
*/
with myCTE(DepartmentID,Salary)
as
(SELECT DepartmentID,Salary FROM Employees)
select DepartmentID,Sum(Salary) [Total Salary] from myCTE group by DepartmentID


/*
4.Get department, total salary with respect to a department from employee table order by total salary descending
*/
with myCTE(DepartmentID,Salary)
as
(SELECT DepartmentID,Salary FROM Employees)
select DepartmentID,Sum(Salary) [Total Salary] from myCTE group by DepartmentID order by [Total Salary] DESC


/*
5.Get department wise maximum salary from employee table order by salary ascending
*/
with myCTE(DepartmentID,Salary)
as
(SELECT DepartmentID,Salary FROM Employees)
select DepartmentID,max(Salary) [Max Salary] from myCTE group by DepartmentID order by [Max Salary] 


/*
6.Get department wise minimum salary from employee table order by salary ascending
*/
with myCTE(DepartmentID,Salary)
as
(SELECT DepartmentID,Salary FROM Employees)
select DepartmentID,min(Salary) [Min Salary] from myCTE group by DepartmentID order by [Min Salary] 


/*
7.Select department, total salary with respect to a department from employee table 
where total salary greater than 50000 order by TotalSalary descending
*/
with myCTE(DepartmentID,TotalSalary)
as
(SELECT DepartmentID,SUM(Salary)'TotalSalary' FROM Employees group by DepartmentID)
select * from myCTE WHERE TotalSalary > 50000 ORDER BY TotalSalary DESC


/*
8.Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
*/
SELECT DATEDIFF(YYYY,HireDate,Incentive_date) FROM Employees e
JOIN Incentives i
on e.EmployeeID = i.EmployeeID

/*
9.Select first_name, incentive amount from employee and incentives table for those employees who 
have incentives and incentive amount greater than 3000
*/
SELECT FirstName,IncentiveAmount FROM Employees e
JOIN Incentives i
on e.EmployeeID = i.EmployeeID
WHERE INCENTINVE_AMOUNT>3000

/*
10.Select first_name, incentive amount from employee and incentives table for all employees even 
if they didn’t get incentives.
*/
SELECT FirstName,INCENTINVE_AMOUNT FROM Employees e
LEFT JOIN Incentives i
ON e.EmployeeID = i.EMPLOYEE_REF_ID

/*
11.Select EmployeeName, ManagerName from the employee table.
*/
SELECT e.FirstName as EmployeeName,e1.FirstName as ManagerName
FROM Employees e
JOIN Employees e1
on e.ManagerID = e1.EmployeeID

/*
12.Select first_name, incentive amount from employee and incentives table for all employees even 
if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.
*/
SELECT FirstName,ISNULL(INCENTINVE_AMOUNT,0) FROM Employees e
LEFT JOIN Incentives i
ON e.EmployeeID = i.EMPLOYEE_REF_ID


