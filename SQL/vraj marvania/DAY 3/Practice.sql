--->String Functions

	--ASCII
	SELECT ASCII('A'), ASCII('C') , ASCII('B')

	--CHAR
	SELECT CHAR(65)

	--CHARINDEX
	SELECT CHARINDEX('World','Hello World'),CHARINDEX('World','Hello World',8)

	--CONCAT
	SELECT CONCAT('Hello',' World')

	--CONCAT_WS
	--allows specify a separator between the concatenated 
	SELECT CONCAT_WS(',','United States','New York')

	--SOUNDEX
	SELECT SOUNDEX('H'), SOUNDEX('He'), SOUNDEX('Hello'), SOUNDEX('Hello World')

	--DIFFERENCE
	SELECT DIFFERENCE('HELLO','LL'), DIFFERENCE('HELLO', 'HELLO WORLD')

	--LEFT, RIGHT
	SELECT LEFT('Hello World',5) , RIGHT('Hello Wolrd',5)

	--LOWER, UPPER
	SELECT LOWER('Hello World') , UPPER('Hello World')

	--LTRIM, RTRIM
	SELECT RTRIM('Hello  ') , LTRIM('    World')

	--LEN
	SELECT LEN('HELLO'),LEN(23)

	--REVERSE
	SELECT REVERSE('ABC')

	--REPLICATE
	SELECT REPLICATE('ABC',2)

	--TRIM
	SELECT TRIM(' ABCD ')

	--SUBSTRING
	SELECT SUBSTRING('SQL Tutorial', 1, 3) AS ExtractString

	--STUFF
	SELECT STUFF('SQL Tutorial', 1, 3, 'HTML')

	--FORMAT
	SELECT FORMAT(123456789, '##-##-#####');

	--PATINDEX
	SELECT PATINDEX('%schools%', 'W3Schools.com');

	--SPACE
	SELECT SPACE(10)

	--STR
	SELECT STR(185)

	--STUFF
	--Delete 3 characters from a string, starting in position 1, and then insert "HTML" in position 1:
	SELECT STUFF('SQL Tutorial', 1, 3, 'HTML');


--->Date Functions

	--CURRENT_TIMESTAMP
	SELECT CURRENT_TIMESTAMP

	--DATEADD
	SELECT DATEADD(year, 1, '2017/08/25') AS DateAdd;

	--DATEDIFF
	SELECT DATEDIFF(year, '2017/08/25', '2011/08/25') AS DateDiff;
	SELECT DATEDIFF(month, '2017/08/25', '2011/08/25') AS DateDiff;
	SELECT DATEDIFF(day, '2017/08/25', '2011/08/25') AS DateDiff;


	--DATEFROMPARTS
	SELECT DATEFROMPARTS(2018, 10, 31) AS DateFromParts;

	--DATENAME
	SELECT DATENAME(year, '2017/08/25') AS DatePartString;
	SELECT DATENAME(month, '2017/08/25') AS DatePartString;
	SELECT DATENAME(day, '2017/08/25') AS DatePartString;

	--DATEPART
	SELECT DATEPART(year, '2017/08/25') AS DatePartInt;
	SELECT DATEPART(day, '2017/08/25') AS DatePartInt;
	SELECT DATEPART(month, '2017/08/25') AS DatePartInt;

	--day
	SELECT DAY('2017/08/25') AS DayOfMonth;

	--GETDATE
	SELECT GETDATE();

	--GETUTCDATE
	SELECT GETUTCDATE();

	--ISDATE
	SELECT ISDATE('2017-08-25');

	--MONTH
	SELECT MONTH('2017/08/25') AS Month;

	--SYSDATETIME
	SELECT SYSDATETIME() AS SysDateTime;

	--YEAR
	SELECT YEAR('2017/08/25') AS Year;


--->Mathematical Functions
	--Return the absolute value of a number
	SELECT Abs(-243.5) AS AbsNum;

	--ACOS
	SELECT ACOS(0.25)

	--AVG
	SELECT AVG(Price) AS AveragePrice FROM Products

	--CEILING Return the smallest integer value that is greater than or equal to a number:
	SELECT CEILING(25.75) AS CeilValue;

	--COUNT
	SELECT COUNT(ProductID) AS NumberOfProducts FROM Products;

	--SUM
	SELECT SUM(Price) AS AveragePrice FROM Products

	--SQUARE
	SELECT SQUARE(64);

	--SQRT
	SELECT SQRT(64);

	--ROUND
	--Round the number to 2 decimal places:
	SELECT ROUND(235.415, 2) AS RoundValue;

	--POWER
	SELECT POWER(4, 2);

	--PI
	SELECT PI();

	--LOG10
	SELECT LOG10(2);

	--LOG
	SELECT LOG(2);

	--FLOOR
	SELECT FLOOR(25.75) AS FloorValue;
	--MIN
	SELECT MIN(Price) AS SmallestPrice FROM Products;

	--MAX
	SELECT MAX(Price) AS LargestPrice FROM Products;


--->System functions

	--APP_NAME
	SELECT APP_NAME()

	--CAST
	SELECT 1 + CAST(1 AS INT) result;

	--CONVERT
	SELECT CONVERT(INT, 9.95) result;

	--CHOOSE
	SELECT CHOOSE(2, 'First', 'Second', 'Third') Result;

	--ISNULL
	SELECT ISNULL(NULL,20) result;

	--ISNUMERIC
	SELECT ISNUMERIC('$10') result;

	--IIF
	SELECT IIF(10 < 20, 'True', 'False') Result ;

	--CASE
	SELECT 
		CASE
			WHEN TRY_CAST('test' AS INT) IS NULL
			THEN 'Cast failed'
			ELSE 'Cast succeeded'
		END AS Result;

	--CONVERT
	SELECT CONVERT(DATE, GETDATE()) date;

	--TRY_PARSE
	SELECT TRY_PARSE('14 April 2019' AS date) result;