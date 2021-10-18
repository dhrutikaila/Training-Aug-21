use day6_sql_file
--1   Write a query to find the names (first_name, last_name) and salaries of the employees who have higher salary than the employee whose last_name='Bull'. 

select FirstName,Salary from Employees where Salary>(select Salary from Employees where LastName='Bull')

--2. Find the names (first_name, last_name) of all employees who works in the IT department. 

select FirstName from Employees  where DepartmentID=(select DepartmentID from Departments where DepartmentName='IT')

--3 Find the names (first_name, last_name) of the employees who have a manager who works for a department based in United States. 

select Firstname from Employees where DepartmentID in (select DepartmentID from Departments where LocationID in (Select LocationID from Locations where CountryID = 'US')) 

--4. Find the names (first_name, last_name) of the employees who are managers. 

select distinct'Manager Name'=b.FirstName from Employees a join Employees b on a.ManagerID=b.EmployeeID

--5. Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. 

select Firstname,Salary from Employees where Salary>(select avg(Salary) from Employees)

--6. Find the names (first_name, last_name), salary of the employees whose salary is equal to the minimum salary for their job grade. 

select * from Departments
select * from Employees
select * from Locations

select Firstname,Salary from Employees where Salary in (select min(Salary) from Employees group by DepartmentID)

--7. Find the names (first_name, last_name), salary of the employees who earn more than the average salary and who works in any of the IT departments. 

select Firstname,Salary from Employees where Salary >(select avg(Salary) from Employees) and
DepartmentID=(select DepartmentID from Departments where DepartmentName='IT')

select Firstname,Salary from Employees where Salary >(select avg(Salary) from Employees 
where DepartmentID in(select DepartmentID from Departments where DepartmentName='IT'))


--8. Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell. 

select Firstname,Salary from Employees where Salary>(select Salary from Employees where LastName='Bell')

--9. Find the names (first_name, last_name), salary of the employees who earn the same salary as the minimum salary for all departments. 
 
select Firstname,(Salary),DepartmentID from Employees where Salary in(select Min(Salary) from Employees group by DepartmentID)

--10. Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department. 

select Firstname,Salary from Employees where Salary >
(select avg(Salary) from Employees where Salary in (select avg(Salary) from Employees group by DepartmentID))

--11. Write a query to find the names (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results on salary from the lowest to highest. 

select Firstname,Salary from Employees where Salary >(select max(Salary) from Employees where JobId='SH_CLERK') 
order by Salary asc

--12. Write a query to find the names (first_name, last_name) of the employees who are not supervisors. 

select Firstname,Salary from Employees where ManagerID=0

--13. Write a query to display the employee ID, first name, last names, and department names of all employees. 

select e.EmployeeID,e.Firstname,e.LastName,d.DepartmentName from 
Departments d join Employees e on e.DepartmentID=d.DepartmentID

--14. Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments. 

SELECT e.EmployeeID,e.FirstName,e.LastName,e.Salary,e.DepartmentID 
FROM Employees e join (SELECT DepartmentID,AVG(Salary) 'Salary'  FROM Employees GROUP BY DepartmentID)temp
on e.DepartmentID=temp.DepartmentID
where e.Salary > temp.Salary

--15. Write a query to fetch even numbered records from employees table. 

select * from Employees where EmployeeID%2=0

--16. Write a query to find the 5th maximum salary in the employees table. 

select * from Employees where Salary=
(select Salary from(select Salary,dense_rank() over(order by Salary desc)rank from Employees)temp where rank=5)

--17. Write a query to find the 4th minimum salary in the employees table. 

select * from Employees where Salary in 
(select Salary from(select Salary,dense_rank() over(order by Salary )rank from Employees)temp where rank=4)


select * from
(select *,dense_rank() over(order by Salary )rank from Employees)temp 
where rank=4

--18. Write a query to select last 10 records from a table. 

select top 10* from Employees order by EmployeeID desc

--19. Write a query to list department number, name for all the departments in which there are no employees in the department. 

select DepartmentName,DepartmentID from Departments where DepartmentID not in (select distinct DepartmentID from Employees)

--20. Write a query to get 3 maximum salaries. 

select EmployeeID,FirstName,Salary from Employees where Salary in 
(select distinct top 3 salary from Employees order by Salary desc)


--21. Write a query to get 3 minimum salaries. 

select EmployeeID,FirstName,Salary from Employees where Salary in 
(select distinct top 3 salary from Employees order by Salary asc)

--22. Write a query to get nth max salaries of employees. 

declare @a as int
set @a=5

select EmployeeID,FirstName,Salary from 
(select DENSE_RANK() over (order by Salary desc)variable,* from Employees)temp
where variable=@a
