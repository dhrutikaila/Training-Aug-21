SELECT name, 'was created on ', create_date, CHAR(13), name, 'is currently ', 
state_desc   
FROM sys.databases;  
GO

SELECT CHAR(13),name FROM sys.databases

select 'a'+char(13)+'b'


SELECT CAST(0x81F4 AS CHAR(2)) 

SELECT NCHAR(127925)

select 'a'+char(10)+'b'

SELECT CHARINDEX('S','MICROSOFT SERVER',7)

SELECT CHARINDEX('S','MICROSOFT SERVER',CHARINDEX('S','MICROSOFT SERVER')+1)

SELECT FORMAT(SYSDATETIME(), 'hh:mm tt'); -- returns 03:46 PM
SELECT FORMAT(SYSDATETIME(), 'hh:mm t'); -- returns 03:46 P

SELECT value FROM STRING_SPLIT('Lorem ipsum dolor sit amet.', ' ');

DECLARE @tags NVARCHAR(400) = 'clothing,road,,touring,bike'  
  
SELECT value  
FROM STRING_SPLIT(@tags, ',')  
WHERE RTRIM(value) <> '';


DECLARE @t time = GETDATE();   
SELECT DATENAME(Y, @t);