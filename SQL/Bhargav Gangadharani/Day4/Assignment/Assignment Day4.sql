-- 1. Write a query to rank employees based on their salary for a month
SELECT DENSE_RANK() OVER (ORDER BY SALARY DESC) RANK_SALARY , Salary 
FROM Employees ORDER BY Salary DESC


-- 2. Select 4th Highest salary from employee table using ranking function
SELECT salary ,RANK_SALARY
from ( SELECT  DENSE_RANK() OVER (ORDER BY SALARY DESC) RANK_SALARY , Salary FROM Employees ) 
as tbl
WHERE RANK_SALARY = 4


-- 3. Get department, total salary with respect to a department from employee table.
SELECT SUM(Salary) , DepartmentID 
FROM Employees
GROUP BY (DepartmentID)


-- 4. Get department, total salary with respect to a department from employee table order by total salary descending
SELECT SUM(Salary) Total_salary , DepartmentID 
FROM Employees
GROUP BY (DepartmentID) ORDER BY Total_salary DESC


-- 5. Get department wise maximum salary from employee table order by salary ascending
SELECT MAX(Salary) max_department_salary , DepartmentID 
FROM Employees
GROUP BY (DepartmentID) ORDER BY max_department_salary


-- 6. Get department wise minimum salary from employee table order by salary ascending
SELECT MIN(Salary) max_department_salary , DepartmentID FROM Employees
GROUP BY (DepartmentID)
ORDER BY max_department_salary


-- 7. Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending
SELECT SUM(Salary) sum_of_dpt_salary,DepartmentID
FROM Employees
GROUP BY (DepartmentID)
HAVING SUM(Salary) > 5000
ORDER BY sum_of_dpt_salary DESC
