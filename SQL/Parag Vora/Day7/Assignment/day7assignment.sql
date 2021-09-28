-- Convert Day4 and Day5 Exercises with CTE and Derived Table.

-- DAY-4

--1)Write a query to rank employees based on their salary for a month

    --CTE 
    with empsalary
    as ( select DENSE_RANK() over (order by salary desc) as 'd_rank',* from  employees )
    select * from empsalary

    -- Derived Table
    select * from (select DENSE_RANK() over (order by salary desc) as 'd_rank',* from  employees) temp


-- 2)Select 4th Highest salary from employee table using ranking function

    --CTE
    with nthsalary
    as ( select DENSE_RANK() over (order by salary desc) as d_rank,* from  employees )
    select * from nthsalary where d_rank = 4

    -- Derived Table
    select * from
    ( select DENSE_RANK() over (order by salary desc) as d_rank,* from  employees )
    temp where d_rank = 4


-- 3)Get department, total salary with respect to a department from employee table.

    -- CTE
    with departmentwisesalary
    as(
    select d.DepartmentName,sum(e.Salary) as Totalsalary
    from Departments as d
    join Employees as e 
    on e.DepartmentID = d.DepartmentID
    group by d.DepartmentName)
    select * from departmentwisesalary

    -- Derived Table
    select * from
    (
    select d.DepartmentName,sum(e.Salary) as Totalsalary
    from Departments as d
    join Employees as e 
    on e.DepartmentID = d.DepartmentID
    group by d.DepartmentName
    )temp


-- 4)Get department, total salary with respect to a department from employee table order by total salary descending

    --CTE
    with departmentwisesalary
    as(
    select d.DepartmentName,sum(e.Salary) as Totalsalary
    from Departments as d
    join Employees as e 
    on e.DepartmentID = d.DepartmentID
    group by d.DepartmentName)
    select * from departmentwisesalary order by Totalsalary desc

    --Derived Table
    select * from
    (
    select d.DepartmentName,sum(e.Salary) as Totalsalary
    from Departments as d
    join Employees as e 
    on e.DepartmentID = d.DepartmentID
    group by d.DepartmentName
    )temp order by Totalsalary desc

-- 5)Get department wise maximum salary from employee table order by salary ascending
       
    --CTE  
    with departmentwisesalary
    as(
    select d.DepartmentName,max(e.Salary) as maxsalary
    from Departments as d
    join Employees as e 
    on e.DepartmentID = d.DepartmentID
    group by d.DepartmentName)
    select * from departmentwisesalary order by maxsalary asc

    --Derived Table
    select * from
    (
    select d.DepartmentName,max(e.Salary) as maxsalary
    from Departments as d
    join Employees as e 
    on e.DepartmentID = d.DepartmentID
    group by d.DepartmentName
    )temp order by maxsalary desc


-- 6)Get department wise minimum salary from employee table order by salary ascending

    --CTE 
    with departmentwisesalary
    as(
    select d.DepartmentName,min(e.Salary) as minsalary
    from Departments as d
    join Employees as e 
    on e.DepartmentID = d.DepartmentID
    group by d.DepartmentName)
    select * from departmentwisesalary order by minsalary asc

    --Derived Table
    select * from
    (
    select d.DepartmentName,min(e.Salary) as minsalary
    from Departments as d
    join Employees as e 
    on e.DepartmentID = d.DepartmentID
    group by d.DepartmentName
    )temp order by minsalary asc


-- 7)Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending

    -- CTE
    with departmentwisesalary
    as(
    select d.DepartmentName,sum(e.Salary) as Totalsalary
    from Departments as d
    join Employees as e 
    on e.DepartmentID = d.DepartmentID
    group by d.DepartmentName)
    select * from departmentwisesalary where totalsalary>50000 order by Totalsalary desc
             --OR

    with departmentwisesalary
    as(
    select d.DepartmentName,sum(e.Salary) as Totalsalary
    from Departments as d
    join Employees as e 
    on e.DepartmentID = d.DepartmentID
    group by d.DepartmentName
	having sum(Salary)>50000)
    select * from departmentwisesalary  order by Totalsalary desc

    -- Derived Table
    select * from
    (
    select d.DepartmentName,sum(e.Salary) as Totalsalary
    from Departments as d
    join Employees as e 
    on e.DepartmentID = d.DepartmentID
    group by d.DepartmentName
	having sum(Salary)>50000
    )temp order by Totalsalary desc

--DAY 5

-- 1)Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table  
    
    -- CTE
    with differnecedate
    as(
    select datediff(day,e.JOINING_DATE,i.INCENTIVE_DATE) as 'datediff' 
    from Employee as e
    join Incentives as i
    on e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID)
    select * from differnecedate 

    -- Derived Table
    select * from
    (
    select datediff(day,e.JOINING_DATE,i.INCENTIVE_DATE) as 'datediff' 
    from Employee as e
    join Incentives as i
    on e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID
    )temp

-- 2)Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000

    -- CTE
    with incentiveamount
    as(
    select e.FIRST_NAME,i.INCENTIVE_AMOUNT 
    from Employee as e
    join Incentives as i
    on e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID and i.INCENTIVE_AMOUNT > 3000)
    select * from incentiveamount  

    -- Derived Table
    select * from
    (
    select e.FIRST_NAME,i.INCENTIVE_AMOUNT 
    from Employee as e
    join Incentives as i
    on e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID and i.INCENTIVE_AMOUNT > 3000
    )temp
    

-- 3)Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.

    -- CTE
    with incentiveamount
    as(
    select e.FIRST_NAME,i.INCENTIVE_AMOUNT 
    from Employee as e
    left join Incentives as i
    on e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID )
    select * from incentiveamount  

    -- Derived Table
    select * from
    (
    select e.FIRST_NAME,i.INCENTIVE_AMOUNT 
    from Employee as e
    left join Incentives as i
    on e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID
    )temp

-- 4)Select EmployeeName, ManagerName from the employee table.

    -- CTE
    with EMP_MNG
	as(
	select I.FIRST_NAME as EmployeeName ,E.FIRST_NAME as ManagerName 
	from Employee E ,Employee i  WHERE E.EMPLOYEE_ID=I.MANAGER_ID)
	select * from EMP_MNG

    -- Derived Table
    
    select * from
    (
    select I.FIRST_NAME as EmployeeName ,E.FIRST_NAME as ManagerName 
	from Employee E ,Employee i  WHERE E.EMPLOYEE_ID=I.MANAGER_ID
    )temp

-- 5)Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.

    -- CTE
    with incentiveamount
    as(
    select e.FIRST_NAME,isnull(i.INCENTIVE_AMOUNT,0) as incentINCENTIVE_AMOUNT
    from Employee as e
    left join Incentives as i
    on e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID )
    select * from incentiveamount  

    -- Derived Table
    select * from
    (
    select e.FIRST_NAME,isnull(i.INCENTIVE_AMOUNT,0) as incentINCENTIVE_AMOUNT
    from Employee as e
    left join Incentives as i
    on e.EMPLOYEE_ID = i.EMPLOYEE_REF_ID 
    )temp


    



