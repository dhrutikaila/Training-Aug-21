

--practice 

SELECT DENSE_RANK() OVER(ORDER BY salary ) as 'Rank ',salary,* from Employees  

SELECT RANK() OVER(ORDER BY Salary desc) as 'Rank' ,Salary,* from Employees

SELECT ROW_NUMBER() OVER(ORDER BY Salary desc) as 'Rank' ,Salary ,* from Employees



select * from
(SELECT DENSE_RANK() OVER(ORDER BY Salary desc)as 'Rankk' , * from Employees) tb1
where Rankk=2


DECLARE @number int
SET @number=3
select * from
(SELECT DENSE_RANK() OVER(ORDER BY Salary desc)as 'Rankk' , * from Employees) tb1
where Rankk=@number


SELECT * FROM
(SELECT toalSalary=(Salary+CommissionPct) ,*  FROM Employees ) ta
 where salary<5000
 
SELECT JobId,sum(Salary),count(*) as 'group number' from Employees GROUP BY JobId

SELECT JobId,sum(Salary),count(*) as 'group number' from Employees GROUP BY JobId HAVING sum(Salary)<20000 order by sum(Salary)


SELECT *,
	NTILE (10) OVER (ORDER BY EmployeeID desc)as 'buckets'
FROM Employees


SELECT * from
(SELECT *,
	num=(NTILE (10) OVER (ORDER BY EmployeeID desc))
	FROM Employees
) tb
where num=10 AND JobId='sh_clerk'


--Aggregate Function

SELECT MAX(Salary),FirstName FROM Employees

SELECT SUM(Salary),FirstName FROM Employees

SELECT JobId,salary=(AVG(Salary)) FROM Employees GROUP BY JobId

select * from Employees
