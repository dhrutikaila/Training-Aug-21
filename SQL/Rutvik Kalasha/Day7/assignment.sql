
--Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount
CREATE VIEW View1 AS
    SELECT FirstName,E.LastName,E.Salary,E.HireDate,I.Incentive_Date,I.Incentive_Amount
    FROM Employees AS E 
    JOIN Incentives AS I
    ON E.EmployeeID = I.EMPLOYEE_REF_ID;

--Create a view to select Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000.
CREATE view View2 AS
    SELECT FirstName,Incentive_Amount 
    FROM Employees AS E 
    JOIN Incentives AS I
    ON E.EmployeeID = I.EMPLOYEE_REF_ID 
    AND I.INCENTIVE_AMOUNT > 3000

--Create a View to get the department name and number of employees in the department.
CREATE view View3
    AS SELECT DISTINCT(d.DepartmentName),count(e.EmployeeID) AS TOTALEMP
    FROM Departments AS d 
    JOIN Employees AS e
    ON d.DepartmentID = e.DepartmentID
    GROUP BY DepartmentName

--Write a View to display the department name, manager name, and city.
CREATE View view5
    AS SELECT DepartmentName, concat(FirstName,LastName) AS NAME ,City
    FROM Departments AS d
    JOIN Employees AS e
    ON d.ManagerID = e.EmployeeID
    JOIN Locations AS l
    ON d.LocationID = l.LocationID

--Create a View to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.
CREATE VIEW view6
    AS SELECT DepartmentName,concat(FirstName,' ',LastName) AS NAME,HireDate ,Salary,DATEDIFF(year,HireDate,getdate()) AS experience
    FROM Employees AS e
    join Departments AS d
    on d.ManagerID = e.EmployeeID AND DATEDIFF(year,e.HireDate,getdate()) > 15