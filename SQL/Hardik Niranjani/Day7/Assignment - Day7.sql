--CTE Assignment

--DAY 4

--(1)--
--Write a query to rank employees based on their salary for a month

WITH TEMP(first_name, Salary,SalaryRank)
AS
(	
		SELECT FirstName, Salary,
		DENSE_RANK() OVER(ORDER BY Salary DESC) AS SalaryRank FROM Employees
)

SELECT first_name, Salary FROM TEMP


--(2)--
--Select 4th Highest salary from employee table using ranking function

WITH Result(Salary,Salary_rank)
AS
(
	SELECT Salary, DENSE_RANK() OVER(ORDER BY Salary DESC) AS Salary_rank FROM Employees
)

SELECT TOP 1 Salary FROM Result WHERE Salary_rank=4


--(3)--
--Get department, total salary with respect to a department from employee table.

WITH TEMP(DepartmentID, Salary)
AS
(		
		SELECT DepartmentID, SUM(Salary) AS TotalSalary 
		FROM Employees GROUP BY DepartmentID
)

SELECT * FROM TEMP

--(4)--
--Get department, total salary with respect to a department 
--from employee table order by total salary descending

WITH TEMP(DepartmentID, Salary)
AS
(
		SELECT DepartmentID, SUM(Salary) AS TotalSalary 
		FROM Employees GROUP BY DepartmentID 
)

SELECT * FROM TEMP ORDER BY Salary DESC

--(5)--
--Get department wise maximum salary from employee table order by salary ascending

WITH TEMP(DepartmentID, MaxSalary)
AS
(
		SELECT DepartmentID, MAX(Salary) AS MaxSalary
		FROM Employees GROUP BY DepartmentID 
)

SELECT * FROM TEMP ORDER BY MaxSalary ASC



--(6)--
--Get department wise minimum salary from employee table order by salary ascending

WITH TEMP(DepartmentID, MinSalary)
AS
(
		SELECT DepartmentID, MIN(Salary) AS MinSalary 
		FROM Employees GROUP BY DepartmentID 
)

SELECT * FROM TEMP ORDER BY MinSalary ASC


--(7)--
--Select department, total salary with respect to a department from employee table 
--where total salary greater than 50000 order by TotalSalary descending

WITH TEMP(DepartmentID, TotalSalary)
AS
(
		SELECT DepartmentID, SUM(Salary) AS TotalSalary 
		FROM Employees GROUP BY DepartmentID  
		HAVING SUM(Salary)>50000 
)

SELECT * FROM TEMP ORDER BY TotalSalary DESC 


----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------



--DAY 5 

--(1)--
--Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

WITH TEMP(Joining_Date, Incentive_Date )
AS
(
	SELECT e.JOINING_DATE,i.INCENTIVE_DATE FROM Employee AS e
	JOIN  Incentives AS i
	ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID
)

Select * from TEMP


------------------------------------------------------------------------------------------------------------------


--(2)--
--Select first_name, incentive amount from employee and incentives table for those employees 
--who have incentives and incentive amount greater than 3000

WITH Temp1(First_Name, Incentive_Amount)
AS
(
		SELECT e.FIRST_NAME,i.INCENTIVE_AMOUNT FROM Employee as e
		Inner Join Incentives as i 
		ON e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID 
		WHERE I.INCENTIVE_AMOUNT>3000
)

Select * from Temp1




-------------------------------------------------------------------------------------------------------------------


--(3)--
--Select first_name, incentive amount from employee and 
--incentives table for all employees even if they didn’t get incentives.

WITH Temp(First_Name,Incentive)		
AS
(
		SELECT e.FIRST_NAME, i.INCENTIVE_AMOUNT FROM Employee as e
		Left Outer Join Incentives as i
		ON e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID
)

Select * from Temp


-------------------------------------------------------------------------------------------------------------------

--(4)--
--Select EmployeeName, ManagerName from the employee table.

WITH TEMP(EmployeeName, ManagerName)
AS
(		
		SELECT b.FIRST_NAME as Employee,e.FIRST_NAME as Manager  FROM Employee as e
		 join Employee as b
		 on e.EMPLOYEE_ID = b.MANAGER_ID
)

SELECT * FROM TEMP


-------------------------------------------------------------------------------------------------------------------


--(5)--
--Select first_name, incentive amount from employee and incentives table for all employees even if 
--they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.

WITH TEMP(first_name, incentive_amount)
AS
(			
			SELECT e.FIRST_NAME, ISNULL(i.INCENTIVE_AMOUNT, 0) FROM Employee as e
			Left Join Incentives as i
			ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID
)

