select * from Employees

--1. Write a query to rank employees based on their salary for a month

select dense_rank() over (order by Salary desc ),FirstName,Salary from Employees

--2. Select 4th Highest salary from employee table using ranking function

select Rank,FirstName,Salary from 
(select DENSE_RANK() over(order by Salary desc)Rank,FirstName,Salary from Employees)temp 
where Rank=4

--3. Get department, total salary with respect to a department from employee table.

select JobId,sum(Salary) from Employees group by JobId

--4. Get department, total salary with respect to a department from employee table order by total salary descending

select JobId,sum(Salary)Total_Salary from Employees group by JobId order by Total_Salary desc

--5. Get department wise maximum salary from employee table order by salary ascending

select JobId,max(Salary)Total_Salary from Employees group by JobId order by Total_Salary asc

--6. Get department wise minimum salary from employee table order by salary ascending

select JobId,min(Salary)Total_Salary from Employees group by JobId order by Total_Salary asc


--7. Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending

select JobId,Total_Salary from
(select JobId,sum(Salary)Total_Salary from Employees group by JobId)temp 
where Total_Salary>50000 order by Total_Salary  desc

--7
select JobId,sum(Salary)Total_Salary from Employees group by JobId having sum(Salary)>50000 order by Total_Salary desc 