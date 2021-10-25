
---- Mathematical Function ---

----- 1. ABS

---- Syntax: ABS ( numeric_expression )

SELECT ABS(-25.0), ABS(0.0), ABS(25.0);


DECLARE @i INT;  
SET @i = -2147483648;  
SELECT ABS(@i);  
GO


---- 2. ACOS

---- ACOS ( float_expression )

DECLARE @Cos FLOAT = 1.0;
SELECT 'ACOS of the number is: '+CONVERT(VARCHAR,ACOS(@Cos))

DECLARE @Cos FLOAT = -1.0;
SELECT 'ACOS of the number is: '+CONVERT(VARCHAR,ACOS(@Cos))


---- 3. ASIN

---- ASIN ( float_expression )

DECLARE @Sin FLOAT = -1.0
SELECT 'ACOS of the number is: '+CONVERT(VARCHAR,ASIN(@Sin))

DECLARE @Sin FLOAT = 1.0
SELECT 'ACOS of the number is: '+CONVERT(VARCHAR,ASIN(@Sin))


---- 4. ATAN

---- ATAN ( float_expression )

SELECT 'A ten of 0 is: '+CONVERT(VARCHAR,ATAN(0))
SELECT 'A ten of 90 is: '+CONVERT(VARCHAR,ATAN(90))
SELECT 'A ten of -55.5 is: '+CONVERT(VARCHAR,ATAN(-55.5))
SELECT 'A ten of 0.158: '+CONVERT(VARCHAR,ATAN(0.158))
SELECT 'A ten of 45 is: '+CONVERT(VARCHAR,ATAN(45))

---- 5. ATN2

---- ATN2 ( float_expression , float_expression )

DECLARE @x FLOAT = 35.175643, @y FLOAT = 129.44;  
SELECT 'The ATN2 of the angle is: ' + CONVERT(VARCHAR, ATN2(@y, @x));  
GO

---- 6. CEILING

---- CEILING ( numeric_expression )

SELECT CEILING(15.2),CEILING(-22.4),CEILING(75.9)

---- 7. COS

---- COS ( float_expression )

DECLARE @angle FLOAT;  
SET @angle = 90.0;  
SELECT 'The COS of the angle is: ' + CONVERT(VARCHAR,COS(@angle));  
GO


---- 8. COT

----COT ( float_expression )

DECLARE @angle FLOAT;  
SET @angle = 124.1332;  
SELECT 'The COT of the angle is: ' + CONVERT(VARCHAR, COT(@angle));  
GO


---- 9. DEGREES

---- DEGREES ( numeric_expression ) 

SELECT 'The number of degrees in PI/2 radians is: ' +   
CONVERT(VARCHAR, DEGREES((PI()/2)));  
GO


SELECT 'The number of degrees in PI radians is: ' +   
CONVERT(VARCHAR, DEGREES((PI())));  
GO


SELECT 'The number of degrees in 3PI/2 radians is: ' +   
CONVERT(VARCHAR, DEGREES((3*PI()/2)));  
GO


---- 10. EXPONENTIAL

---- EXP ( float_expression )

DECLARE @var FLOAT  
SET @var = 10  
SELECT 'The EXP of the variable is: ' + CONVERT(VARCHAR, EXP(@var))  
GO

DECLARE @var FLOAT  
SET @var = 20
SELECT 'The EXP of the variable is: ' + CONVERT(VARCHAR, EXP(@var))  
GO


---- 11. FLOOR

---- FLOOR ( numeric_expression )

SELECT FLOOR(25.45), FLOOR(-150.45), FLOOR($100.45);

----12. LOG

--- LOG ( float_expression [, base ] )  

DECLARE @var FLOAT = 10;  
SELECT 'The LOG of the variable is: ' + CONVERT(VARCHAR, LOG(@var,2));  
GO

DECLARE @var FLOAT = 10;  
SELECT 'The LOG of the variable is: ' + CONVERT(VARCHAR, LOG(@var,10));  
GO

