1-->Processing JSON
--->ISJSON

		DECLARE @json NVARCHAR(MAX);
		SET @json = '{"info": {"address": [{"town": "Belgrade"}, {"town": "Paris"}, {"town":"Madrid"}]}}';
		IF(ISJSON(@json)>0)
		   PRINT 'is json'
		ELSE
		  PRINT 'ERROR IN JSON'

--->JSON_VALUE
        
		DECLARE @jsonInfo NVARCHAR(MAX)

		SET @jsonInfo=N'{  
			 "info":{    
			   "type":1,  
			   "address":{    
				 "town":"Bristol",  
				 "county":"Avon",  
				 "country":"England"  
			   },  
			   "tags":["Sport", "Water polo"]  
			},  
			"type":"Basic"  
		 }'  

		PRINT JSON_VALUE(@jsonInfo,'$.info.address.town')  
		PRINT JSON_VALUE(@jsonInfo,'$.info.tags[0]')  



--->JSON_QUERY

		DECLARE @data NVARCHAR(4000);
		SET @data = N'{
		"employees":
		[      {
				 "name":"Raj",
				 "email":"raj@gmail.com",
				 "age":32
          
		},
			  {
				 "name":"Mohan",
				 "email":"Mohan@yahoo.com",
				 "age":21
          
				}   
		]
		}';

		SELECT JSON_QUERY(@data, '$.employees[0]') AS 'Result';



--->JSON_MODIFY


		DECLARE @info NVARCHAR(100)='{"name":"John","skills":["C#","SQL"]}'
		PRINT @info

	-- Update name  

		SET @info=JSON_MODIFY(@info,'$.name','Mike')
		PRINT @info

	-- Insert surname  

		SET @info=JSON_MODIFY(@info,'$.surname','Smith')
		PRINT @info

	-- Delete name  

		SET @info=JSON_MODIFY(@info,'$.name',NULL)
		PRINT @info

	-- Add skill  

		SET @info=JSON_MODIFY(@info,'append $.skills','Azure')
        PRINT @info



2-->Convert JSON collections to a rowset

--->OPENJSON 
    -->1
		DECLARE @json NVARCHAR(MAX)
        SET @json='{"name":"John","surname":"Doe","age":45,"skills":["SQL","C#","MVC"]}';

		SELECT * FROM OPENJSON(@json)

    -->2
		DECLARE @json NVARCHAR(MAX)
		SET @json =   
		  N'[  
			   {  
				 "Order": {  
				   "Number":"SO43659",  
				   "Date":"2011-05-31T00:00:00"  
				 },  
				 "AccountNumber":"AW29825",  
				 "Item": {  
				   "Price":2024.9940,  
				   "Quantity":1  
				 }  
			   },  
			   {  
				 "Order": {  
				   "Number":"SO43661",  
				   "Date":"2011-06-01T00:00:00"  
				 },  
				 "AccountNumber":"AW73565",  
				 "Item": {  
				   "Price":2024.9940,  
				   "Quantity":3  
				 }  
			  }  
		 ]'  
   
		SELECT * FROM  
		OPENJSON ( @json )  
		WITH (   
					  Number   varchar(200) '$.Order.Number' ,  
					  Date     datetime     '$.Order.Date',  
					  Customer varchar(200) '$.AccountNumber',  
					  Price    varchar(200) '$.Item.Price',
					  Quantity int          '$.Item.Quantity'
		 )     

-->Convert SQL Server data to JSON or export JSON
--->FOR JSON PATH
    SELECT * FROM Employees FOR JSON PATH

--->FOR JSON AUTO
    SELECT * FROM Employees FOR JSON AUTO

--->WITHOUT_ARRAY_WRAPPER	 
    
-->
	SELECT 2015 as year, 12 as month, 15 as day  
	FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
	
-->
	SELECT * FROM Employees 
	FOR JSON PATH, WITHOUT_ARRAY_WRAPPER 

-->
    SELECT TOP 3 SalesOrderNumber, OrderDate, Status  
	FROM Sales.SalesOrderHeader  
	ORDER BY ModifiedDate  
	FOR JSON PATH, WITHOUT_ARRAY_WRAPPER 

	