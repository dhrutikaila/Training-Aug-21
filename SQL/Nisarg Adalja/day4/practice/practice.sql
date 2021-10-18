/* Ranking Function or Window Function */
/* generate sequencial number s for each row or give a rank based on specific criteria.*/

/* 1.row_number() */

CREATE TABLE ExamResult
(StudentName VARCHAR(70), 
 Subject     VARCHAR(20), 
 Marks       INT
);
INSERT INTO ExamResult
VALUES
('Lily', 
 'Maths', 
 65
);
INSERT INTO ExamResult
VALUES
('Lily', 
 'Science', 
 80
);
INSERT INTO ExamResult
VALUES
('Lily', 
 'english', 
 70
);
INSERT INTO ExamResult
VALUES
('Isabella', 
 'Maths', 
 50
);
INSERT INTO ExamResult
VALUES
('Isabella', 
 'Science', 
 70
);
INSERT INTO ExamResult
VALUES
('Isabella', 
 'english', 
 90
);
INSERT INTO ExamResult
VALUES
('Olivia', 
 'Maths', 
 55
);
INSERT INTO ExamResult
VALUES
('Olivia', 
 'Science', 
 60
);
INSERT INTO ExamResult
VALUES
('Olivia', 
 'english', 
 89
);
SELECT * FROM ExamResult;

/* Row_Number() */
/* We use ROW_Number() SQL RANK function to get a unique sequential number for each row in the specified data. It gives the rank one for the first row and then increments the value by one for each row. We get different ranks for the row having similar values as well.*/

/* it is same as indexing it give rank unique to each row and incremented by 1 in each row*/

SELECT Studentname, 
       Subject, 
       Marks, 
       ROW_NUMBER() OVER(ORDER BY Marks desc) RowNumber
FROM ExamResult;

SELECT FirstName,LastName,Salary,Row_Number() over(order by Salary desc) as Ranknum FROM Employees;

/* Rank() Function */
/* We use RANK() SQL Rank function to specify rank for each row in the result set. 
We have student results for three subjects. We want to rank the result of students as per their marks in the subjects.
For example, in the following screenshot, student Isabella got the highest marks in English subject and lowest marks in Maths subject.
As per the marks, Isabella gets the first rank in English and 3rd place in Maths subject.*/

SELECT Studentname, 
       Subject, 
       Marks, 
       RANK() OVER(PARTITION BY Studentname ORDER BY Marks DESC) Rank
FROM ExamResult
ORDER BY Studentname, 
         Rank;

SELECT Studentname,Subject, 
Marks,RANK() OVER(ORDER BY Marks DESC) Rank
FROM ExamResult
ORDER BY Rank;


SELECT JobId,Rank() over(order by Salary desc),Salary FROM Employees order by Salary desc



SELECT JobId,Rank() over(partition by JobId order by Salary desc),Salary FROM Employees order by Salary desc;

/* Dense_Rank()*/
/*We use DENSE_RANK() function to specify a unique rank number within the partition as per the specified column value. It is similar to the Rank function with a small difference.

In the SQL RANK function DENSE_RANK(), if we have duplicate values, SQL assigns different ranks to those rows as well. Ideally, we should get the same rank for duplicate or similar values.*/

SELECT Studentname, 
       Subject, 
       Marks, 
       Dense_Rank() OVER(ORDER BY Marks DESC) Rank
FROM ExamResult
ORDER BY Rank;

SELECT Studentname, 
       Subject, 
       Marks, 
       DENSE_RANK() OVER(PARTITION BY Subject ORDER BY Marks DESC) Rank
FROM ExamResult
ORDER BY Studentname, 
         Rank;


SELECT JobId,Dense_Rank() over(order by Salary desc),Salary FROM Employees order by Salary desc;


SELECT JobId,Dense_Rank() over(partition by JobId order by Salary desc),Salary FROM Employees order by Salary desc;

UPDATE Examresult set Marks=70 where Studentname='Isabella' and Subject='Maths'

