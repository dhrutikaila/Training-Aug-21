--additional work 40-60

--41. Get department,total salary with respect to a department from employee table.
SELECT DEPARTMENT,SUM(SALARY) AS TotalSalary 
FROM Employee
GROUP BY DEPARTMENT

--42. Get department,total salary with respect to a department from employee table order by total salary descending
SELECT DEPARTMENT,SUM(SALARY) AS TotalSalary 
FROM Employee
GROUP BY DEPARTMENT
ORDER BY TotalSalary DESC

--43.  Get department,no of employees in a department,total salary with respect to a department from employee table order by total salary descending
SELECT DEPARTMENT,COUNT(EMPLOYEE_ID) AS NoOfEmp,SUM(SALARY) AS TotalSalary 
FROM Employee
GROUP BY DEPARTMENT
ORDER BY TotalSalary DESC

--44. Get department wise average salary from employee table order by salary ascending
SELECT DEPARTMENT,AVG(SALARY) AS AvgSalary 
FROM Employee
GROUP BY DEPARTMENT
ORDER BY AvgSalary ASC

--45. Get department wise maximum salary from employee table order by salary ascending
SELECT DEPARTMENT,MAX(SALARY) AS MaxSalary 
FROM Employee
GROUP BY DEPARTMENT
ORDER BY MaxSalary ASC

--46.  Get department wise minimum salary from employee table order by salary ascending
SELECT DEPARTMENT,MIN(SALARY) AS MinSalary 
FROM Employee
GROUP BY DEPARTMENT
ORDER BY MinSalary ASC

--47.  Select no of employees joined with respect to year and month from employee table
SELECT COUNT(EMPLOYEE_ID) AS NoOfEmp
FROM Employee
GROUP BY DATENAME(YYYY,JOINING_DATE) ,DATENAME(MM,JOINING_DATE) 

--48. Select department,total salary with respect to a department from employee table where total salary greater than 800000 order by Total_Salary descending
SELECT DEPARTMENT,SUM(SALARY) AS TotalSalary
FROM Employee
GROUP BY DEPARTMENT
HAVING SUM(SALARY)>800000

--49.  Select first_name, incentive amount from employee and incentives table for those employees who have incentives
SELECT E.FIRST_NAME,I.INCENTIVE_AMOUNT
FROM Employee E 
INNER JOIN Incentives I ON E.EMPLOYEE_ID=I.EMPLOYEE_REF_ID

--50. Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
SELECT E.FIRST_NAME,I.INCENTIVE_AMOUNT
FROM Employee E 
INNER JOIN Incentives I ON E.EMPLOYEE_ID=I.EMPLOYEE_REF_ID
WHERE I.INCENTIVE_AMOUNT>3000

--51. Select first_name, incentive amount from employee and incentives table for all employes even if they didn't get incentives.
SELECT E.FIRST_NAME,I.INCENTIVE_AMOUNT
FROM Employee E 
LEFT JOIN Incentives I ON E.EMPLOYEE_ID=I.EMPLOYEE_REF_ID

--52. Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives and set incentive amount as 0 for those employees who didn't get incentives.
SELECT E.FIRST_NAME,ISNULL(I.INCENTIVE_AMOUNT,0)
FROM Employee E 
LEFT JOIN Incentives I ON E.EMPLOYEE_ID=I.EMPLOYEE_REF_ID

--53.  Select first_name, incentive amount from employee and incentives table for all employees who got incentives using left join
SELECT E.FIRST_NAME,ISNULL(I.INCENTIVE_AMOUNT,0)
FROM  Incentives I
LEFT JOIN Employee E ON E.EMPLOYEE_ID=I.EMPLOYEE_REF_ID

--54.  Select TOP 2 salary from employee table
SELECT TOP 2 SALARY
FROM Employee

--55. Select TOP N salary from employee table
SELECT TOP 3 SALARY
FROM Employee

--56. Select 2nd Highest salary from employee table	
SELECT SALARY FROM (SELECT SALARY, DENSE_RANK() OVER (ORDER BY SALARY DESC) AS RANK
FROM Employee)TBL
WHERE RANK=2
--57.  Select Nth Highest salary from employee table Select Nth Highest salary from employee table
SELECT SALARY FROM (SELECT SALARY, DENSE_RANK() OVER (ORDER BY SALARY DESC) AS RANK
FROM Employee)TBL
WHERE RANK=2 --WHERE RANK=N 

--58.  Select First_Name,LAST_NAME from employee table as separate rows
SELECT FIRST_NAME FROM EMPLOYEE
	 UNION
	 SELECT LAST_NAME FROM EMPLOYEE;


--59.  What is the difference between UNION and UNION ALL ?
--Both UNION and UNION ALL operators combine rows from result sets into a single result set. 
--The UNION operator removes eliminate duplicate rows, whereas the UNION ALL operator does not.

