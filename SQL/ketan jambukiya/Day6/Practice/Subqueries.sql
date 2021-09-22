USE JOIN

---- Subqueries (Use Of Day 5 Join Assignment)


---1.Get difference between JOINING_DATE and INCENTIVE_DATE FROM employee and incentives table

SELECT DATEDIFF(DAY,JOINING_DATE,
(SELECT INCENTIVE_DATE FROM Incentives WHERE EMPLOYEE_REF_ID=e.EMPLOYEE_ID)) AS DATEDIFFERENCE
FROM Employee e

---2.SELECT first_name, incentive amount FROM employee and incentives table for those employees who have incentives and incentive amount greater than 3000

SELECT * FROM (SELECT e.FIRST_NAME,
(SELECT INCENTIVE_AMOUNT FROM Incentives WHERE EMPLOYEE_REF_ID=e.EMPLOYEE_ID) AS [amount]
FROM Employee e )TEMP 
WHERE amount>3000

-- OR

    SELECT e.FIRST_NAME,i.INCENTIVE_AMOUNT FROM Employee e,Incentives i 
	WHERE e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID  AND i.INCENTIVE_AMOUNT>3000

---3.SELECT first_name, incentive amount FROM employee and incentives table for all employees even if they didn’t get incentives.

 SELECT First_Name,
(SELECT INCENTIVE_AMOUNT FROM Incentives WHERE EMPLOYEE_REF_ID=e.EMPLOYEE_ID) AS amount
FROM Employee e 

---4.SELECT EmployeeName, ManagerName FROM the employee table

    SELECT emp.FIRST_NAME AS EmployeeName, mgr.FIRST_NAME AS ManagerName
    FROM Employee mgr,Employee emp  WHERE mgr.EMPLOYEE_ID=emp.MANAGER_ID

----OR

    SELECT * FROM(SELECT emp.FIRST_NAME AS 'EmployeeName',
    (SELECT FIRST_NAME  FROM Employee WHERE EMPLOYEE_ID=emp.MANAGER_ID) AS managerName
    FROM Employee emp)TEMP

---5.SELECT first_name, incentive amount FROM employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.

   SELECT First_Name,isnull(
   (SELECT INCENTIVE_AMOUNT FROM Incentives WHERE EMPLOYEE_REF_ID=e.EMPLOYEE_ID),0) AS amount
   FROM Employee e 
