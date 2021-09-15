
--Q1 Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

 SELECT e.Employee_ID, DIFF_IN_MONTHS=CONVERT(VARCHAR(5),DATEDIFF(MM, e.joining_date, i.incentive_date) )+' Months and '+ CONVERY(VARCHAR(5),DATEDIFF(YEARS, e.joining_date, i.incentive_date))+' Years'
 from EMPOLYEES e join Incentive i
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

SELECT e.FIRST_NAME, ISNULL(i.INCENTIVE_AMOUNT,0) FROM EMPOLYEES e LEFT OUTER JOIN Incentive i
ON e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID
