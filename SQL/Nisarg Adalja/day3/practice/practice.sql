
SELECT ASCII('C')

SELECT CONCAT(FirstName,' ',LastName) AS emname FROM Employees;

SELECT CHAR(66);

SELECT CHARINDEX('s','my microsoft server')

SELECT LEFT(FirstName,6) FROM Employees;

SELECT Right(FirstName,6) FROM Employees;
/* it give error bcz we have to pass column name in left and right fun. */
SELECT RIGHT("nisarg adalja",6);
SELECT left("nisarg adalja",6);

SELECT LEN(FirstName) FROM Employees;

SELECT LOWER(FirstName) FROM Employees;

SELECT UPPER(FirstName) FROM Employees;


SELECT LTRIM('    nisarg adalja');


SELECT RTRIM('nisarg adalja       ');


SELECT TRIM('    nisarg adalja         ');


SELECT REPLACE('nisarg adalja','nisarg','shreya');


SELECT LOWER(REVERSE(FirstName)) FROM Employees;


SELECT patindex('%ser%','this server is not MySql server');

/*quotename*/
/*Returns a Unicode string with the delimiters added to make the input string a valid SQL Server delimited identifier.*/

SELECT quotename('abc[]def');

/* it return starting index of substrig in the given string*/
SELECT patindex('%ser%','this server is not MySql server');

/*it retrun four char string. it use for checking similarity between 2 string */
SELECT SOUNDEX('mam'),SOUNDEX('maam')

SELECT soundex(FirstName),soundex(LastName) FROM Employees 

SELECT * FROM (SELECT soundex(FirstName) as fn,soundex(LastName) as ln FROM Employees) tb where fn <> ln;

/* stuff is same as replace but in this fun we can replace the substring FROM start and end index */
SELECT stuff('this is mysql server',9,5,'microsoft ')
SELECT stuff(FirstName,4,6,'adalja') FROM Employees

/* it return substring FROM starting index and end index*/
SELECT substring(FirstName,0,5) FROM Employees

/**it give unicode of first char of the String */
SELECT unicode(FirstName) FROM employees 

/* it replicate(duplicate) any string given number of time*/
SELECT replicate('$',10)
SELECT replicate('$',5)+FirstName+replicate('$',5) FROM Employees

/* It reverse the String and return */
SELECT reverse(Left(FirstName,6))  FROM Employees

/* It string-escape is used to find escape char in string */
SELECT STRING_ESCAPE('nisarg/t nisarg\t nisarg\\aneri nisarg//aneri', 'json') AS escapedText;  

/*STRING_AGG is an aggregate function that takes all expressions FROM rows and concatenates them INTO a single string.
Expression values are implicitly converted to string types and then concatenated*/

SELECT STRING_AGG (CONVERT(NVARCHAR(max),FirstName), CHAR(13)) AS csv 
FROM Employees;  

/*Returns a string of repeated spaces.*/
SELECT FirstName+ space(4) +LastName as empname FROM Employees

/*This function returns a string resulting FROM the concatenation, or joining, of two or more string values in an end-to-end manner. It separates those concatenated string values with the delimiter specified in the first function argument. */
SELECT CONCAT_WS(' $ ',FirstName,LastName) FROM Employees

/* Mathematicals functions */

/*ABS*/
/*A mathematical function that returns the absolute (positive) value of the specified numeric expression. (ABS changes negative values to positive values. ABS has no effect on zero or positive values.)*/

SELECT abs(-500.50)
SELECT abs(Salary) FROM Employees
SELECT abs(500.50)
SELECT abs(0)

/*ACOS
A function that returns the angle, in radians, whose cosine is the specified float expression. This is also called arccosine.*/
SELECT acos(cos(90))

/*Asin 
A function that returns the angle, in radians, whose sine is the specified float expression. This is also called arcsine.*/
SELECT asin(sin(90))

/*Atan
A function that returns the angle, in radians, whose tangent is a specified float expression. This is also called arctangent.*/
SELECT atan(tan(30)); 

/*Ceiling
This function returns the smallest integer greater than, or equal to, the specified numeric expression.*/
SELECT CEILING($123.45), CEILING($-123.45), CEILING($0.0);
SELECT ceiling(45.88),ceiling(45.99),ceiling(45.50),ceiling(44.50),ceiling(43.50)
SELECT ceiling(45.08)

