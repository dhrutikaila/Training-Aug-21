--Write a query to rank employees based on their salary for a month
WITH Emp(SRank,Salary) AS
(
SELECT RANK() OVER(ORDER BY Salary DESC) AS SRank, Salary 
FROM Employees
)
SELECT * FROM Emp

--Select 4th Highest salary from employee table using ranking function
WiTH Sal(DRANK,Name,Salary) 
AS(
    SELECT DENSE_RANK() OVER(ORDER BY Salary DESC) AS DRANK,FirstName,Salary FROM Employees
)
SELECT * FROM Sal WHERE DRANK=4

--Get department, total salary with respect to a department from employee table.
WITH Emp(ID,TotalSalary)
AS(
SELECT DepartmentID, SUM(Salary) AS TotalSalary 
FROM Employees 
GROUP BY DepartmentID
)
SELECT * FROM Emp

--Get department, total salary with respect to a department from employee table order by total salary descending
WITH Emp(ID,TotalSalary)
AS(
SELECT DepartmentID, SUM(Salary) AS TotalSalary 
FROM Employees 
GROUP BY DepartmentID 
)
SELECT * FROM Emp 
ORDER BY TotalSalary DESC

--Get department wise maximum salary from employee table order by salary ascending
WITH Emp(ID,MAXS)
AS(
     SELECT DepartmentID, MAX(Salary) AS MaxS 
	 FROM Employees 
	 GROUP BY DepartmentID

)
SELECT * FROM Emp 
ORDER BY MaxS ASC

--Get department wise minimum salary from employee table order by salary ascending
WITH Emp(ID,MinS)
AS(
SELECT DepartmentID, MIN(Salary) AS MinS 
FROM Employees 
GROUP BY DepartmentID 
)
SELECT * FROM Emp 
ORDER BY MinS ASC

--Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending
WITH Emp(ID,TotalSalary)
AS(
SELECT DepartmentID, SUM(Salary) AS TotSalary 
FROM Employees 
GROUP BY DepartmentID 
)
SELECT * FROM Emp
WHERE TotalSalary > 50000
ORDER BY TotalSalary DESC

--Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
WITH Emp(Name, Date_Diff)
AS(
    SELECT E.First_name, DATEDIFF(dd,E.Joining_Date,I.Incentive_Date) 'Date_Diff' 
	FROM Employee1 E JOIN Incentives I ON E.Employee_id = I.Employee_ref_id
)
SELECT * FROM Emp
--Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
WITH Emp(Name, Amount)
AS(
    SELECT E.First_name,I.Incentive_amount 
	FROM Employee1 E JOIN Incentives I ON E.Employee_id = I.Employee_ref_id 
 )
SELECT * FROM Emp 
WHERE Amount>3000

--Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.
WITH Emp(Name, Amount)
AS(
SELECT E.First_name,I.Incentive_amount 
FROM Employee1 E LEFT JOIN Incentives I ON  E.Employee_id = I.Employee_ref_id
)
SELECT * FROM Emp 

--Select EmployeeName, ManagerName from the employee table.
WITH Emp(EName, MName)
AS(
    SELECT E.First_name AS EmployeeName,M.FIrst_name AS ManagerName 
	FROM Employee1 E JOIN Employee1 M ON M.Employee_id = E.Manager_id
)
SELECT * FROM Emp 

--Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.
WITH Emp(Name, Amount)
AS(
    SELECT E.First_name,I.Incentive_amount 
	FROM Employee1 E LEFT JOIN Incentives I ON E.Employee_id = I.Employee_ref_id
)
SELECT Name, CASE WHEN Amount IS NULL THEN 0 ELSE Amount END AS IAmount
FROM Emp
