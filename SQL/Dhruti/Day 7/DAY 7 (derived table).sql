--DERIVED TABLE

--Q1 Write a query to rank employees based on their salary for a month
SELECT FirstName+' '+LastName 'Name', Salary, RANK()
OVER (ORDER BY Salary) 'Salary Ranking' FROM Employee AS TEMP


--Q2 Select 4th Highest salary from employee table using ranking function
SELECT * FROM (
SELECT FirstName+' '+LastName 'Name', Salary, Sal_Rank = RANK() 
OVER (ORDER BY Salary DESC) FROM Employee
) temp
WHERE Sal_Rank=4

--Q3 Get department, total salary with respect to a department from employee table.
SELECT DepartmentID, Total_Salary=SUM(Salary) from Employee AS temp
GROUP BY DepartmentID 

--Q4 Get department, total salary with respect to a department from employee table order by total salary descending

SELECT DepartmentID, Total_Salary=SUM(Salary) from Employee AS temp
GROUP BY DepartmentID
ORDER BY Total_Salary DESC

--Q5 Get department wise maximum salary from employee table order by salary ascending

SELECT DISTINCT DepartmentID,  dept_max_sal=(MAX(Salary) 
OVER( PARTITION BY DepartmentID)) FROM Employee AS temp
ORDER BY dept_max_sal ASC

--Q6 Get department wise minimum salary from employee table order by salary ascending

SELECT DISTINCT DepartmentID, dept_min_sal=(MIN(Salary) 
OVER( PARTITION BY DepartmentID)) FROM Employee AS temp
ORDER BY dept_min_sal ASC

--Q7 Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending

SELECT * FROM 
(
SELECT DepartmentID, total_dept_sal=(SUM(Salary)) FROM Employee
GROUP BY DepartmentID
) temp
WHERE total_dept_sal>50000
ORDER BY total_dept_sal DESC 
--OR
SELECT * FROM
(
SELECT DISTINCT DepartmentID, total_dept_sal=(SUM(Salary)
OVER ( PARTITION BY DepartmentID)) FROM Employee
) temp
WHERE total_dept_sal>50000
ORDER BY total_dept_sal DESC

--JOIN

--Q1 Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

 SELECT e.Employee_ID, DIFF_IN_MONTHS=CONVERT(VARCHAR(5),DATEDIFF(MM, e.joining_date, i.incentive_date) )+' Months and '+ CONVERT(VARCHAR(5),DATEDIFF(YEAR, e.joining_date, i.incentive_date))+' Years'
  from  EMPOLYEES e join Incentive i
   on e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID

--Q2 Select first_name, incentive amount from employee and incentives table for those employees
--who have incentives and incentive amount greater than 3000

Select e.FIRST_NAME, i.INCENTIVE_AMOUNT FROM EMPOLYEES e JOIN Incentive i
ON e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID
WHERE INCENTIVE_AMOUNT>3000

--Q3 Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.

Select e.FIRST_NAME, i.INCENTIVE_AMOUNT FROM EMPOLYEES e LEFT OUTER JOIN Incentive i
ON e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID

--Q4 Select EmployeeName, ManagerName from the employee table.

SELECT Employee=e.FIRST_NAME , Manager= m.fIRST_NAME FROM EMPOLYEES e LEFT OUTER JOIN EMPOLYEES m
ON e.MANAGER_ID=m.EMPLOYEE_ID

--Q5 Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and
--set incentive amount as 0 for those employees who didn’t get incentives.

SELECT e.FIRST_NAME, ISNULL(i.INCENTIVE_AMOUNT,0) FROM EMPOLYEES  e LEFT OUTER JOIN Incentive i 
ON e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID  



--CTE EXAMPLES



--Q1 Write a query to rank employees based on their salary for a month
WITH CT(FirstName,LastName,salary,RANK)
AS
(SELECT FirstName,LastName , Salary, RANK()
OVER (ORDER BY Salary) 'Salary Ranking' FROM Employee )
SELECT *FROM CT


