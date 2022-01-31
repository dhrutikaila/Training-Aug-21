/* Day 4 */
/* 1. Write a query to rank employees based on their salary for a month*/

SELECT *,Rank() over(order by Salary desc) FROM Employees

/* 2. SELECT 4th Highest salary FROM employee TABLE using ranking function*/

SELECT * FROM (SELECT *,Rank() over(order by Salary desc) as rankk FROM Employees) as tbl where rankk=4;

/* 3. Get department, total salary with respect to a department FROM employee TABLE.*/
SELECT DepartmentID,sum(Salary) FROM Employees group by DepartmentID

/* 4. Get department, total salary with respect to a department FROM employee TABLE order by total salary descending */
SELECT DepartmentID,sum(Salary) FROM Employees group by DepartmentID order by sum(Salary) desc; 


/* 5. Get department wise maximum salary FROM employee TABLE order by salary ascending */
SELECT DepartmentID, max(Salary) FROM Employees  group by DepartmentID order by max(Salary);

/* 6. Get department wise minimum salary FROM employee TABLE order by salary ascending*/
SELECT DepartmentID,min(Salary) FROM Employees group by DepartmentID order by min(Salary);

/* 7. SELECT department, total salary with respect to a department FROM employee TABLE where total salary greater than 50000 order by TotalSalary descending */
SELECT DepartmentId,sum(Salary) as TotalSalary FROM Employees group by DepartmentID having sum(Salary)>50000 order by sum(Salary) desc;
