SELECT ASCII('A') AS A, ASCII('B') AS B,   
ASCII('a') AS a, ASCII('b') AS b,  
ASCII(1) AS [1], ASCII(2) AS [2];


SELECT ASCII('PIYUSH')

SELECT CHAR(234)

SELECT CHARINDEX('t', 'THAKUR') 

SELECT CONCAT('SQL', ' ', 'is', ' ', 'fun!')

SELECT CONCAT('SQL',  'is', 'fun!')

SELECT 'SQL' + ' ' + 'is' + ' ' + 'fun!'

SELECT 'SQL' +  'is' +'fun!'

SELECT CONCAT_WS('&', 'SQL', ' is', ' fun!')

SELECT DATALENGTH('  PIYUSH                ')

SELECT DIFFERENCE('Juice', 'Banana')

SELECT DIFFERENCE('Juice', 'Jucy')

SELECT DIFFERENCE('THAKUR', 'PIYUSH')

SELECT DIFFERENCE('PIPU', 'PIYU')

SELECT FORMAT(123456789, '##-##-##-###')


SELECT LEFT('SQL Tutorial', 1) AS ExtractString
SELECT LEFT('PIYUSH OMKARSINGH ', 6) AS ExtractString
SELECT LEN('2017-0899999')
SELECT NCHAR(65)
SELECT NCHAR(60)

SELECT PATINDEX('%[z]%', 'W3Schools.com')
SELECT PATINDEX('%[YU]%', 'PIYUSH')
SELECT QUOTENAME('abcdef', '()')


SELECT QUOTENAME('abc[]def')
SELECT REPLACE('ABC ABC ABC', 'a', 'c')

SELECT REPLACE('ABCD ABCD ABCD', 'AB','EF')

SELECT REPLICATE('SQL Tutorial', 5)

SELECT REPLICATE('PIYUSH THAKUR', 5)

SELECT REVERSE('PIYUSH THAKUR')

SELECT RIGHT('SQL Tutorial', 6) AS ExtractString
SELECT SOUNDEX('Juice'), SOUNDEX('Banana')
SELECT SPACE(10)

SELECT STR(185.47446, 8, 3)

SELECT STR(185.5)

SELECT STUFF('SQL Tutorial!', 13, 5, ' is fun!')



SELECT SUBSTRING('SQL Tutorial', 1, 3) AS ExtractString

SELECT TRANSLATE('3*[2+1]/{8-4}', '[]{}', '()()')// Results in 3*(2+1)/(8-4)

SELECT TRANSLATE('Monday', 'PIYUSH', 'THAKUR')

SELECT UNICODE('Atlanta')

SELECT UNICODE('P')
------MATHS
SELECT Abs(-243.5) AS AbsNum
	SELECT CEILING(25.75) 
	SELECT CEILING(25.25)
	SELECT CEILING(25) AS CeilValue


 -- SELECT COUNT(AddressID) AS NumberOfProducts FROM SalesLT.Address



































































































