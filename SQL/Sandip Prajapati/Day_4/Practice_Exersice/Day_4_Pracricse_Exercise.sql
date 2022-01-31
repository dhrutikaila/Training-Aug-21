-----------Day-4-----------

--------AGGREGATE-FUNCTION--------
--APPROX_COUNT_DISTINCT
SELECT APPROX_COUNT_DISTINCT(Salary)from Employees;

--AVERAGE
SELECT AVG(Salary) from Employees;

--CHECKSUM_AGG
SELECT CHECKSUM_AGG(CAST(Salary AS INT)) from Employees;


--COUNT
SELECT COUNT(Salary) FROM Employees;

--GROUPING

SELECT GROUPING(ManagerID) AS '100' FROM Employees
GROUP BY ManagerID ;

SELECT GROUPING(ManagerID) AS '100' FROM Employees
GROUP BY ManagerID WITH ROLLUP ;

--LEARNING HAVING PROBLEM
SELECT GROUPING_ID(ManagerID) FROM Employees
GROUP BY Salary;

--MAX
SELECT MAX(Salary)  FROM Employees;

--MIN
SELECT MIN(Salary)  FROM Employees;

--STDDEV
SELECT STDEV(Salary) FROM Employees;

SELECT STDEVP(Salary) FROM Employees;

--STRING_AGG LEARNING
SELECT STRING_AGG(VARCHAR(MAX),FirstName) FROM Employees;

--SUM
SELECT SUM(SALARY) FROM Employees;

--VAR
SELECT VAR(SALARY) FROM Employees;

--VARP
SELECT VARP(SALARY) FROM Employees;
select * from employees

--RANKING-FUNCTION
--DENSE-RANK
SELECT DENSE_RANK() OVER(ORDER BY Salary DESC),* FROM Employees;

--RANK
SELECT RANK() OVER(ORDER BY Salary DESC),* FROM Employees;

--ROW-NUMBER
SELECT ROW_NUMBER() OVER(ORDER BY Salary DESC),* FROM Employees;

--NTILE

--ORDER-BY
SELECT NTILE(4) OVER (ORDER BY Salary) AS Em_salary ,* FROM Employees;

--PARTITION-BY
SELECT NTILE(4) OVER (PARTITION BY ManagerID ORDER BY Salary) AS Em_salary ,* FROM Employees;

----GROUP-BY
SELECT COUNT(*) FROM Employees 
GROUP BY Salary;

----HAVING
SELECT SUM(Salary),FirstName FROM Employees
GROUP BY JobId,Salary,FirstName
HAVING Salary > 5000
ORDER BY FirstName;
SELECT SUM(Salary),FirstName FROM Employees
GROUP BY JobId,Salary,FirstName
HAVING AVG(Salary) > 5000
ORDER BY FirstName;

--GROUP BY CUBE
SELECT FirstName,LastName FROM Employees 
GROUP BY CUBE(FirstName,LastName);
--ROLLUP
SELECT SUM(Salary),FirstName FROM Employees
GROUP BY ROLLUP (JobId,Salary,FirstName)
HAVING Salary > 5000;

SELECT SUM(Salary),JobId FROM Employees
GROUP BY ROLLUP(JobId)
HAVING AVG(Salary) > 5000
ORDER BY JobId;

--SELECT-INTO 
SELECT FirstName,LastName,Salary INTO Sunsan FROM Employees;
SELECT * FROM Sunsan;