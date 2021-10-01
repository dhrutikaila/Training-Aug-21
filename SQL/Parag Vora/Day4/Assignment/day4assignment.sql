-- Write a query to rank employees based on their salary for a month
    select RANK() over (Order by salary desc) as 'rank',* from Employees

--Select 4th Highest salary from employee table using ranking function
    select * from(select dense_RANK() over (Order by salary desc) as 'rank',* from Employees) tbl where rank= 4

-- Get department, total salary with respect to a department from employee table.
    select DepartmentID ,sum(Salary) as TotalSalary from employees group by DepartmentID

-- Get department, total salary with respect to a department from employee table order by total salary descending
    select DepartmentID ,sum(Salary) as TotalSalary from employees group by DepartmentID  order by TotalSalary desc

-- Get department wise maximum salary from employee table order by salary ascending
    SELECT DepartmentID,MAX(SALARY) as  MAXSALARY
    FROM Employees GROUP BY DepartmentID ORDER BY MAXSALARY ASC;

-- Get department wise minimum salary from employee table order by salary ascending
    SELECT DepartmentID,MIN(SALARY) as  MINSALARY
    FROM Employees GROUP BY DepartmentID ORDER BY MINSALARY ASC;

-- Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending

    select DepartmentID,Sum(Salary) as TotalSalary 
    from employees    
    GROUP BY DepartmentID  
    HAVING sum(Salary) > 50000
    ORDER BY TotalSalary desc 