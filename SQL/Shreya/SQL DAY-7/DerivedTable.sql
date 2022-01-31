---1.Write a query to rank employees based on their salary for a month 

  SELECT * FROM(SELECT RANK() OVER (ORDER BY salary desc) as rank, 
(FirstName + ' '+ LastName) AS Employeename,Salary
from Employees )tmp

---2.SELECT 4th Highest salary FROM employee table using ranking function

SELECT * FROM(SELECT * FROM (SELECT DENSE_RANK() OVER (ORDER BY salary desc) 
as drank,Salary,JobId
from Employees) tmp WHERE drank=4)tmp

---3.Get department, total salary with respect to a department FROM employee table.

  SELECT * FROM(SELECT DepartmentID , SUM(Salary) as totalsalary
FROM Employees
GROUP BY DepartmentID )tmp

---4. Get department, total salary with respect to a department FROM employee table ORDER BY total salary descending

  SELECT * FROM(SELECT  DepartmentID , SUM(Salary) as totalsalary
FROM Employees
GROUP BY DepartmentID)tmp ORDER BY totalsalary DESC

---5.Get department wise maximum salary FROM employee table ORDER BY salary ascending

SELECT * FROM (SELECT DepartmentID , MAX(Salary) as maxsalary
FROM Employees
GROUP BY DepartmentID 
)tmp  ORDER BY maxsalary 

---6.Get department wise minimum salary FROM employee table ORDER BY salary ascending4

   SELECT * FROM(SELECT DepartmentID , MIN(Salary) as minsalary
FROM Employees
GROUP BY DepartmentID  
)tmp  ORDER BY minsalary

---7.SELECT department, total salary with respect to a department FROM employee table WHERE total salary greater than 50000 ORDER BY TotalSalary descending

SELECT * FROM(SELECT DepartmentID , SUM(Salary) as TOTALSALARY
FROM Employees WHERE Salary>50000
GROUP BY DepartmentID )tmp ORDER BY TOTALSALARY DESC  


USE [Day-5]

------ Using Day 5 join Assignment


---1.Get difference between JOINING_DATE and INCENTIVE_DATE FROM employee and incentives table

  SELECT * FROM
  (SELECT e.FIRST_NAME,e.LAST_NAME,DATEDIFF(DAYOFYEAR,e.JOINING_DATE,i.INCENTIVE_DATE)
		FROM Employee AS e JOIN Incentive as i
		ON e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID 
  )tmp      

---2.SELECT first_name, incentive amount FROM employee and incentives table for those employees who have incentives and incentive amount greater than 3000

 SELECT * FROM
 (SELECT e.FIRST_NAME,i.INCENTIVE_AMOUNT
 FROM Employee AS e JOIN Incentive AS i 
 ON e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID
 WHERE (i.INCENTIVE_AMOUNT) > 3000 )tmp  

---3.SELECT first_name, incentive amount FROM employee and incentives table for all employees even if they didn’t get incentives.

 SELECT * FROM
 (SELECT e.FIRST_NAME,i.INCENTIVE_AMOUNT 
FROM Employee AS e LEFT JOIN Incentive AS i
ON e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID)tmp    

---4.SELECT EmployeeName, ManagerName FROM the employee table.

 SELECT * FROM
 (SELECT  e.FIRST_NAME AS 'Employee Name',m.FIRST_NAME AS 'Manager Name'
FROM Employee e LEFT JOIN Employee AS m
ON e.MANAGER_ID = m.EMPLOYEE_ID)tmp   

---5.SELECT first_name, incentive amount FROM employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.

	  SELECT * FROM
(SELECT e.FIRST_NAME,ISNULL(i.INCENTIVE_AMOUNT,0)
FROM Employee AS e LEFT JOIN Incentive AS i
ON e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID)tmp    

