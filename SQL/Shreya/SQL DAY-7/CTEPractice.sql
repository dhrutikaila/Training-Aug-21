--1
use [Day-2]
WITH CT(Rank,EmployeeName,Salary)
AS
(SELECT RANK() OVER (ORDER BY salary desc) as rank, 
(FirstName + ' '+ LastName) AS Employeename,Salary
from Employees )
SELECT *FROM CT 


--2
WITH cte(DRank,Salary,JobId)
AS
(SELECT * FROM (SELECT DENSE_RANK() OVER (ORDER BY salary desc) 
as drank,Salary,JobId
from Employees) tmp WHERE drank=4
 )
SELECT  salary FROM cte


--3
WITH Total_salary(DeptId,Salary)
AS
(SELECT DepartmentID , SUM(Salary) as totalsalary
FROM Employees
GROUP BY DepartmentID
 )
SELECT  * FROM Total_salary where deptId <> 0

--4

WITH Total_salarydes(DeptId,Salary)
AS
(SELECT  DepartmentID , SUM(Salary) as totalsalary
FROM Employees
GROUP BY DepartmentID
 )
SELECT  * FROM Total_salarydes ORDER BY Salary DESC  

--5
WITH max_salary(DeptId,Salary)
AS
(SELECT DepartmentID , MAX(Salary) as maxsalary
FROM Employees
GROUP BY DepartmentID 
 )
SELECT  * FROM max_salary WHERE DeptId <> 0  ORDER BY Salary

--6
WITH min_salary(DeptId,Salary)
AS
(SELECT DepartmentID , MIN(Salary) as maxsalary
FROM Employees
GROUP BY DepartmentID 
 )
SELECT  * FROM min_salary WHERE DeptId <> 0  ORDER BY Salary


--7
WITH sum_salary(DeptId,Salary)
AS
(SELECT DepartmentID , SUM(Salary) as TOTALSALARY
FROM Employees
GROUP BY DepartmentID 
 )
SELECT  * FROM sum_salary where salary > 50000  ORDER BY Salary desc


---for day-5
--1
use [Day-5]

WITH diffdate (Firstname , LastName , Date)
AS
(SELECT e.FIRST_NAME,e.LAST_NAME,DATEDIFF(DAYOFYEAR,e.JOINING_DATE,i.INCENTIVE_DATE)
FROM Employee AS e JOIN Incentive as i
ON e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID )
SELECT Firstname+' '+LastName AS 'Name' FROM diffdate

--2
WITH incentive1(Firstname , Amount )
AS
(SELECT e.FIRST_NAME,i.INCENTIVE_AMOUNT
 FROM Employee AS e JOIN Incentive AS i 
 ON e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID
 WHERE (i.INCENTIVE_AMOUNT) > 3000 )

SELECT * FROM incentive1 

--3

WITH noincentive(Firstname , incentive)
AS
(SELECT e.FIRST_NAME,i.INCENTIVE_AMOUNT 
FROM Employee AS e LEFT JOIN Incentive AS i
ON e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID)

SELECT * FROM noincentive 


--4

WITH mgrname (EmployeeName , ManagerName )
AS
(SELECT  e.FIRST_NAME AS 'Employee Name',m.FIRST_NAME AS 'Manager Name'
FROM Employee e LEFT JOIN Employee AS m
ON e.MANAGER_ID = m.EMPLOYEE_ID)
SELECT * FROM mgrname

--5

WITH cte5 (Name,incentiveamount)

AS
(SELECT e.FIRST_NAME,ISNULL(i.INCENTIVE_AMOUNT,0)
FROM Employee AS e LEFT JOIN Incentive AS i
ON e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID )

SELECT * FROM cte5


