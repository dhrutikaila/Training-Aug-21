/*
1.Get difference between JOINING_DATE and INCENTIVE_DATE FROM employee and incentives TABLE
*/

SELECT E.EMPLOYEE_ID ,DATEDIFF(dd,E.JOINING_DATE,I.INCENTIVE_DATE) [DIFF]FROM EmpTABLE E JOIN Incentives I 
on E.EMPLOYEE_ID = I.EMPLOYEE_REF_ID

/*
2.SELECT first_name, incentive amount FROM employee and incentives TABLE for those employees who have 
incentives and incentive amount greater than 3000
*/
SELECT E.FIRST_NAME,I.INCENTINVE_AMOUNT FROM EmpTABLE E JOIN Incentives I 
on E.EMPLOYEE_ID = I.EMPLOYEE_REF_ID WHERE INCENTINVE_AMOUNT>3000

/*
3.SELECT first_name, incentive amount FROM employee and incentives TABLE for all employees even if they
didn’t get incentives.
*/
SELECT E.EMPLOYEE_ID,E.FIRST_NAME,I.INCENTINVE_AMOUNT FROM EmpTABLE E LEFT JOIN Incentives I 
on E.EMPLOYEE_ID = I.EMPLOYEE_REF_ID


/*
4.SELECT EmployeeName, ManagerName FROM the employee TABLE.
*/

SELECT E.FIRST_NAME [EMPLOYEE],M.FIRST_NAME [MANAGER] FROM EmpTABLE E JOIN EMPTABLE M ON E.MANAGER_ID = M.EMPLOYEE_ID

/*
5.SELECT first_name, incentive amount FROM employee and incentives TABLE for all employees even if they didn’t get incentives and set incentive 
amount as 0 for those employees who didn’t get incentives.
*/
SELECT E.FIRST_NAME,ISNULL(I.INCENTIVE_AMOUNT,0) [INCENTIVE] FROM EmpTABLE E LEFT JOIN INCENTIVES I  ON E.EMPLOYEE_ID = I.EMPLOYEE_REF_ID



