USE rxweb_day5

--- All Employee Details ---
SELECT * FROM Employee

--- Details of Incentives table ---
SELECT * FROM Incentives


--- Query 1. Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table ---
SELECT e.First_Name,e.Employee_ID,e.Joining_Date,i.Incentive_Date,DATEDIFF(day,e.Joining_Date,i.Incentive_Date) AS DifferenceDate FROM Employee e JOIN Incentives i ON e.Employee_ID = i.Employee_Ref_ID

--- Query 2. Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000 ---
SELECT e.First_Name,i.Incentive_Amount FROM Employee e JOIN Incentives i ON e.Employee_ID = i.Employee_Ref_ID WHERE Incentive_Amount > 3000

--- Query 3. Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives. ---
SELECT e.First_Name,i.Incentive_Amount FROM Employee e LEFT OUTER JOIN Incentives i ON e.Employee_ID = i.Employee_Ref_ID

--- Query 4. Select EmployeeName, ManagerName from the employee table. ---
SELECT emp.First_Name,mgr.First_Name FROM Employee emp,Employee mgr WHERE mgr.Employee_ID = emp.Manager_ID

--- Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives. ---
SELECT e.First_Name,ISNULL(i.Incentive_Amount,0) AS Incentive FROM Employee e LEFT OUTER JOIN Incentives i ON e.Employee_ID=i.Employee_Ref_ID