SELECT LOG (EXP (15));

---- 13. LOG10

--- LOG10 ( float_expression )

DECLARE @var FLOAT;  
SET @var = 145.175643;  
SELECT 'The LOG10 of the variable is: ' + CONVERT(VARCHAR,LOG10(@var));  
GO


DECLARE @var FLOAT;  
SET @var = 20;  
SELECT 'The LOG10 of the variable is: ' + CONVERT(VARCHAR,LOG10(@var));  
GO

SELECT POWER (10, LOG10(5));
SELECT POWER (10, LOG10(15));

----- 14. PI()

SELECT PI()


---- 15. POWER()

DECLARE @input1 FLOAT;  
DECLARE @input2 FLOAT;  
SET @input1= 2;  
SET @input2 = 2.5;  
SELECT POWER(@input1, 3) AS Result1, POWER(@input2, 3) AS Result2;



DECLARE @value INT, @counter INT;  
SET @value = 2;  
SET @counter = 1;  
  
WHILE @counter < 5  
   BEGIN  
      SELECT POWER(@value, @counter)  
      SET NOCOUNT ON  
      SET @counter = @counter + 1  
      SET NOCOUNT OFF  
   END;  
GO

---- 16. RADIANS
  
DECLARE @angle FLOAT  
SET @angle = -45.01  
SELECT 'The RADIANS of the angle is: ' +  
   CONVERT(VARCHAR, RADIANS(@angle))  
GO  


DECLARE @angle FLOAT  
SET @angle = -181.01  
SELECT 'The RADIANS of the angle is: ' +  
   CONVERT(VARCHAR, RADIANS(@angle))  
GO  

 
DECLARE @angle FLOAT  
SET @angle = 0.00  
SELECT 'The RADIANS of the angle is: ' +  
   CONVERT(VARCHAR, RADIANS(@angle))  
GO  

  
DECLARE @angle FLOAT  
SET @angle = 0.1472738  
SELECT 'The RADIANS of the angle is: ' +  
    CONVERT(VARCHAR, RADIANS(@angle))  
GO  


DECLARE @angle FLOAT  
SET @angle = 197.1099392  
SELECT 'The RADIANS of the angle is: ' +  
   CONVERT(VARCHAR, RADIANS(@angle))  
GO


---17. RAND

SELECT RAND(100), RAND(), RAND()

SELECT RAND(100)

DECLARE @counter SMALLINT;  
SET @counter = 1;  
WHILE @counter < 5  
   BEGIN  
      SELECT RAND() Random_Number  
      SET @counter = @counter + 1  
   END;  
GO

--- 18. ROUND

SELECT ROUND(123.9994, 3), ROUND(123.9995, 3);  
GO

SELECT ROUND(150.75, 0);  
GO  
SELECT ROUND(150.75, 0, 1);  
GO

--- 19. SIGN

DECLARE @value REAL  
SET @value = -1  
WHILE @value < 2  
   BEGIN  
      SELECT SIGN(@value)  
      SET NOCOUNT ON  
      SELECT @value = @value + 1  
      SET NOCOUNT OFF  
   END  
SET NOCOUNT OFF  
GO

---- 20. SIN

DECLARE @angle FLOAT;  
SET @angle = 45.175643;  
SELECT 'The SIN of the angle is: ' + CONVERT(VARCHAR, SIN(@angle));  
GO

---- 21. SQRT

DECLARE @myvalue FLOAT;  
SET @myvalue = 1.00;  
WHILE @myvalue < 10.00  
   BEGIN  
      SELECT SQRT(@myvalue);  
      SET @myvalue = @myvalue + 1  
   END;  
GO

---- 22. SQUARE

DECLARE @h FLOAT, @r FLOAT;  
SET @h = 5;  
SET @r = 1;  
SELECT PI()* SQUARE(@r)* @h AS 'Cyl Vol';


---- 23. TAN

SELECT TAN(PI()/2);