/*cos
A mathematical function that returns the trigonometric cosine of the specified angle - measured in radians - in the specified expression.*/

SELECT cos(2.57)
SELECT cos(14.77)
SELECT cos(0.70710)

/*cot
A mathematical function that returns the trigonometric cotangent of the specified angle - in radians - in the specified float expression.*/

SELECT cot(60)

/*degrees
This function returns the corresponding angle, in degrees, for an angle specified in radians.*/
/*90 degree*/
SELECT degrees(1.57)

/* 45 */
SELECT degrees(0.785)

/* exp */
/*Returns the exponential value of the specified float expression.*/
SELECT exp(10)
SELECT exp(3.1420)

/*floor
Returns the largest integer less than or equal to the specified numeric expression. */
SELECT floor(45.55),floor(44.60)

/* Log
Returns the natural logarithm of the specified float expression in SQL Server.*/
SELECT log(10);
SELECT log(2);
SELECT log(3.14);

/* Log10
Returns the base-10 logarithm of the specified float expression.*/
SELECT log10(10)
SELECT log10(1000)

/*PI
Returns the constant value of PI.*/
SELECT PI();

/*Power
Returns the value of the specified expression to the specified power.*/

SELECT POWER(2,4),Power(3.5,3),power(2.33,6)

/*Radians
it convert degree INTO radians */
SELECT radians(30)
SELECT radians(60)
SELECT radians(45)
SELECT radians(90)

/* Rand
Returns a pseudo-random float value FROM 0 through 1, exclusive.
It give random float value between 0 to 1*/
SELECT rand();

/* ROUNDed
Returns a numeric value, ROUNDed to the specified length or precision. */

SELECT ROUND(755.55,1);
SELECT ROUND(754.45,1);
SELECT ROUND(748.58, -1);
SELECT ROUND(748.58, -2);
SELECT ROUND(748.58, -3);

/* SIGN
Returns the positive (+1), zero (0), or negative (-1) sign of the specified expression. */
SELECT sign(-100),sign(100),sign(0);

/* SIN
Returns the trigonometric sine of the specified angle, in radians, and in an approximate numeric, float, expression. */

SELECT sin(90)
SELECT sin(30)

/* SQRT
  Returns the square root of the specified float value. */
  SELECT sqrt(4);
  SELECT sqrt(100);
  SELECT sqrt(64);

/* SQUARE*/
/* Returns the square of the specified float value. */
SELECT square(4);
SELECT square(salary) FROM Employees order by salary desc;

/* TAN */
/* Returns the tangent of the input expression. */
SELECT tan(90);
SELECT tan(30);



/* System Functions */

/* $PARTITION */
/* Returns the partition number INTO which a set of partitioning column values would be mapped for any specified partition function in SQL Server.*/
/*
CREATE PARTITION FUNCTION RangePF2 ( INT )  
AS RANGE FOR VALUES (10, 100, 1000) ;  */

-- SELECT $PARTITION.RangePF2 (10); 
-- SELECT $PARTITION.RangePF2 (0);
-- SELECT $PARTITION.RangePF2 (5);
-- SELECT $PARTITION.RangePF2 (9);
-- SELECT $PARTITION.RangePF2 (11);  
-- SELECT $PARTITION.RangePF2 (40);  
-- SELECT $PARTITION.RangePF2 (50);
-- SELECT $PARTITION.RangePF2 (70);
-- SELECT $PARTITION.RangePF2 (90);
-- SELECT $PARTITION.RangePF2 (100);  

/* ERROR PROCEDURE */

/* This function returns the name of the stored procedure or trigger where an error occurs, if that error caused the CATCH block of a TRY...CATCH construct to execute. */

-- Verify that the stored procedure does not already exist.

IF OBJECT_ID ( 'usp_ExampleProc', 'P' ) IS NOT NULL   
    DROP PROCEDURE usp_ExampleProc;  
GO  
  
-- CREATE a stored procedure that   
-- generates a divide-by-zero error.  
CREATE PROCEDURE usp_ExampleProc  
AS  
    SELECT 1/0;  