SELECT Studentname, 
       Subject, 
       Marks, 
       RANK() OVER(PARTITION BY StudentName ORDER BY Marks) Rank
FROM ExamResult
ORDER BY Studentname, 
         Rank;

SELECT Studentname, 
       Subject, 
       Marks, 
       DENSE_RANK() OVER(PARTITION BY StudentName ORDER BY Marks) Rank
FROM ExamResult
ORDER BY Studentname, 
         Rank;


/* NTILE() Function*/

/*We use the NTILE(N) function to distribute the number of rows in the specified (N) number of groups.
Each row group gets its rank as per the specified condition.
We need to specify the value for the desired number of groups.
In my example, we have nine records in the ExamResult TABLE. 
The NTILE(2) shows that we require a group of two records in the result.*/

SELECT *, 
       NTILE(2) OVER(
       ORDER BY Marks DESC) Rank
FROM ExamResult
ORDER BY rank;

SELECT *, Ntile(10) over(order by Salary desc) FROM Employees;


SELECT FirstName,LastName,Salary,JobId, Ntile(10) over(partition by JobId order by Salary desc) FROM Employees order by Salary Desc;

/* Aggregate Functions */
/* this function performs calculation on a set of Values, and returns a single value*/
/* except FROM Count() aggrigate funs. ignor null value */
/* often used with the group by clause of SELECT statement*/

/*
SUM
Count
AVG
MAX
MIN 
*/

SELECT sum(Marks) as TotalMarks,min(marks) as MinMarks,max(marks) as MaxMarks,Count(*) as TotalSubjects,Avg(Marks) as avgMarks,(sum(marks)/count(*)) as Percentage,StudentName FROM ExamResult group by StudentName order by Avg(marks) desc;

SELECT sum(Marks) as TotalMarks,min(marks) as MinMarks,max(marks) as MaxMarks,Count(*) as TotalStudents,Avg(Marks) as avgMarks,(sum(marks)/count(*)) as Percentage,Subject FROM ExamResult group by Subject order by Avg(marks) desc;

/* group by */

/* A SELECT statement clause that divides the query result INTO groups of rows, usually for the purpose of performing one or more aggregations on each group. The SELECT statement returns one row per group. */

/* SELECT statement clause that divides the query result INTO groups of rows usually for the purpose of performing one or more aggregations on each group */

/* SELECT statement returns one row per group */

/* SELECT ColumnA, ColumnB FROM T GROUP BY ColumnA, ColumnB;  
SELECT ColumnA + ColumnB FROM T GROUP BY ColumnA, ColumnB;  
SELECT ColumnA + ColumnB FROM T GROUP BY ColumnA + ColumnB;  
SELECT ColumnA + ColumnB + constant FROM T GROUP BY ColumnA, ColumnB;  */

CREATE TABLE Sales ( Country VARCHAR(50), Region VARCHAR(50), Sales INT );

INSERT INTO sales VALUES (N'Canada', N'Alberta', 100);
INSERT INTO sales VALUES (N'Canada', N'British Columbia', 200);
INSERT INTO sales VALUES (N'Canada', N'British Columbia', 300);
INSERT INTO sales VALUES (N'United States', N'Montana', 100);

SELECT Country, Region, SUM(sales) AS TotalSales
FROM Sales
GROUP BY Country, Region;

SELECT Salary,JobId,sum(Salary) as SumSalary FROM Employees group by Salary,JobId;

/* group by rollup */

/* CREATEs a group for each combination of column expressions.
In addition, it "rolls up" the results INTO subtotals and grand totals. 
To do this, it moves FROM right to left decreasing the number of column expressions over which 
it CREATEs groups and the aggregation(s). */

