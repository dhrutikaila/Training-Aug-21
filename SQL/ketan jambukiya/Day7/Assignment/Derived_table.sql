USE Ketan

----- DERIVED TABLE

---- Using Day 4  Assignment

---1.Write a query to rank employees based on their salary for a month 
  
  SELECT * FROM(SELECT DENSE_RANK() OVER(ORDER BY Salary ) [drank], Salary
  FROM Employees)tmp

---2.SELECT 4th Highest salary FROM employee table using ranking function

  SELECT * FROM(SELECT * FROM(SELECT DENSE_RANK() 
  OVER (ORDER BY Salary DESC) AS [drank], Salary
  FROM Employees)tmp WHERE(drank=4))tmp

---3.Get department, total salary with respect to a department FROM employee table.

  SELECT * FROM(SELECT DepartmentId, SUM(Salary) AS salary
  FROM employees 
  GROUP BY DepartmentId )tmp

---4. Get department, total salary with respect to a department FROM employee table ORDER BY total salary descending

  SELECT * FROM(SELECT DepartmentId, SUM(Salary) AS salary
FROM employees 
GROUP BY DepartmentId )tmp ORDER BY salary DESC

---5.Get department wise maximum salary FROM employee table ORDER BY salary ascending

   SELECT * FROM(SELECT DepartmentId, MAX(Salary) AS salary
FROM employees 
GROUP BY DepartmentId
)tmp  ORDER BY Salary 

---6.Get department wise minimum salary FROM employee table ORDER BY salary ascending4

   SELECT * FROM(SELECT DepartmentId, MIN(Salary) AS salary
FROM employees 
GROUP BY DepartmentId 
)tmp  ORDER BY Salary

---7.SELECT department, total salary with respect to a department FROM employee table WHERE total salary greater than 50000 ORDER BY TotalSalary descending

  SELECT * FROM(SELECT DepartmentId, SUM(Salary) AS salary
FROM employees 
GROUP BY DepartmentId 
HAVING sum(salary)>50000 )tmp ORDER BY salary DESC  


USE JOIN

------ Using Day 5 join Assignment


---1.Get difference between JOINING_DATE and INCENTIVE_DATE FROM employee and incentives table

  SELECT * FROM
  (SELECT DATEDIFF(MONTH,emp.JOINING_DATE,inc.INCENTIVE_DATE ) AS DIFFINMONTH 
  FROM Employee emp INNER JOIN Incentives inc 
  ON inc.EMPLOYEE_REF_ID=emp.EMPLOYEE_ID
  )tmp   

---2.SELECT first_name, incentive amount FROM employee and incentives table for those employees who have incentives and incentive amount greater than 3000

 SELECT * FROM
 (SELECT e.FIRST_NAME AS firstname,i.INCENTIVE_AMOUNT AS incentiveamount 
 FROM Employee e INNER JOIN  Incentives i 
ON i.EMPLOYEE_REF_ID=e.EMPLOYEE_ID  
 WHERE i.INCENTIVE_AMOUNT>3000)tmp  
 
---3.SELECT first_name, incentive amount FROM employee and incentives table for all employees even if they didn’t get incentives.

 SELECT * FROM
 (SELECT e.FIRST_NAME AS firstname,i.INCENTIVE_AMOUNT AS incentiveamount 
 FROM Employee e LEFT JOIN Incentives i 
 ON i.EMPLOYEE_REF_ID=e.EMPLOYEE_ID )tmp    

---4.SELECT EmployeeName, ManagerName FROM the employee table.

 SELECT * FROM
 (SELECT emp.FIRST_NAME AS 'name',mgr.FIRST_NAME AS 'managername' 
 FROM Employee mgr JOIN Employee emp 
 ON mgr.EMPLOYEE_ID=emp.MANAGER_ID)tmp   

---5.SELECT first_name, incentive amount FROM employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.

  SELECT * FROM
  (SELECT e.FIRST_NAME AS firstname,ISNULL(i.INCENTIVE_AMOUNT,0) AS incentiveamount 
  FROM Employee e LEFT JOIN Incentives i 
 ON i.EMPLOYEE_REF_ID=e.EMPLOYEE_ID )tmp   