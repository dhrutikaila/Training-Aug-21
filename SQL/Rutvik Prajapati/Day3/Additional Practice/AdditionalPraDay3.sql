--STRING FUNCTIONS:
--CONCAT_WS
SELECT CONCAT_WS('_','ADDITIONAL','PRACTICE','SQL')

--NCHAR 
SELECT NCHAR(143743);   --O/P:NULL
SELECT UNICODE(SUBSTRING('TRAINEE', 2, 1)),   
   NCHAR(UNICODE(SUBSTRING('TRAINEE', 2, 1))); 

--UNICODE
SELECT UNICODE(SUBSTRING('TRAINEE', 2, 1))

--Mathematical Functions:
--ABS  :  ABS changes negative values to positive values. 
		--ABS has no effect on zero or positive values.

	SELECT ABS(-10)

--EXP
SELECT EXP(10)

--ROUND
SELECT ROUND(125.12,1), ROUND(125.555,2), ROUND(125.75,2)

--SQUARE 
SELECT SQUARE(3.14),SQUARE(3)

--LOG : BASE e
SELECT LOG(10)

--LOG10 : BASE 10
SELECT LOG10(10)

--RAND
SELECT RAND() AS RANDOM_NUM


--System functions:

--HOST_ID AND HOST_NAME
SELECT HOST_ID(),HOST_NAME()

--ERROR LINE
SELECT ERROR_LINE()