use day5
--1. Select employee details from employee table if data exists in incentive table ?

select * from Employee where exists (select * from Incentives)

--2. Find Salary of the employee whose salary is more than Roy Salary

select SALARY,FIRST_NAME from Employee where SALARY>(select SALARY from Employee where FIRST_NAME='Roy' )

--3. Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount

create view query3 as 
select e.FIRST_NAME,e.LAST_NAME,e.SALARY,e.JOINING_DATE,i.INCENTIVE_DATE,i.INCENTIVE_AMOUNT from Employee e join Incentives i on e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID

select * from query3

/* 4. Create a view to select Select first_name, incentive amount from employee and 
incentives table for those employees who have incentives and incentive amount greater than 3000   */

create view query4 as 
select e.FIRST_NAME,i.INCENTIVE_AMOUNT from Employee e join Incentives i on e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID where i.INCENTIVE_AMOUNT>3000

select * from query4


---------------------------------------------------------------------------------------

use day6_sql_file

select count(EmployeeID) from Employees
select* from Departments
select * from Locations
/* 1: Create a View to Find the names (first_name, last_name), job, department number, and 
department name of the employees who work in London*/

create   view query1 as
select Name=concat(e.FirstName,' ',e.LastName),e.JobId,e.DepartmentID,d.DepartmentName,d.LocationID from Employees e join Departments d on e.DepartmentID=d.DepartmentID
where LocationID=(select LocationID from Locations where City='London')

select * from query1

--2: Create a View to get the department name and number of employees in the department.
create   view query2 as
select d.DepartmentName,'Number of emploees'=count(e.EmployeeID) from Employees e join Departments d on e.DepartmentID=d.DepartmentID group by d.DepartmentName

select * from query2

/*3: Find the employee ID, job title, number of days between ending date and starting date 
for all jobs in department 90 from job history.*/

select EmployeeID,Experience=DATEDIFF(yyyy,StartDate,EndDate),JobID from JobHistory where DepartmentID=90


--4: Write a View to display the department name, manager name, and city.
create view query4 as 
select d.DepartmentName,'Manager Name'=e.FirstName, l.City from Departments d join Employees e on d.ManagerID=e.EmployeeID join Locations l on d.LocationID=l.LocationID 

select * from query4
/* 5: Create a View to display department name, name (first_name, last_name), hire date, 
salary of the manager for all managers whose experience is more than 15 years.  */

create view query5 as
select d.DepartmentName,e.FirstName+' '+e.LastName 'Name',e.HireDate,e.Salary
FROM Departments d
JOIN Employees e
ON d.ManagerID=e.EmployeeID
WHERE DATEDIFF(YEAR,HireDate,GETDATE()) > 15

select * from query5