/*
The column order affects the ROLLUP output and can affect the number of rows in the result set.

For example, GROUP BY ROLLUP (col1, col2, col3, col4) CREATEs groups for each combination of column expressions in the following lists.

col1, col2, col3, col4
col1, col2, col3, NULL
col1, col2, NULL, NULL
col1, NULL, NULL, NULL
NULL, NULL, NULL, NULL --This is the grand total
Using the TABLE FROM the previous example, this code runs a GROUP BY ROLLUP operation instead of a simple GROUP BY.
*/

SELECT Country, Region, SUM(Sales) AS TotalSales
FROM Sales
GROUP BY ROLLUP (Country, Region);


SELECT Salary,JobId,sum(Salary) as SumSalary FROM Employees group by rollup(JobId,Salary);

/* group by cube() */

/* GROUP BY CUBE CREATEs groups for all possible combinations of columns. 
For GROUP BY CUBE (a, b) the results has groups for unique values of (a, b), (NULL, b), (a, NULL), and (NULL, NULL). */

SELECT Country, Region, SUM(Sales) AS TotalSales
FROM Sales
GROUP BY CUBE (Country, Region);


SELECT Salary,JobId,sum(Salary) as SumSalary FROM Employees group by rollup(JobId,Salary);

/* group by Grouping sets */
/* The GROUPING SETS option gives you the ability to combine multiple GROUP BY clauses INTO one GROUP BY clause. 
The results are the equivalent of UNION ALL of the specified groups.
For example, GROUP BY ROLLUP (Country, Region) and GROUP BY GROUPING SETS ( ROLLUP (Country, Region) ) return the same results.
When GROUPING SETS has two or more elements, the results are a union of the elements. 
This example returns the union of the ROLLUP and CUBE results for Country and Region. */

SELECT Country, Region, SUM(Sales) AS TotalSales
FROM Sales
GROUP BY GROUPING SETS ( ROLLUP (Country, Region), CUBE (Country, Region) );

SELECT Country, Region, SUM(Sales) AS TotalSales
FROM Sales
GROUP BY ROLLUP (Country, Region)
UNION ALL
SELECT Country, Region, SUM(Sales) AS TotalSales
FROM Sales
GROUP BY CUBE (Country, Region);

/* having clause */
/* specified search condition for a group or an aggregate. having can be use only with SELECT statement.and only with group by clause 
*/

SELECT Country, Region, SUM(sales) AS TotalSales
FROM Sales
GROUP BY Country, Region having country in ('Canada','United States'); 


SELECT Country, SUM(sales) AS TotalSales
FROM Sales
GROUP BY Country having country in ('Canada','United States');

/* SELECT INTO */
SELECT * INTO marksgreterthen65 FROM ExamResult where marks>65 order by marks desc;

SELECT * FROM marksgreterthen65;



--TRAN COUNT
 
BEGIN TRAN  
    PRINT @@TRANCOUNT  
    BEGIN TRAN  
        PRINT @@TRANCOUNT  
ROLLBACK  
PRINT @@TRANCOUNT  

-- BINARY CHECKSUM

INSERT INTO Employees VALUES (21,'test');  
GO  
SELECT BINARY_CHECKSUM(*) FROM Employees;  
GO  
UPDATE Employees set Salary = 'TEST';  
GO  
SELECT BINARY_CHECKSUM(*) FROM Employees;  
GO

-- CONNECTIONPROPERTY

SELECT   
ConnectionProperty('JobID') AS 'Job_ID',   
ConnectionProperty('EmployeeID') AS 'Employee_ID';


-- CONTEXT INFO

SET CONTEXT_INFO 0x12111111111111;  
  
SELECT CONTEXT_INFO();  

-- CURRENT_TRANSACTION_ID();
SELECT CURRENT_TRANSACTION_ID();


SELECT SESSION_USER;

SELECT CONCAT ( 'Happy ', 'Birthday ', 11, '/', '25' ) AS Result;


SELECT * FROM employees
DECLARE @d DATE = GETDATE();  
SELECT FORMAT( @d, 'dd/MM/yyyy', 'en-US' ) AS 'HireDate'  
       ,FORMAT(1246444,'###-##-####') AS 'EmployeeID';