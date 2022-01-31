/*1)Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table*/

SELECT e.EMPLOYEE_ID, e.JOINING_DATE, i.INCENTIVE_DATE, DATEDIFF(i.INCENTIVE_DATE,e.JOINING_DATE) AS Difference FROM employee e 
INNER JOIN incentives i 
ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID;

/*2)Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000*/ 
SELECT e.FIRST_NAME,I.INCENTIVE_AMOUNT FROM employee e INNER JOIN incentives i ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID AND i.INCENTIVE_AMOUNT > 3000;

/*3)Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.*/

SELECT e.FIRST_NAME,i.INCENTIVE_AMOUNT FROM employee e 
LEFT JOIN incentives i 
ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID;

/*4)Select EmployeeName, ManagerName from the employee table.*/

SELECT e1.EMPLOYEE_ID, CONCAT(e1.FIRST_NAME," ",e1.LAST_NAME) AS EmployeeName, CONCAT(e2.FIRST_NAME," ",e2.LAST_NAME) AS ManagerName FROM employee e1 JOIN employee e2 ON e1.MANAGER_ID = e2.EMPLOYEE_ID;

/*5)Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.*/ 

SELECT e.FIRST_NAME, IFNULL(i.INCENTIVE_AMOUNT,0) FROM employee e LEFT JOIN incentives i ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID;




