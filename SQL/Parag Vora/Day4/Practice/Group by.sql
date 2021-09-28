-- group by roll up

select StudentName,Subject , sum(Marks) 
from ExamResult
group by rollup(StudentName,Subject)
        --   or --
select StudentName,Subject , sum(Marks) 
from ExamResult
group by StudentName,Subject with rollup


--group by grouping sets

select StudentName,Subject , sum(Marks) 
from ExamResult
group by grouping sets
(
  (StudentName,Subject),()
)

select StudentName , sum(Marks) 
from ExamResult
group by grouping sets
(
  (StudentName),()
)

-- group by having
select DepartmentID,Sum(Salary) as TotalSalary 
    from employees    
    GROUP BY DepartmentID  
    HAVING sum(Salary) > 50000
    ORDER BY TotalSalary desc 

-- group by union all

select StudentName , sum(Marks) 
from ExamResult
group by (StudentName)

union all

select null,sum(Marks) as TotalSalary
from ExamResult


-- group by cube

select StudentName,Subject , sum(Marks)  as Totalmark
from ExamResult
group by cube(StudentName,Subject)

-- Differebece between rollup and cube

-- cube is used for all the possible combinations while rollup is used for hierarchical combinations like (continent,country,city) 