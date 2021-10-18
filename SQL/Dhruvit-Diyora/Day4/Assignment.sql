--task1-Write a query to rank employees based on their salary for a month
SELECT DENSE_RANK() OVER(ORDER BY Salary DESC) Ranks,*
FROM Employees


--task2-Select 4th Highest salary from employee table using ranking function
SELECT * INTO Salary FROM (SELECT RANK() OVER (ORDER BY Salary DESC) TopSalary,* FROM Employees) temp 
SELECT * FROM Salary WHERE TopSalary=4


--task3-Get department, total salary with respect to a department from employee table.
 SELECT D.DepartmentName, SUM(E.Salary) AS Salary FROM Employees E JOIN Departments D ON E.DepartmentID=D.DepartmentID GROUP BY(D.DepartmentName) ORDER BY D.DepartmentName


--task4-Get department, total salary with respect to a department from employee table order by total salary descending
SELECT D.DepartmentName, SUM(E.Salary) AS Salary FROM Employees E JOIN Departments D ON E.DepartmentID=D.DepartmentID GROUP BY(D.DepartmentName) ORDER BY Salary DESC


--task5-Get department wise maximum salary from employee table order by salary ascending
SELECT D.DepartmentName, MAX(E.Salary) AS Salary FROM Employees E JOIN Departments D ON E.DepartmentID=D.DepartmentID GROUP BY(D.DepartmentName) ORDER BY Salary ASC


--task6-Get department wise minimum salary from employee table order by salary ascending
SELECT D.DepartmentName, MIN(E.Salary) AS Salary FROM Employees E JOIN Departments D ON E.DepartmentID=D.DepartmentID GROUP BY(D.DepartmentName) ORDER BY Salary ASC


--task7-Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending
SELECT D.DepartmentName, SUM(E.Salary) AS Salary FROM Employees E JOIN Departments D ON E.DepartmentID=D.DepartmentID GROUP BY(D.DepartmentName) HAVING  SUM(E.Salary)>50000 ORDER BY Salary ASC 