--Q2 Select 4th Highest salary from employee table using ranking function
SELECT * FROM (
SELECT FirstName+' '+LastName 'Name', Salary, Sal_Rank = RANK() 
OVER (ORDER BY Salary DESC) FROM Employee
) temp
WHERE Sal_Rank=4

--Q3 Get department, total salary with respect to a department from employee table.
WITH CTE(DepartmentID,Total_salary)
AS(
SELECT DepartmentID, Total_Salary=SUM(Salary) from Employee
GROUP BY DepartmentID )
SELECT *FROM CTE

--Q4 Get department, total salary with respect to a department from employee table order by total salary descending
WITH totalsalary(DeptID,Salary)
AS
(SELECT DepartmentID,SUM(Salary) AS totalsalary
from Employee 
GROUP BY DepartmentID
)
SELECT *FROM totalsalary ORDER BY Salary DESC

--Q5 Get department wise maximum salary from employee table order by salary ascending
WITH asending (DepartmentID,Salary)
AS
(SELECT DISTINCT DepartmentID,(MAX(Salary) 
OVER( PARTITION BY DepartmentID)) FROM Employee )
SELECT*FROM asending ORDER BY Salary ASC

--Q6 Get department wise minimum salary from employee table order by salary ascending
WITH CTE(DepartmentID,MINSalary)
AS(
SELECT DISTINCT DepartmentID, (MIN(Salary) 
OVER( PARTITION BY DepartmentID)) FROM Employee) 
SELECT*FROM CTE ORDER BY MINSalary ASC

--Q7 Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending
WITH CTE(DepartmentID,salary)
AS(
SELECT * FROM 
(
SELECT DepartmentID,salary= (SUM(Salary)) FROM Employee
GROUP BY DepartmentID
WHERE salary>50000)
SELECT * FROM CTE ORDER BY salary DESC
--OR
SELECT * FROM
(
SELECT DISTINCT DepartmentID, total_dept_sal=(SUM(Salary)
OVER ( PARTITION BY DepartmentID)) FROM Employee
) temp
WHERE total_dept_sal>50000
ORDER BY total_dept_sal DESC

--JOIN

--Q1 Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
WITH CTE(Employee_ID,DIFF_IN_MONTHS)
AS
 (SELECT e.Employee_ID, DIFF_IN_MONTHS=CONVERT(VARCHAR(5),DATEDIFF(MM, e.joining_date, i.incentive_date) )+' Months and '+ CONVERT(VARCHAR(5),DATEDIFF(YEAR, e.joining_date, i.incentive_date))+' Years'
  from  EMPOLYEES e join Incentive i
   on e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID)
   SELECT*FROM CTE

--Q2 Select first_name, incentive amount from employee and incentives table for those employees
--who have incentives and incentive amount greater than 3000
WITH CTE(FIRST_NAME,INCENTIVE_AMOUNT)
AS(
Select e.FIRST_NAME, i.INCENTIVE_AMOUNT FROM EMPOLYEES e JOIN Incentive i
ON e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID
WHERE INCENTIVE_AMOUNT>3000)
SELECT*FROM CTE

--Q3 Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.
WITH CTE(FIRST_NAME,INCENTIVE_AMOUNT)
AS(
Select e.FIRST_NAME, i.INCENTIVE_AMOUNT FROM EMPOLYEES e LEFT OUTER JOIN Incentive i
ON e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID)
SELECT*FROM CTE

--Q4 Select EmployeeName, ManagerName from the employee table.
WITH CT(FIRST_NAME,MANAGER)
AS
(SELECT Employee=e.FIRST_NAME , Manager= m.fIRST_NAME FROM EMPOLYEES e LEFT OUTER JOIN EMPOLYEES m
ON e.MANAGER_ID=m.EMPLOYEE_ID)
SELECT*FROM CT

--Q5 Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and
--set incentive amount as 0 for those employees who didn’t get incentives.
WITH RESULT ( FIRST_NAME,INCENTIVE_AMOUNT)
AS(
SELECT e.FIRST_NAME, ISNULL(i.INCENTIVE_AMOUNT,0) FROM EMPOLYEES  e LEFT OUTER JOIN Incentive i 
ON e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID)
SELECT *FROM RESULT

