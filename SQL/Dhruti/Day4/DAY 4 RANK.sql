USE test1


--Q1
SELECT FirstName+' '+LastName 'Name', Salary, RANK()
OVER (ORDER BY Salary) 'Salary Ranking' FROM Employees

--Q2
SELECT * FROM (
SELECT FirstName+' '+LastName 'Name', Salary, Sal_Rank = RANK() 
OVER (ORDER BY Salary DESC) FROM Employees
) temp
WHERE Sal_Rank=4
SELECT DepartmentID, Total_Salary=SUM(Salary) from Employees
GROUP BY DepartmentID

--Q4

SELECT DepartmentID, Total_Salary=SUM(Salary) from Employees
GROUP BY DepartmentID
ORDER BY Total_Salary DESC

--Q5

SELECT DISTINCT DepartmentID,  dept_max_sal=(MAX(Salary) 
OVER( PARTITION BY DepartmentID)) FROM Employees
ORDER BY dept_max_sal ASC

--Q6

SELECT DISTINCT DepartmentID, dept_min_sal=(MIN(Salary) 
OVER( PARTITION BY DepartmentID)) FROM Employees
ORDER BY dept_min_sal ASC

--Q7
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