--60. Select employee details from employee table if data exists in incentive table ?
 SELECT * FROM EMPLOYEE WHERE EXISTS (SELECT * FROM INCENTIVES);

 --61. How to fetch data that are common in two query results ?
-- USING INTERSECT 

--62. . Get Employee ID's of those employees who didn't receive incentives without using sub query ?
SELECT EMPLOYEE_ID 
FROM EMPLOYEE E 
LEFT JOIN INCENTIVES I ON E.EMPLOYEE_ID=I.EMPLOYEE_REF_ID 
WHERE I.INCENTIVE_AMOUNT IS NULL;

--63. Select 20 % of salary from John , 10% of Salary for Roy and for other 15 % of salary from employee table
SELECT FIRST_NAME,CASE FIRST_NAME
	 WHEN 'John' THEN SALARY*0.2
	 WHEN 'Roy' THEN SALARY*0.1
	 ELSE SALARY*0.15
	 END AS NEW_SALARY
FROM EMPLOYEE;


--64. Select Banking as 'Bank Dept', Insurance as 'Insurance Dept' and Services as 'Services Dept' from employee table
UPDATE EMPLOYEE SET DEPARTMENT=
	 CASE DEPARTMENT
	 WHEN 'Banking' THEN 'Bank Dept'
	 WHEN 'Insurance' THEN 'Insurance Dept'
	 WHEN 'Services' THEN 'Services Dept'
	 ELSE 'NONE'
	 END;
SELECT * FROM EMPLOYEE;

--65. Delete employee data from employee table who got incentives in incentive table
DELETE FROM EMPLOYEE 
WHERE EMPLOYEE_ID IN(SELECT DISTINCT EMPLOYEE_ID FROM EMPLOYEE E INNER JOIN INCENTIVES I
	 ON E.EMPLOYEE_ID=I.EMPLOYEE_REF_ID);

--66.  Insert into employee table Last Name with " ' " (Single Quote - Special Character)
INSERT INTO EMPLOYEE(LAST_NAME)
	 VALUES('AB''C');

--67. Select Last Name from employee table which contain only numbers
SELECT LAST_NAME FROM Employee WHERE LAST_NAME LIKE  '%[0-9]%'

--68. Write a query to rank employees based on their incentives for a month.
 SELECT E.FIRST_NAME,dense_rank() OVER(ORDER BY I.INCENTIVE_AMOUNT DESC)AS RANK FROM EMPLOYEE E JOIN INCENTIVES I
	ON E.EMPLOYEE_ID=I.EMPLOYEE_REF_ID; 


--69. Update incentive table where employee name is 'John'
 UPDATE INCENTIVES SET INCENTIVE_AMOUNT=8000
	 WHERE EMPLOYEE_REF_ID=(SELECT EMPLOYEE_ID FROM EMPLOYEE WHERE FIRST_NAME='John');

--70. Write syntax to delete table employee
DROP TABLE EMPLOYEE;

--71.  Write syntax to set EMPLOYEE_ID as primary key in employee table.
 ALTER TABLE EMPLOYEE 
 ADD CONSTRAINT EMP_ID_KEY PRIMARY KEY(EMPLOYEE_ID); 

--72.  Write syntax to set 2 fields(EMPLOYEE_ID,FIRST_NAME) as primary key in employee table
 ALTER TABLE EMPLOYEE 
 ADD CONSTRAINT EMP_ID_NAME_KEY PRIMARY KEY(EMPLOYEE_ID,FIRST_NAME);

--73. Write syntax to drop primary key on employee table.                                    
ALTER TABLE EMPLOYEE 
DROP CONSTRAINT EMP_ID_KEY;

--74. Write Sql Syntax to create EMPLOYEE_REF_ID in INCENTIVES table as foreign key with respect to EMPLOYEE_ID in employee table 
ALTER TABLE INCENTIVES 
ADD CONSTRAINT FK_KEY FOREIGN KEY (EMPLOYEE_REF_ID)         
                  REFERENCES EMPLOYEE(EMPLOYEE_ID);

--75. Write SQL to drop foreign key on employee table
ALTER TABLE INCENTIVES 
DROP CONSTRAINT FK_KEY;

--76. Write query for add new column flag active in employee table
ALTER TABLE EMPLOYEE 
ADD FLAG_ACTIVE TEXT;

--77. Add default constraint ‘Y’ to flag active column in employee table
ALTER TABLE EMPLOYEE 
ADD FLAG_ACTIVE TEXT DEFAULT 'Y';
--78. Write query for delete column flag active in employee table
 ALTER TABLE EMPLOYEE 
 DROP COLUMN FLAG_ACTIVE;

--79. Add constraint unique key in employee table
ALTER TABLE EMPLOYEE 
ADD CONSTRAINT UK_KEY UNIQUE(FIRST_NAME);

--80. Remove constraint unique key in employee table
ALTER TABLE EMPLOYEE DROP CONSTRAINT UK_KEY; 