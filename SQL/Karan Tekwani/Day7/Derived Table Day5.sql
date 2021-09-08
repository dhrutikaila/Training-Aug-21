use day5
-- Day 5 Exercise with CTE --

-- 1. Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
SELECT EMPLOYEE_ID,diffendence FROM
(SELECT e.EMPLOYEE_ID,DATEDIFF(DAY,e.Joining_Date,i.Incentive_Date)  'diffendence'
	FROM Employee e JOIN Incentives i 
ON e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID  )DateDiff


-- 2. Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
SELECT First_Name, FilterEmply.Incentive_Amount
FROM Employee 
INNER JOIN
(SELECT Incentive_Amount,EMPLOYEE_REF_ID
	FROM  Incentives) AS FilterEmply
ON FilterEmply.EMPLOYEE_REF_ID = EMPLOYEE_ID


-- 3. Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.
SELECT First_Name, SUM(GetEmply.Incentive_Amount) 'IAmount' FROM Employee
LEFT OUTER JOIN
(SELECT Incentive_Amount,EMPLOYEE_REF_ID  FROM Incentives ) AS GetEmply
ON EMPLOYEE_ID =GetEmply.EMPLOYEE_REF_ID
GROUP BY First_Name,Last_Name


-- 4. Select EmployeeName, ManagerName from the employee table.
SELECT Employee.FIRST_NAME 'EmpFname', Manager_Employee.FIRST_NAME 'FIRST_NAME'
FROM Employee INNER JOIN
(SELECT EMPLOYEE_ID,First_Name  FROM Employee ) AS Manager_Employee
ON  MANAGER_ID =Manager_Employee.EMPLOYEE_ID


-- 5. Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.
SELECT First_Name ,ISNULL(EmployeeIncentive.Incentive_Amount,0)
FROM Employee LEFT JOIN
(SELECT EMPLOYEE_REF_ID,Incentive_Amount  FROM Incentives ) AS EmployeeIncentive
ON  EMPLOYEE_ID = EmployeeIncentive.EMPLOYEE_REF_ID

