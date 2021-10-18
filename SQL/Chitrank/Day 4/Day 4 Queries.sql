/*
1.Write a query to rank employees based on their salary for a month
*/

SELECT ROW_NUMBER() OVER(ORDER BY Salary DESC) [Row Number],
FirstName,LastName,Salary
FROM Employees 

SELECT RANK() OVER(ORDER BY Salary DESC) [Rank],
FirstName,LastName,Salary
FROM Employees

SELECT DENSE_RANK() OVER(ORDER BY Salary DESC) [Dense Rank],
FirstName,LastName,Salary
FROM Employees 


/*
2.SELECT 4th Highest salary FROM employee TABLE using ranking function
*/
SELECT * FROM (SELECT DENSE_RANK() OVER (ORDER BY Salary DESC) Rank,
* FROM Employees) tmp where rank =4 


/*
3.Get department, total salary with respect to a department 
FROM employee TABLE.
*/
SELECT departmentid, SUM(salary)
FROM employees 
GROUP BY departmentid

/*
4.Get department, total salary with respect to a department 
FROM employee TABLE order by total salary descending
*/
SELECT DepartmentID,SUM(Salary) [Total Salary] FROM Employees
Group By DepartmentID ORDER BY [Total Salary] DESC

/*
5.Get department wise maximum salary FROM employee TABLE order by
salary ascending
*/

SELECT DepartmentID,MAX(Salary) [Max Salary] FROM Employees 
Group By DepartmentID ORDER BY [Max Salary] 

/*
6.Get department wise minimum salary FROM employee TABLE order by 
salary ascending
*/

SELECT DepartmentID,MIN(Salary) [Min Salary] FROM Employees 
Group By DepartmentID ORDER BY [Min Salary]

/*
7.SELECT department, total salary with respect to a department FROM 
employee TABLE where total salary greater than 50000 order by 
TotalSalary descending
*/

SELECT DepartmentID,SUM(Salary) [TotalSalary] FROM Employees
GROUP BY DepartmentID HAVING SUM(SALARY)>50000
ORDER BY TotalSalary DESC


