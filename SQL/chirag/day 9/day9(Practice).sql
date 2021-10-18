use new
--isjson() check the json is valid on not

DECLARE @DEMO NVARCHAR(MAX)
SET @DEMO ='[{"CustomerID":4,"CustomerName":"Around the Horn","Address":"120 Hanover Sq.","City":"London"}]'

IF(isjson(@DEMO) >0)
BEGIN
	PRINT 'VALID JSON'
END
ELSE
BEGIN
	PRINT 'NOT VALID JSON'
END

--JSON_MODIFY

use new
-- Update name  

DECLARE @DEMO NVARCHAR(MAX)
SET @DEMO ='{"CustomerID":4,"CustomerName":"jay","Address":"120 Hanover Sq.","City":"London"}'
SET @DEMO =JSON_MODIFY(@DEMO,'$.CustomerName','chirag')
PRINT @DEMO

--- INSERT
DECLARE @DEMO NVARCHAR(MAX)
SET @DEMO ='{"CustomerID":4,"CustomerName":"jay","Address":"120 Hanover Sq.","City":"London"}'
SET @DEMO =JSON_MODIFY(@DEMO,'$.Name','chirag')
PRINT @DEMO

-- delete

DECLARE @DEMO NVARCHAR(MAX)
SET @DEMO ='{"CustomerID":4,"CustomerName":"jay","Address":"120 Hanover Sq.","City":"London"}'
SET @DEMO =JSON_MODIFY(@DEMO,'$.CustomerName',NULL)
PRINT @DEMO

--json value

DECLARE @DEMO NVARCHAR(MAX)
SET @DEMO ='{"CustomerID":4,"CustomerName":"Around the Horn","Address":"120 Hanover Sq.","City":"London"}'
SELECT JSON_VALUE(@DEMO,'$.CustomerID')  

--- example
use new
SELECT  * FROM customers
SELECT CustomerID, CustomerName,  Address, City FROM customers where city='london'  for JSON PATH


DECLARE @DEMO NVARCHAR(MAX)
SET @DEMO ='[{"CustomerID":4,"CustomerName":"Around the Horn","Address":"120 Hanover Sq.","City":"London"},
			{"CustomerID":11,"CustomerName":"Bs Beverages","Address":"Fauntleroy Circus","City":"London"},
			{"CustomerID":16,"CustomerName":"Consolidated Holdings","Address":"Berkeley Gardens 12 Brewery","City":"London"},
			{"CustomerID":19,"CustomerName":"Eastern Connection","Address":"35 King George","City":"London"},
			{"CustomerID":53,"CustomerName":"North\/South","Address":"South House 300 Queensbridge","City":"London"},
			{"CustomerID":72,"CustomerName":"Seven Seas Imports","Address":"90 Wadhurst Rd.","City":"London"}]'


INSERT INTO democustomer SELECT * FROM OPENJSON(@DEMO)

WITH
(
CustomerID int ,
  CustomerName varchar(255) ,
  Address varchar(255) ,
  City varchar(255) 
  )



