




--q1
SELECT FirstName as 'first_name' , len(FirstName) as 'lenngth'  FROM Employees WHERE FirstName like 'A%' or FirstName like 'J%' or FirstName like 'M%' group by FirstName 

--q2
SELECT firstname, right(replicate('$',10-len(salary))+cast(salary as varchar(10)),10) as 'salary' FROM employees


--q3

SELECT firstname,lastname,hiredate,DATEPART(dd,hiredate) FROM Employees WHERE DATEPART(dd,hiredate)=7 or DATEPART(mm,hiredate)=7 

--q4
SELECT len(firstname),lastname FROM Employees WHERE CHARINDEX('c', LastName)=2

--q5
SELECT right(phonenumber,4),phonenumber FROM Employees

--q6
UPDATE Employees SET phonenumber= replace (phonenumber,'194','999')
--q7
SELECT datediff(YYYY,hiredate,GETDATE()) FROM Employees
--q8
SELECT distinct hiredate FROM employees WHERE 'monday'=(datename(WEEKDAY,HireDate)) 
--q9
SELECT firstname,hiredate FROM employees WHERE hiredate between '1987-06-01' AND '1987-07-30'
--q10
SELECT  format(getdate(),'hh:mm tt')+' '+datename(mm,getdate())+ ' '+datename(dd,getdate())+str(datepart(yyyy,getdate() ))

--q11
SELECT firstname FROM Employees WHERE DATENAME(MM,hiredate)='june'

--q12
SELECT firstname, hiredate ,datediff(yyyy,hiredate,getdate())  as 'experienc' FROM employees

--q13

SELECT firstname,hiredate FROM employees WHERE (datename(yyyy,hiredate))=1987






























