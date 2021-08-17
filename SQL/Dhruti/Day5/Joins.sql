use dhruti
--Q1 Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
Select FIRST_NAME, JOINING_DATE from EMPOLYEE a inner join Incentives B on A.EMPLOYEE_ID = B.EMPLOYEE_REF_ID

--Q2 Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
Select FIRST_NAME,INCENTIVE_AMOUNT from EMPOLYEE a inner join Incentives B on A.EMPLOYEE_ID = B.EMPLOYEE_REF_ID and INCENTIVE_AMOUNT > 3000

--Q3 Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.
Select FIRST_NAME,INCENTIVE_AMOUNT from EMPOLYEE a left join Incentives B on A.EMPLOYEE_ID = B.EMPLOYEE_REF_ID

--Q4 Select EmployeeName, ManagerName from the employee table.
SELECT e.FIRST_NAME, m.LAST_NAME AS manager_name
FROM EMPOLYEE e
JOIN EMPOLYEE m on e.manager_id = m.employee_id

--Q5 Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.
Select FIRST_NAME, ISNULL(INCENTIVE_AMOUNT,0) from EMPOLYEE a left join Incentives B on A.EMPLOYEE_ID = B.EMPLOYEE_REF_ID
