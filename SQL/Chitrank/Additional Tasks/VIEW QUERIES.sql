/*
1.Write a query to find the addresses (location_id, street_address, city, state_province, country_name) 
of all the departments. 
*/
CREATE VIEW EmpData5
AS
SELECT L.LocationID,StreetAddress,City,StateProvince,CountryID,D.DepartmentID From Locations L,Departments D
WHERE L.LocationID=D.LocationID

SELECT * FROM EmpData5

/*
2. Write a query to find the names (first_name, last name), department ID and name of all the employees. 
*/
CREATE VIEW EmpData6
AS
SELECT FirstName,LastName,E.DepartmentID,D.DepartmentName From Employees E,Departments D
WHERE E.DepartmentID = D.DepartmentID

SELECT * FROM EmpData6 order by DepartmentID

/*
3. Find the names (first_name, last_name), job, department number, and department name of the employees 
who work in London. 
*/
CREATE VIEW EmpData7
AS
SELECT FirstName,LastName,JobID,E.DepartmentID,DepartmentName FROM Employees E,Departments D
WHERE E.DepartmentID=D.DepartmentID AND D.DepartmentID IN(
SELECT DepartmentID FROM Departments WHERE LocationID IN(
SELECT LocationID From Locations WHERE City='London'))

SELECT * FROM EmpData7

/*
4. Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name). 
*/
CREATE VIEW EmpData8
AS
SELECT E.EmployeeID,E.LastName,E1.EmployeeID,E1.LastName FROM Employees E
JOIN Employees E1 ON E.ManagerID = E1.EmployeeID

SELECT * FROM EmpData8


/*
5. Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'. 
*/
CREATE VIEW EmpData9
AS
SELECT FirstName,LastName,HireDate From Employees 
WHERE HireDate > (SELECT HireDate From Employees WHERE FirstName = 'Jones' OR LastName = 'Jones')

SELECT * FROM EmpData9


/*
6. Write a query to get the department name and number of employees in the department. 
*/
CREATE VIEW EmpData10
AS
SELECT  DepartmentName,Count(E.DepartmentID) [No. of Employees] FROM Employees E,Departments D
WHERE E.DepartmentID=D.DepartmentID
GROUP BY E.DepartmentID,DepartmentName

SELECT * FROM EmpData10


/*
7. Find the employee ID, job title, number of days between ending date and starting date for all jobs 
in department 90 from job history. 
*/
CREATE VIEW EmpData11
AS
SELECT employeeid, jobID, DATEDIFF(dd,StartDate,EndDate) Days FROM jobhistory 
WHERE departmentid=90;

SELECT * FROM EmpData11


/*
8. Write a query to display the department ID, department name and manager first name. 
*/
CREATE VIEW EmpData12
AS
SELECT  distinct e.FirstName,e.DepartmentID,D.DepartmentName from Employees E 
join Employees E1  on e1.ManagerID = E.EmployeeID
join Departments D on E.DepartmentID = D.DepartmentID

/*
9. Write a query to display the department name, manager name, and city. 
*/
CREATE VIEW EmpData13
AS
SELECT  distinct e.FirstName,D.DepartmentName,l.City from Employees E 
join Employees E1  on e1.ManagerID = E.EmployeeID
join Departments D on E.DepartmentID = D.DepartmentID
join Locations L on D.LocationID = L.LocationID


/*
10. Write a query to display the job title and average salary of employees. 
*/
CREATE VIEW EmpData14
AS
SELECT Emp.JobId,FirstName,Lastname,(Salary - (SELECT MIN(Salary) FROM Employees WHERE JobId = Emp.JobId)) 
AS 'Salary Differnece',Salary,(SELECT MIN(Salary) FROM Employees WHERE JobId = Emp.JobId) 
AS 'Min'
FROM Employees AS Emp


/*
11. Display job title, employee name, and the difference between salary of the employee and 
minimum salary for the job. 
*/
CREATE VIEW EmpData15
AS
select e.jobid,firstname,salary-salary2 difference from Employees e,a e1
where e.JobId = e1.jobid order by difference
select * into a from (select MIN(salary)[Salary2],jobid from Employees group by jobid)ab

/*
12. Write a query to display the job history that were done by any employee who is currently 
drawing more than 10000 of salary. 
*/
CREATE VIEW EmpData16
AS
SELECT * FROM JobHistory J JOIN Employees E 
on J.EmployeeID = E.EmployeeID
WHERE E.Salary > 10000


/*
13. Write a query to display department name, name (first_name, last_name), hire date, salary of the 
manager for all managers whose experience is more than 15 years. 
*/
CREATE VIEW EmpData17
AS
SELECT distinct D.DepartmentName,E.FirstName,E.LastName,E.HireDate,E.Salary FROM Employees E 
JOIN Employees E1 ON E.EmployeeID = E1.ManagerID
JOIN Departments D on E.DepartmentID = D.DepartmentID
AND DATEDIFF(yyyy,E.HireDate,GETDATE())>15