GO  
  
BEGIN TRY  
    -- Execute the stored procedure inside the TRY block.  
    EXECUTE usp_ExampleProc;  
END TRY  
BEGIN CATCH  
    SELECT ERROR_PROCEDURE() AS ErrorProcedure;  
END CATCH;  
GO  

-- Verify that the stored procedure does not already exist.  
IF OBJECT_ID ( 'usp_ExampleProc', 'P' ) IS NOT NULL   
    DROP PROCEDURE usp_ExampleProc;  
GO  
  
-- CREATE a stored procedure that   
-- generates a divide-by-zero error.  
CREATE PROCEDURE usp_ExampleProc  
AS  
    SELECT 1/0;  
GO  
  
BEGIN TRY  
    -- Execute the stored procedure inside the TRY block.  
    EXECUTE usp_ExampleProc;  
END TRY  
BEGIN CATCH  
    SELECT   
        ERROR_NUMBER() AS ErrorNumber,  
        ERROR_SEVERITY() AS ErrorSeverity,  
        ERROR_STATE() AS ErrorState,  
        ERROR_PROCEDURE() AS ErrorProcedure,  
        ERROR_MESSAGE() AS ErrorMessage,  
        ERROR_LINE() AS ErrorLine;  
        END CATCH;  
GO

/* @@ERROR */
/* dout */
/* Using @@ERROR to detect a specific error*/

UPDATE EmployeePayHistory  
    SET PayFrequency = 4  
    WHERE BusinessEntityID = 1;  
IF @@ERROR = 547
    BEGIN
    PRINT N'A check CONSTRAINT violation occurred.';
    END
GO  

/* Using @@ERROR to conditionally exit a procedure */
/* dout */
-- Drop the procedure if it already exists.  
IF OBJECT_ID(N'HumanResources.usp_DeleteCandidate', N'P') IS NOT NULL  
    DROP PROCEDURE HumanResources.usp_DeleteCandidate;  
GO  
-- CREATE the procedure.  
CREATE PROCEDURE HumanResources.usp_DeleteCandidate   
    (  
    @CandidateID INT  
    )  
AS  
-- Execute the DELETE statement.  
DELETE FROM JobCandidate  
    WHERE JobCandidateID = @CandidateID;  
-- Test the error value.  
IF @@ERROR <> 0   
    BEGIN  
        -- Return 99 to the calling program to indicate failure.  
        PRINT N'An error occurred deleting the candidate information.';  
        RETURN 99;  
    END  
ELSE  
    BEGIN  
        -- Return 0 to the calling program to indicate success.  
        PRINT N'The job candidate has been deleted.';  
        RETURN 0;  
    END;  
GO  

/* Binary Checksum */
/* Returns the binary checksum value computed over a row of a TABLE or over a list of expressions. */

CREATE TABLE myTABLE (column1 INT, column2 VARCHAR(256));  
 
INSERT INTO myTABLE VALUES (1, 'test');  
  
SELECT BINARY_CHECKSUM(*) FROM myTABLE;  
  
UPDATE myTABLE set column2 = 'TEST';  
  
SELECT BINARY_CHECKSUM(*) FROM myTABLE;  
  
 /* Host Id */
 /* Returns the workstation identification number. The workstation identification number is the process ID (PID) of the application on the client computer that is connecting to SQL Server. */

 CREATE TABLE Orders  
   (OrderID     INT       PRIMARY KEY,    
    TerminalID  CHAR(8)   NOT NULL DEFAULT HOST_ID(),  
    OrderDate   DATETIME  NOT NULL,  
    ShipDate    DATETIME  NULL); 

/* CheckSum() */
/* The CHECKSUM function returns the checksum value computed over a TABLE row, or over an expression list. Use CHECKSUM to build hash indexes. */

/* Checksum ignores negative signature in numeric string */
/* dout */
SELECT CHECKSUM(N'2'), CHECKSUM(N'-2');
SELECT CHECKSUM(N'1'), CHECKSUM(N'-1');

ALTER TABLE Employees  
ADD cs_ename AS CHECKSUM(FirstName);  
GO  
CREATE INDEX Pname_index ON Employees (cs_ename);  
GO  
SELECT * FROM Employees




