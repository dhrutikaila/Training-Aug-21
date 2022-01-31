--Write a query to rank employees bASed on their salary

WITH CTE(EmployeeID,salary,rank)
AS
(SELECT Employeeid,Salary,dense_rank() over(order by salary desc) 'rank'  FROM Employees
)
SELECT * FROM CTE


----SELECT 4th Highest salary FROM employee table using ranking function

WITH CTE(EmployeeID,salary,RANK)
AS
(SELECT EmployeeID,salary,DENSE_RANK()OVER(ORDER BY Salary )'RANK' FROM Employees) 
SELECT * FROM CTE WHERE RANK=4



--Get department, total salary WITH respect to a department FROM employee table.

WITH CTE(DepartmentID,salary)
AS
(
SELECT DepartmentID,Salary FROM Employees 
)SELECT DepartmentID,sum(Salary) FROM CTE group by DepartmentID



--Get department, total salary WITH respect to a department FROM employee table order by total salary descending
WITH CTE(DepartmentID,salary)
AS
(
SELECT DepartmentID,Salary FROM Employees
)
SELECT DepartmentID,sum(Salary) FROM CTE GROUP BY DepartmentID ORDER BY sum(salary) DESC



--Get department wise maximum salary FROM employee table order by salary AScending
WITH CTE(DepartmentID,salary)
AS
(
SELECT DepartmentID,Salary   FROM Employees  
)
SELECT DepartmentID,max(Salary)  FROM CTE GROUP BY DepartmentID  ORDER BY max(Salary)



----  Get difference between JOINING_DATE and INCENTIVE_DATE FROM employee and incentives table

WITH CTE(name,Hiredate,Incentives_Date)
AS
(

SELECT E.firstname AS'name',E.Hiredate AS 'hiredate',I.Incentive_Date AS'Incentives_Date' FROM Incentive I inner join Employees E on I.EmployeeID = E.EmployeeID 
)
SELECT datediff(dd,Hiredate,Incentives_Date) ,name FROM CTE 

--Q2 SELECT first_name, incentive amount FROM employee and incentives table for those employees who have incentives and incentive amount greater than 3000

WITH CTE(name,Incentives_A)
AS
(
SELECT E.FirstName AS 'name',I.Incentive_Amount AS'Incentives_A' FROM Incentive I LEFT join Employees E on I.EmployeeID=E.EmployeeID 
)
SELECT name,Incentives_A FROM CTE WHERE Incentives_A> 3000


--q3 SELECT first_name, incentive amount FROM employee and incentives table for all employees even if they didn�t get incentives.
 

WITH CTE(name,Incentives_A)
AS
(

SELECT E.FirstName AS 'name', I.Incentive_Amount AS 'Incentive_A'  FROM  Incentive I RIGHT join  Employees E on I.EmployeeID=E.EmployeeID  
)
SELECT name,Incentives_A FROM CTE


