-- SUM

select DepartmentID,SUM(Salary) as TotalSalary
from employees	
group  by DepartmentID
order by TotalSalary desc

-- Count
select DepartmentID,Count(Salary) as TotalSalary
from employees	
group  by DepartmentID
order by TotalSalary desc

-- MAX
select DepartmentID,MAX(Salary) as MAXSALARY
from employees	
group  by DepartmentID
order by MAXSALARY desc

-- MIN
select DepartmentID,MIN(Salary) as MINSALARY
from employees	
group  by DepartmentID
order by MINSALARY desc

-- AVG
select DepartmentID,AVG(Salary) as AVGSALARY
from employees	
group  by DepartmentID
order by AVGSALARY desc