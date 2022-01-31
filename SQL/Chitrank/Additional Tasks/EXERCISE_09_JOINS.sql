/*
1.Write a query to find the addresses (location_id, street_address, city, state_province, country_name) 
of all the departments. 
*/
SELECT DepartmentName,d.LocationID,StreetAddress,City,StateProvince,CountryID
FROM Departments d 
JOIN Locations l on
d.LocationID = l.LocationID
order by LocationID


/*
2.Write a query to find the names (first_name, last name), department ID and name of all the employees. 
*/
SELECT FirstName,LastName,e.DepartmentID,DepartmentName
FROM Employees e JOIN Departments d
ON e.DepartmentID = d.DepartmentID
order by e.DepartmentID


/*
3.Find the names (first_name, last_name), job, department number, and department name of the employees 
who work in London. 
*/
SELECT FirstName,LastName,JobID,e.DepartmentID,DepartmentName
FROM Employees e JOIN Departments d
ON e.DepartmentID = d.DepartmentID
JOIN Locations l 
on d.LocationID = l.LocationID
WHERE l.City='London'
order by e.DepartmentID


/*
4.Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name). 
*/
SELECT e.EmployeeID,e.LastName,e1.ManagerID,e1.LastName 
FROM Employees e JOIN Employees e1
ON E.ManagerID = e1.EmployeeID
ORDER BY EmployeeID

/*
5.Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'. 
*/
SELECT distinct e.FirstName,e.LastName,e.HireDate FROM Employees e,Employees e1 
WHERE e.HireDate > (select HireDate From Employees where LastName='Jones')

/*
6.Write a query to get the department name and number of employees in the department. 
*/
SELECT DepartmentName,Count(EmployeeID) Employees
FROM Employees e JOIN Departments d
on e.DepartmentID = d.DepartmentID
group by DepartmentName


/*
7.Find the employee ID, job title, number of days between ending date and starting date for all jobs in 
department 90 from job history. 
*/
SELECT j.EmployeeID,j.JobID,DATEDIFF(dd,StartDate,EndDate) 
FROM Departments d
JOIN JobHistory j
on d.DepartmentID = j.DepartmentID
where j.DepartmentID=90


/*
8. Write a query to display the department ID, department name and manager first name. 
*/
SELECT distinct e.DepartmentID,DepartmentName,e.FirstName 
from Employees e join Employees e1
on e.EmployeeID = e1.ManagerID
join Departments d
on e.DepartmentID = d.DepartmentID


/*
9.Write a query to display the department name, manager name, and city. 
*/
SELECT distinct DepartmentName,(e.FirstName + ' ' + e.LastName) Name,l.City
from Employees e join Employees e1
on e.EmployeeID = e1.ManagerID
join Departments d
on e.DepartmentID = d.DepartmentID
join Locations l
on d.LocationID = l.LocationID


/*
10.Write a query to display the job title and average salary of employees. 
*/
SELECT JobID,CAST(AVG(Salary)AS DECIMAL(10,2)) AverageSalary FROM Employees
GROUP BY JobID
ORDER BY AverageSalary


/*
11.Display job title, employee name, and the difference between salary of the employee and minimum salary 
for the job. 
*/
SELECT e.JobID,(e.FirstName + ' ' + e.LastName) Name,(e.Salary-b.Salary) Difference
FROM Employees e
INNER JOIN 
(SELECT JobId,MIN(Salary) Salary FROM Employees group by JobID)as b
on e.jobid = b.jobid
order by Difference


/*
12.Write a query to display the job history that were done by any employee who is currently drawing 
more than 10000 of salary. 
*/
SELECT * FROM JobHistory j
LEFT JOIN Employees e
on j.EmployeeID = e.EmployeeID
WHERE E.Salary > 10000

/*
13.Write a query to display department name, name (first_name, last_name), hire date, salary of the 
manager for all managers whose experience is more than 15 years. 
*/
SELECT DISTINCT DepartmentName,(e.FirstName + ' ' + e.LastName) Name,e.HireDate,e.Salary
FROM Employees e
JOIN Employees e1 on e.EmployeeID = e1.ManagerID
JOIN Departments d on e.DepartmentID = d.DepartmentID
WHERE DATEDIFF(YYYY,e.HireDate,GETDATE()) > 15

