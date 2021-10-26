USE test1


--Q1 Write a query to rank employees based on their salary for a month
SELECT FirstName+' '+LastName 'Name', Salary, RANK()
OVER (ORDER BY Salary) 'Salary Ranking' FROM Employees

--Q2 Select 4th Highest salary from employee table using ranking function
SELECT * FROM (
SELECT FirstName+' '+LastName 'Name', Salary, Sal_Rank = RANK() 
OVER (ORDER BY Salary DESC) FROM Employees
) temp
WHERE Sal_Rank=4

--Q3 Get department, total salary with respect to a department from employee table.
SELECT DepartmentID, Total_Salary=SUM(Salary) from Employees
GROUP BY DepartmentID

--Q4 Get department, total salary with respect to a department from employee table order by total salary descending

SELECT DepartmentID, Total_Salary=SUM(Salary) from Employees
GROUP BY DepartmentID
ORDER BY Total_Salary DESC

--Q5 Get department wise maximum salary from employee table order by salary ascending

SELECT DISTINCT DepartmentID,  dept_max_sal=(MAX(Salary) 
OVER( PARTITION BY DepartmentID)) FROM Employees
ORDER BY dept_max_sal ASC

--Q6 Get department wise minimum salary from employee table order by salary ascending

SELECT DISTINCT DepartmentID, dept_min_sal=(MIN(Salary) 
OVER( PARTITION BY DepartmentID)) FROM Employees
ORDER BY dept_min_sal ASC

--Q7 Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending
SELECT * FROM 
(
SELECT DepartmentID, total_dept_sal=(SUM(Salary)) FROM Employees
GROUP BY DepartmentID
) temp
WHERE total_dept_sal>50000
ORDER BY total_dept_sal DESC 

--OR

SELECT * FROM
(
SELECT DISTINCT DepartmentID, total_dept_sal=(SUM(Salary)
OVER ( PARTITION BY DepartmentID)) FROM Employees
) temp
WHERE total_dept_sal>50000
ORDER BY total_dept_sal DESC
