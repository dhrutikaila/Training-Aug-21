--Write a query to rank employees based on their salary for a month
select Salary,rank() over(order by salary) 'rank' ,* from Employees

SELECT Salary, DENSE_RANK()OVER(ORDER BY Salary) 'DENSE_RANK',* FROM Employees

SELECT Salary, ROW_NUMBER()OVER(ORDER BY Salary) 'row_number',* FROM Employees


--Select 4th Highest salary from employee table using ranking function

SELECT * FROM
(SELECT *,RANK()OVER(ORDER BY Salary )'RANK' FROM Employees) exampl1
WHERE RANK=4

SELECT * FROM
(SELECT *, DENSE_RANK()OVER(ORDER BY Salary)  'DENSE_RANK'  FROM Employees) eam
WHERE DENSE_RANK=4


--Get department, total salary with respect to a department from employee table.
SELECT DepartmentID,sum(Salary) from Employees GROUP BY DepartmentID

--Get department, total salary with respect to a department from employee table order by total salary descending
SELECT DepartmentID,sum(Salary) from Employees GROUP BY DepartmentID ORDER BY sum(Salary) DESC

--Get department wise maximum salary from employee table order by salary ascending
SELECT DepartmentID,max(Salary)   from Employees GROUP BY DepartmentID  ORDER BY max(Salary) 

---Get department wise minimum salary from employee table order by salary ascending
SELECT DepartmentID ,min(Salary)   from Employees GROUP BY DepartmentID  ORDER BY min(Salary) 

--Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending
SELECT DepartmentID,sum(Salary)   from Employees GROUP BY DepartmentID  HAVING sum(Salary)>50000 ORDER BY sum(Salary) desc 


select * from Employees
