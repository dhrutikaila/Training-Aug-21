/*String Function*/

SELECT CHAR(65) 

SELECT CHARINDEX('v', 'Rutvik')

SELECT CONCAT('Rutvik', 'Kalasha');

SELECT 'Rutvik' + '.Kalasha';

SELECT CONCAT_WS('.', 'www', 'Radixweb', 'com');

SELECT DIFFERENCE('smith', 'smit')

SELECT FORMAT(Dotnat engineer, '######-########');

SELECT LEFT('Rutvik Kalasha', 3)

SELECT LEN('Rutvik Kalasha')

SELECT DATALENGTH('Rutvik Kalasha');

SELECT LOWER('RUTVIK');

SELECT LTRIM('     Rutvik Kalasha');

SELECT NCHAR(65);

SELECT PATINDEX('%Rutvik%', 'kalasha Rutvik');

SELECT QUOTENAME('Rutvik');

SELECT REPLACE('Rutvik Kalasha', 'K', 'A');

SELECT REPLICATE('Rutvik', 3);

SELECT REVERSE('Rutvik Kalasha');

SELECT RIGHT('Rutvik Kalasha', 3)

SELECT RTRIM('Rutvik Kalasha     ')

SELECT SOUNDEX('Smith'), SOUNDEX('Smit');

SELECT SPACE(10)

SELECT STR(185);

SELECT STUFF('SQL Tutorial', 1, 3, 'HTML');

SELECT SUBSTRING('Rutvik Kalasha', 1, 3);

SELECT TRANSLATE('Monday', 'Monday', 'Sunday');

SELECT TRIM('     Rutvik Kalasha     ')

SELECT UNICODE('Rutvik');

SELECT UPPER('Rutvik Kalasha');

/*Mathematical Function*/

SELECT ABS(-6);

SELECT MOD(9,5);

SELECT SIGN(10);

SELECT FLOOR(5.7);

SELECT POWER(2,5);

SELECT ROUND(5.7);

SELECT SQRT(9);

SELECT ASIN(0);

SELECT ACOS(1);

SELECT ATAN(0);

SELECT SIN(0);

SELECT COS(0);

SELECT TAN(0);

/*Date Functions*/

SELECT NOW();

SELECT CURDATE();

SELECT CURTIME();