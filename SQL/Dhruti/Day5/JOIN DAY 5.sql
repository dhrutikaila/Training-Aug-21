use dhruti

--Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
SELECT DATEDIFF(year,e.JOINING_DATE,i.INCENTIVE_DATE) FROM EMPOLYEE e JOIN 
incentives i ON e.EMPLOYEE_ID = i.employe_id

--Select first_name, incentive amount from employee and incentives table for those employees
--who have incentives and incentive amount greater than 3000
SELECT e.FIRST_NAME,i.incentive_amount FROM EMPOLYEE e JOIN incentives i 
ON e.EMPLOYEE_ID = i.employe_id WHERE i.INCENTIVE_AMOUNT > 3000 AND e.incentive_amount > 3000

--Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.
SELECT e.first_name,i.incentive_amount FROM EMPOLYEE e RIGHT JOIN incentives i ON e.EMPLOYEE_ID = i.employeee_id

--Select EmployeeName, ManagerName from the employee table.
SELECT e.FIRST_NAME,i.ManagerName FROM EMPOLYEE e  JOIN EMPOLYEE i ON e.EMPLOYEE_ID = i.manager_id

--Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and
--set incentive amount as 0 for those employees who didn’t get incentives.
SELECT e.first_name,i.incentive_amount FROM EMPOLYEE e RIGHT JOIN incentives i ON e.EMPLOYEE_ID = i.employeee_id
WHERE i.incentive_amount = 0
