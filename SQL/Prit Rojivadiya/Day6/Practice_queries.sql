use Demo

-- Q1 Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

SELECT i.Emp_Ref_Id, DATEDIFF(DAY,(SELECT e.Joining_Date FROM Employee e WHERE e.Emp_id = i.Emp_Ref_Id),Incentive_Date) FROM Incentive i


-- Q2 Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000

SELECT (SELECT e.First_Name FROM Employee e WHERE e.Emp_id = i.Emp_Ref_Id), i.Incentive_Amount FROM Incentive i
WHERE i.Incentive_Amount > 3000


-- Q3 Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.

SELECT e.First_Name,(SELECT i.Incentive_Amount FROM Incentive i WHERE i.Emp_Ref_Id = e.Emp_id) FROM Employee e


-- Q4 Select EmployeeName, ManagerName from the employee table.

SELECT * FROM (
SELECT e.First_Name as 'EmpName',(SELECT m.First_Name FROM Employee m WHERE e.Manager_Id = m.Emp_id) as 'ManagerName' FROM Employee e 
) temp
WHERE ManagerName IS NOT NULL


-- Q5 Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.

SELECT e.First_Name,ISNULL((SELECT i.Incentive_Amount FROM Incentive i WHERE i.Emp_Ref_Id = e.Emp_id),0) FROM Employee e