SELECT * FROM TEMP



--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--Derived Tables Assignment

--+++++++ DAY4 +++++++++

--(1)--
--Write a query to rank employees based on their salary for a month

SELECT FIRST_NAME, SALARY FROM 
			(SELECT DENSE_RANK() OVER(ORDER BY Salary DESC) AS SalaryRank,* 
				FROM Employee) TEMP


--(2)--
--Select 4th Highest salary from employee table using ranking function

SELECT DISTINCT Salary FROM 
			(SELECT Salary, DENSE_RANK() OVER(ORDER BY Salary DESC) AS Salary_rank FROM Employees) AS TEMP 
			WHERE Salary_rank=4


--(3)--
--Get department, total salary with respect to a department from employee table.

SELECT DepartmentID, SUM(Salary) AS TotalSalary 
		FROM ( SELECT * FROM Employees) TEMP 
		GROUP BY DepartmentID

--(4)--
--Get department, total salary with respect to a department 
--from employee table order by total salary descending


SELECT DepartmentID, SUM(Salary) AS TotalSalary 
		FROM (SELECT * FROM Employees) TEMP 
		GROUP BY DepartmentID 
		ORDER BY TotalSalary DESC


--(5)--
--Get department wise maximum salary from employee table order by salary ascending

SELECT DepartmentID, MAX(Salary) AS MaxSalary
	FROM (SELECT * FROM Employees) TEMP
	GROUP BY DepartmentID 
	ORDER BY MaxSalary ASC




--(6)--
--Get department wise minimum salary from employee table order by salary ascending

SELECT DepartmentID, MIN(Salary) AS MinSalary 
		FROM (SELECT * FROM Employees) TEMP 
		GROUP BY DepartmentID 
		ORDER BY MinSalary ASC



--(7)--
--Select department, total salary with respect to a department from employee table 
--where total salary greater than 50000 order by TotalSalary descending

SELECT DepartmentID, SUM(Salary) AS TotalSalary 
		FROM (SELECT * FROM Employees) TEMP 
		GROUP BY DepartmentID  
		HAVING SUM(Salary)>50000 
		ORDER BY TotalSalary DESC 


------------------------------------------------------------------------------------------------------------
--+++++++ DAY5 +++++++++

--(1)--
--Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

	SELECT (e.JOINING_DATE - i.INCENTIVE_DATE) AS [Date_Difference] 
		FROM (SELECT JOINING_DATE,EMPLOYEE_ID FROM Employee) AS e
		JOIN  (SELECT EMPLOYEE_REF_ID,INCENTIVE_DATE FROM Incentives) AS i
		ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID




--(2)--
--Select first_name, incentive amount from employee and incentives table for those employees 
--who have incentives and incentive amount greater than 3000

SELECT DISTINCT e.FIRST_NAME,i.INCENTIVE_AMOUNT 
		FROM (SELECT FIRST_NAME,EMPLOYEE_ID FROM Employee) AS e
		Inner Join (SELECT EMPLOYEE_REF_ID,INCENTIVE_AMOUNT FROM Incentives) AS i 
		ON e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID 
		WHERE I.INCENTIVE_AMOUNT>3000



--(3)--
--Select first_name, incentive amount from employee and 
--incentives table for all employees even if they didn’t get incentives.

SELECT  DISTINCT e.FIRST_NAME, i.INCENTIVE_AMOUNT 
		FROM (SELECT FIRST_NAME,EMPLOYEE_ID FROM Employee) AS e
		Left Outer Join (SELECT EMPLOYEE_REF_ID,INCENTIVE_AMOUNT FROM Incentives) AS i 
		ON e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID





--(4)--
--Select EmployeeName, ManagerName from the employee table.

SELECT DISTINCT b.FIRST_NAME AS Employee, e.FIRST_NAME AS Manager  
		 FROM (SELECT FIRST_NAME,EMPLOYEE_ID FROM Employee) AS e
		 join (SELECT FIRST_NAME,MANAGER_ID FROM Employee) AS b
		 on e.EMPLOYEE_ID = b.MANAGER_ID




--(5)--
--Select first_name, incentive amount from employee and incentives table for all employees even if 
--they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.

SELECT  DISTINCT e.FIRST_NAME, ISNULL(i.INCENTIVE_AMOUNT, 0) AS [INCENTIVE_AMOUNT] 
			FROM (SELECT FIRST_NAME,EMPLOYEE_ID FROM Employee) AS e
			Left Join (SELECT EMPLOYEE_REF_ID,INCENTIVE_AMOUNT FROM Incentives) AS i 
			ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID

