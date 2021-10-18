USE Practice

--STRING FUNCTIONS

--ASCII ( character_expression )

SELECT ASCII('A')
SELECT ASCII('a')
SELECT ASCII('@')

--CHAR ( integer_expression )

SELECT CHAR(63)
SELECT CHAR(64)
SELECT CHAR(102)
SELECT CHAR(255)

--CHARINDEX ( expressionToFind , expressionToSearch [ , start_location ] )

SELECT CHARINDEX('m','This is My book')
SELECT CHARINDEX('i','This is My book',4)


--CONCAT ( string_value1, string_value2 [, string_valueN ] )

SELECT CONCAT('Hello',' Everyone')
SELECT CONCAT('Hello',55)

--CONCAT_WS ( separator, argument1, argument2 [, argumentN]... )
SELECT CONCAT_WS(',','Hello','Everyone')

--DIFFERENCE ( character_expression , character_expression )

SELECT DIFFERENCE('Hello','Everyone')
SELECT DIFFERENCE('Hello','Helo')
SELECT DIFFERENCE('Reach','Rich')

--FORMAT( value, format [, culture ] )
DECLARE @d DATE = '01/01/2000'
SELECT FORMAT(@d,'d','en-US')
SELECT FORMAT(@d,'D','en-US')
SELECT FORMAT(@d,'m','en-US')
SELECT FORMAT(@d,'M','en-US')
SELECT FORMAT(@d,'y','en-US')
SELECT FORMAT(@d,'Y','en-US')
SELECT FORMAT(@d,'d','de-de')
SELECT FORMAT(@d,'d','en-gb')
SELECT FORMAT(@d,'d','zn-ch')


--LEFT ( character_expression , integer_expression )

SELECT LEFT('Hello Everyone',5)
SELECT LEFT('Hello Everyone',6)
SELECT LEFT('Hello Everyone',8)

--LEN ( string_expression )

SELECT LEN('Hello')
SELECT LEN(555)

--LOWER ( character_expression )

SELECT LOWER('HEllo Everyone')

--LTRIM ( character_expression )

SELECT LTRIM('   Hello  Everyone')


--NCHAR ( integer_expression )

SELECT NCHAR(555)

--PATINDEX ( '%pattern%' , expression )

SELECT PATINDEX('%guj%','My state is Gujarat')

--QUOTENAME ( 'character_string' [ , 'quote_character' ] )

SELECT QUOTENAME('Hello Everyone','{')

--REPLACE ( string_expression , string_pattern , string_replacement )

SELECT REPLACE('Hello Everyone','Everyone','World')

--REPLICATE ( string_expression , integer_expression )

SELECT REPLICATE('#',5)


--REVERSE ( string_expression )

SELECT REVERSE('Hello')

--RIGHT ( character_expression , integer_expression )

SELECT RIGHT('Hello Everyone',5)

--RTRIM ( character_expression )

SELECT RTRIM('Hello       ')

--SOUNDEX ( character_expression )

SELECT SOUNDEX('Reach')
SELECT SOUNDEX('Rich')

--SPACE ( integer_expression )

SELECT 'Hello'+SPACE(5)+'Everyone'

--STR ( float_expression [ , length [ , decimal ] ] )

SELECT STR(123.456, 8, 3)

--STRING_AGG ( expression, separator ) [ <order_clause> ]

SELECT STRING_AGG(Name,CHAR(13)) FROM Demo4
SELECT STRING_AGG(Name,',') FROM Demo4

--STRING_ESCAPE( text , type )

SELECT STRING_ESCAPE('"Hello" "Everyone"','json')

--STUFF ( character_expression , start , length , replaceWith_expression )

SELECT STUFF('Hello Everyone',7,8,'World')

--SUBSTRING ( expression ,start , length )

SELECT SUBSTRING('Hello Everyone',7,8)

--TRANSLATE ( inputString, characters, translations)

SELECT TRANSLATE('Hello Everyone','e','a')

--TRIM ( [ characters FROM ] string )

SELECT TRIM('       Hello Everyone    ')

--UNICODE ( 'ncharacter_expression' )

SELECT UNICODE('Å')

--UPPER ( character_expression )

SELECT UPPER('Hello Everyone')


--DATE&TIME FUNCTIONS

--@@DATEFIRST

SELECT @@DATEFIRST
SET DATEFIRST 3
SELECT @@DATEFIRST
SET DATEFIRST 7
SELECT @@DATEFIRST

--CURRENT_TIMESTAMP

SELECT CURRENT_TIMESTAMP


--CURRENT_TIMEZONE ( )

SELECT CURRENT_TIMEZONE()

--CURRENT_TIMEZONE_ID ( )

SELECT CURRENT_TIMEZONE_ID()


--DATEADD (datepart , number , date )

SELECT DATEADD(DD,5,'02/01/2000')
SELECT DATEADD(MM,5,'02/01/2000')
SELECT DATEADD(YY,5,'02/01/2000')

--DATEDIFF ( datepart , startdate , enddate )

SELECT DATEDIFF(DD,'02/01/2000','03/01/2000')
SELECT DATEDIFF(MM,'02/01/2000','05/01/2000')
SELECT DATEDIFF(YY,'02/01/2000','03/01/2010')

--DATEDIFF_BIG ( datepart , startdate , enddate )

SELECT DATEDIFF(Mi,'01/01/0001','01/01/9999')
SELECT DATEDIFF_BIG(Mi,'01/01/0001','01/01/9999')

--DATEFROMPARTS ( year, month, day )

SELECT DATEFROMPARTS(2000,02,01)

--DATENAME ( datepart , date )

SELECT DATENAME(MM,'01/01/2000')
SELECT DATENAME(YY,'01/01/2000')
SELECT DATENAME(QQ,'01/01/2000')
SELECT DATENAME(QQ,'05/01/2000')
SELECT DATENAME(DY,'01/05/2000')
SELECT DATENAME(DD,'01/01/2000')
SELECT DATENAME(WK,'01/01/2000')
SELECT DATENAME(DW,'01/01/2000')
SELECT DATENAME(HH,'01/03/2000 12:55')
SELECT DATENAME(MI,'01/03/2000 12:55')
SELECT DATENAME(SS,'01/03/2000 12:55:45')
SELECT DATENAME(MS,'01/03/2000 12:55:45.37')
SELECT DATENAME(MCS,'01/03/2000 12:55:45.37')
SELECT DATENAME(NS,'01/03/2000 12:55:45.37')
SELECT DATENAME(TZ,'01/03/2000 12:55:45.37 +5:30')
SELECT DATENAME(ISOWK,'01/15/2020 12:55:45.37 +5:30')

--DATEPART ( datepart , date )

SELECT DATEPART(DD,'02/03/2000')
SELECT DATEPART(MM,'02/03/2000')
SELECT DATEPART(YY,'02/03/2000')

--DATETIME2FROMPARTS ( year, month, day, hour, minute, seconds, fractions, precision )

SELECT DATETIME2FROMPARTS(2000,03,04,3,15,22,2,1)

--DATETIMEFROMPARTS ( year, month, day, hour, minute, seconds, milliseconds )

SELECT DATETIMEFROMPARTS(2000,04,06,05,45,35,123)

--DATETIMEOFFSETFROMPARTS ( year, month, day, hour, minute, seconds, fractions, hour_offset, minute_offset, precision )

SELECT DATETIMEOFFSETFROMPARTS(2000,03,04,06,45,16,2,4,3,1)

--DAY ( date )

SELECT DAY('02/03/2000')

--EOMONTH ( start_date [, month_to_add ] )

SELECT EOMONTH('02/03/2000')
SELECT EOMONTH('02/03/2000',6)

--GETDATE()

SELECT GETDATE()

--GETUTCDATE()

SELECT GETUTCDATE()

--ISDATE ( expression )

SELECT ISDATE('02/03/2000')
SELECT ISDATE('02/03/20000')

--MONTH ( date )

SELECT MONTH('02/03/2000')

--SMALLDATETIMEFROMPARTS ( year, month, day, hour, minute )

SELECT SMALLDATETIMEFROMPARTS(2000,04,18,6,55)

--SWITCHOFFSET ( datetimeoffset_expression, timezoneoffset_expression )

SELECT SWITCHOFFSET(CONVERT(datetimeoffset, GETDATE()), '+05:30')

--SYSDATETIME ( )

SELECT SYSDATETIME()

--SYSDATETIMEOFFSET( )

SELECT SYSDATETIMEOFFSET()

--SYSUTCDATETIME ( )

SELECT SYSUTCDATETIME()

--TIMEFROMPARTS ( hour, minute, seconds, fractions, precision )

SELECT TIMEFROMPARTS(05,55,23,1,1)

--TODATETIMEOFFSET ( datetime_expression , timezoneoffset_expression )

SELECT TODATETIMEOFFSET(CONVERT(datetimeoffset, GETDATE()), '+05:30')

--YEAR ( date )

SELECT YEAR('02/03/2000')

--MATHS FUNCTIONS

--ABS ( numeric_expression )

SELECT ABS(00)
SELECT ABS(-29)
SELECT ABS(29)

--ACOS ( float_expression )

SELECT ACOS(-1.0)
SELECT ACOS(0)
SELECT ACOS(1.0)

--ASIN ( float_expression )

SELECT ASIN(-1.0)
SELECT ASIN(0)
SELECT ASIN(1.0)


--ATAN ( float_expression )

SELECT ATAN(-1.0)
SELECT ATAN(0)
SELECT ATAN(1.0)

--ATN2 ( float_expression , float_expression )

SELECT ATN2(45,45)
SELECT ATN2(45,0)

--CEILING ( numeric_expression )

SELECT CEILING(1.235)

--COS ( float_expression )

SELECT COS(0)
SELECT COS(45)
SELECT COS(90)

--COT ( float_expression )

SELECT COT(45)

--DEGREES ( numeric_expression )

SELECT DEGREES(0)
SELECT DEGREES(PI())

--EXP ( float_expression )

SELECT EXP(0)
SELECT EXP(10)
SELECT EXP(123.45)


--FLOOR ( numeric_expression )

SELECT FLOOR(1.234)
SELECT FLOOR(14.734)
 
--LOG ( float_expression [, base ] )

SELECT LOG(1)
SELECT LOG(2)
SELECT LOG(2,2)
SELECT LOG(10)


--LOG10 ( float_expression )

SELECT LOG10(1)
SELECT LOG10(2)
SELECT LOG10(10)

--PI ( )

SELECT PI()
SELECT PI()/2

--POWER ( float_expression , y )

SELECT POWER(2,3)

--RADIANS ( numeric_expression )

SELECT RADIANS(0)
SELECT RADIANS(90)
SELECT RADIANS(180)

--RAND ( [ seed ] )

SELECT RAND(100)
SELECT RAND(1345)

--ROUND ( numeric_expression , length [ ,function ] )


SELECT ROUND(112.678,0)
SELECT ROUND(112.678,1)
SELECT ROUND(112.678,2)
SELECT ROUND(112.678,2,0)
SELECT ROUND(112.678,2,1)

--SIGN ( numeric_expression )

SELECT SIGN(-123.45)
SELECT SIGN(0)
SELECT SIGN(123.45)

--SIN ( float_expression )

SELECT SIN(0)
SELECT SIN(45)
SELECT SIN(90)

--SQRT ( float_expression )

SELECT SQRT(25)
SELECT SQRT(100)

--SQUARE ( float_expression )

SELECT SQUARE(5)
SELECT SQUARE(9)
SELECT SQUARE(10)

--TAN ( float_expression )

SELECT TAN(0)
SELECT TAN(45)


--SYSTEM FUNCTIONS

--[ database_name. ] $PARTITION.partition_function_name(expression)

USE Practice;  
GO  
CREATE PARTITION FUNCTION RangePF1 ( INT )  
AS RANGE FOR VALUES (10, 20,45) ;  
GO  
SELECT $PARTITION.RangePF1 (Age) AS [Partition],COUNT(Age) AS NoOfCandidate,Age FROM Demo4  GROUP BY Age;  
GO

--@@ERROR

SELECT @@ERROR

--@@IDENTITY
INSERT INTO Demo (Name) VALUES ('abc2')

SELECT * FROM Demo
SELECT @@IDENTITY

--@@PACK_RECEIVED

SELECT @@PACK_RECEIVED

--@@ROWCOUNT
INSERT INTO Demo (Name) VALUES ('abc5'),('abc6')
SELECT @@ROWCOUNT

--@@TRANCOUNT

PRINT @@TRANCOUNT  

BEGIN TRAN  
    PRINT @@TRANCOUNT  
    BEGIN TRAN  
        PRINT @@TRANCOUNT  
ROLLBACK  
PRINT @@TRANCOUNT  

--BINARY_CHECKSUM ( * | expression [ ,...n ] )

SELECT BINARY_CHECKSUM(*) FROM Demo

--CHECKSUM ( * | expression [ ,...n ] )

SELECT CHECKSUM(*) FROM Demo

--COMPRESS ( expression )

SELECT COMPRESS('abcd')
SELECT COMPRESS(Name) FROM Demo

--CONNECTIONPROPERTY ( property )

SELECT CONNECTIONPROPERTY('net_transport')
SELECT CONNECTIONPROPERTY('protocol_type')
SELECT CONNECTIONPROPERTY('auth_scheme')
SELECT CONNECTIONPROPERTY('local_net_address')
SELECT CONNECTIONPROPERTY('local_tcp_port')
SELECT CONNECTIONPROPERTY('client_net_address')
SELECT CONNECTIONPROPERTY('physical_net_transport')
SELECT CONNECTIONPROPERTY('abc')


--CONTEXT_INFO()

SELECT CONTEXT_INFO()

SET CONTEXT_INFO 0x1256698456

--CURRENT_REQUEST_ID()

SELECT CURRENT_REQUEST_ID()

--CURRENT_TRANSACTION_ID( )

SELECT CURRENT_TRANSACTION_ID()

--DECOMPRESS ( expression )

SELECT COMPRESS('abc')
SELECT DECOMPRESS(COMPRESS('abc'))

--ERROR_LINE ( )

BEGIN TRY  
    SELECT 1/0;  
END TRY  
BEGIN CATCH  
    SELECT ERROR_LINE() AS ErrorLine;  
END CATCH;  


--ERROR_MESSAGE ( )

BEGIN TRY  
    SELECT 1/0;  
END TRY  
BEGIN CATCH  
    SELECT ERROR_MESSAGE() AS ErrorMessage;  
END CATCH;  

--ERROR_NUMBER ( )

BEGIN TRY  
    SELECT 1/0;  
END TRY  
BEGIN CATCH  
    SELECT ERROR_NUMBER() AS ErrorNumber;  
END CATCH;  

--ERROR_PROCEDURE ( )

CREATE PROCEDURE ErrorProc
AS  
    SELECT 1/0;  
  
BEGIN TRY  
    EXECUTE ErrorProc;  
END TRY  
BEGIN CATCH  
    SELECT ERROR_PROCEDURE() AS ErrorProcedure;  
END CATCH;  

--ERROR_SEVERITY ( )  

BEGIN TRY  
    SELECT 1/0;  
END TRY  
BEGIN CATCH  
    SELECT ERROR_SEVERITY() AS ErrorSeverity;  
END CATCH;  

--ERROR_STATE ( )

BEGIN TRY  
    SELECT 1/0;  
END TRY  
BEGIN CATCH  
    SELECT ERROR_STATE() AS ErrorState;  
END CATCH;  

--FORMATMESSAGE ( { msg_number  | ' msg_string ' | @msg_variable} , [ param_value [ ,...n ] ] )


SELECT text FROM sys.messages WHERE message_id = 20009 AND language_id = 1033;  
DECLARE @var1 VARCHAR(200);   
SELECT @var1 = FORMATMESSAGE(20009, 'First Variable', 'Second Variable');   
SELECT @var1;


SELECT FORMATMESSAGE('This is the %s and this is the %s.', 'first variable', 'second variable') AS Result;


DECLARE @msg VARCHAR(200) = (
SELECT text FROM sys.messages WHERE message_id = 20009 AND language_id = 1033 
)
SELECT @msg
SELECT FORMATMESSAGE(@msg, 'first variable', 'second variable') AS Result;


--GET_FILESTREAM_TRANSACTION_CONTEXT ()

SELECT GET_FILESTREAM_TRANSACTION_CONTEXT()

--GETANSINULL ( [ 'database' ] )

SELECT GETANSINULL('SqlDay2')
SELECT GETANSINULL('Practice')

--HOST_ID ()

SELECT HOST_ID()

--HOST_NAME ()

SELECT HOST_NAME()

--ISNULL ( check_expression , replacement_value )

SELECT ISNULL(123,0)
SELECT ISNULL(NULL,0)

--ISNUMERIC ( expression )

SELECT ISNUMERIC(123)
SELECT ISNUMERIC('123')
SELECT ISNUMERIC('abc')

--MIN_ACTIVE_ROWVERSION ( )

SELECT MIN_ACTIVE_ROWVERSION()

--NEWID ( )

SELECT NEWID()

--NEWSEQUENTIALID ( )

CREATE TABLE Abc
(
ID UNIQUEIDENTIFIER CONSTRAINT Abc_Id_Def DEFAULT NEWSEQUENTIALID(),
Name VARCHAR(30) CONSTRAINT Abc_Name_NotNull NOT NULL
)

INSERT INTO Abc (Name) VALUES ('aa'),('bb'),('cc')

SELECT * FROM Abc

--ROWCOUNT_BIG ( )

INSERT INTO Abc (Name) VALUES ('aa'),('bb'),('cc')
SELECT ROWCOUNT_BIG()

--SESSION_CONTEXT(N'key')

EXEC sp_set_session_context 'New Var', 5
SELECT SESSION_CONTEXT(N'New Var')

--XACT_STATE()

SELECT XACT_STATE()