SELECT * FROM employees
use emp

--Q1

SELECT FirstName+' '+LastName 'Name', Salary, RANK() OVER (ORDER BY Salary) 'Salary Ranking' FROM dbo.Employees

--Q2

SELECT * FROM (
SELECT FirstName+' '+LastName 'Name', Salary, Sal_Rank = RANK() OVER (ORDER BY Salary DESC) FROM dbo.Employees
) temp
WHERE Sal_Rank=4

--Q3

SELECT DepartmentID, Total_Salary=SUM(Salary) from dbo.Employees
GROUP BY DepartmentID

--Q4

SELECT DepartmentID, Total_Salary=SUM(Salary) from dbo.Employees
GROUP BY DepartmentID
ORDER BY Total_Salary DESC

--Q5

SELECT DISTINCT DepartmentID,  dept_max_sal=(MAX(Salary) OVER( PARTITION BY DepartmentID)) FROM dbo.Employees
ORDER BY dept_max_sal 

--Q6

SELECT DISTINCT DepartmentID, dept_min_sal=(MIN(Salary) OVER( PARTITION BY DepartmentID)) FROM dbo.Employees
ORDER BY dept_min_sal 

--Q7
SELECT * FROM 
(
SELECT DepartmentID, total_dept_sal=(SUM(Salary)) FROM dbo.Employees
GROUP BY DepartmentID
) temp
WHERE total_dept_sal>50000
ORDER BY total_dept_sal DESC 