/*
1.Select employee details from employee table if data exists in incentive table ?
*/
SELECT * FROM EmpTable 
WHERE EMPLOYEE_ID IN (SELECT EMPLOYEE_REF_ID FROM Incentives)

/*
2.Find Salary of the employee whose salary is more than Roy Salary
*/
SELECT FIRST_NAME,SALARY FROM EmpTable 
WHERE SALARY > (SELECT SALARY FROM EmpTable WHERE FIRST_NAME = 'ROY')


/*
3.Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount
*/

CREATE VIEW EmpData
AS
SELECT E.FIRST_NAME,E.LAST_NAME,E.SALARY,E.JOINING_DATE,I.INCENTIVE_DATE,I.INCENTINVE_AMOUNT
FROM EmpTable E JOIN Incentives I 
ON E.EMPLOYEE_ID=I.EMPLOYEE_REF_ID



SELECT FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,INCENTIVE_DATE,INCENTINVE_AMOUNT FROM EmpData


/*
4.Create a view to select Select first_name, incentive amount from employee and incentives table for 
those employees who have incentives and incentive amount greater than 3000
*/

CREATE VIEW EmpData1
AS
SELECT E.FIRST_NAME,I.INCENTINVE_AMOUNT FROM EmpTable AS E JOIN Incentives AS I
ON E.EMPLOYEE_ID = I.EMPLOYEE_REF_ID 
WHERE I.INCENTINVE_AMOUNT>3000

SELECT * FROM EmpData1


/*
5.Create a View to Find the names (first_name, last_name), job, department number, and department name 
of the employees who work in London
*/
CREATE VIEW EmpData2
AS
SELECT e.firstname, e.LastName, e.jobid, e.departmentid, d.departmentname 
FROM employees e 
JOIN departments d 
ON (e.departmentid = d.departmentid) 
JOIN locations l ON 
(d.locationid = l.locationid) 
WHERE city = 'London';

SELECT * FROM EmpData2


/*
6.Create a View to get the department name and number of employees in the department.
*/
CREATE VIEW EmpData3
AS
SELECT d.DepartmentName,'TotalEmployees'=COUNT(*) 
FROM Departments as d
join Employees as e
on e.DepartmentID = d.DepartmentID
GROUP BY d.departmentid, departmentname 


SELECT * FROM EmpData3


/*
7.Find the employee ID, job title, number of days between ending date and starting date for all jobs 
in department 90 from job history.
*/

SELECT EmployeeID,JobId,DATEDIFF(dd,StartDate,EndDate) AS [Days] From JobHistory 
WHERE DepartmentID=90


/*
8.Write a View to display the department name, manager name, and city.
*/
CREATE VIEW EmpData4
AS
SELECT D.DepartmentName,E.FirstName,E.LastName,L.City
FROM
Departments AS D JOIN Employees AS E
ON D.ManagerID=E.ManagerID
JOIN Locations AS L
ON D.LocationID = L.LocationID


/*
9.Create a View to display department name, name (first_name, last_name), hire date, salary of the manager 
for all managers whose experience is more than 15 years.
*/
CREATE VIEW EmpData5
AS
SELECT E.FirstName,E.LastName,D.DepartmentName,E.HireDate,E.Salary 
FROM Employees AS E JOIN Departments AS D
ON E.EmployeeID = D.ManagerID
WHERE DATEDIFF(yy,HireDate,GETDATE()) > 15

