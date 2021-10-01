--	ISJSON : ISJSON() is function to check wether syntax of json is valid or not.

	-- example
	DECLARE @json1 nvarchar(MAX)
	SET @json1 = '{"Name":"Parag","Department":"IT","ID":7048}'

	IF ISJSON(@json1) = 1
	PRINT 'Valid!!'

	ELSE
	PRINT 'Syntax Error' 

	--example
	DECLARE @json2 nvarchar(MAX)
	SET @json2 = '{"Student" : ["{"Name":"Parag","Department":"IT","ID":7048}"]}'

	IF ISJSON(@json2) = 1
	PRINT 'Valid!!'

	ELSE
	PRINT 'Syntax Error'	

--	JSON_VALUE : JSON_VALUE function use to extract scalar value from Json string.
	--  In JSON_VALUE we can use 'lax' and 'strict' for mode , 'stict' gives error if specified path not exist in JSON.

	-- example
	DECLARE @json3 nvarchar(MAX)
	SET @json3 = '{"Name":"Parag","Department":"IT","ID":7048}'

	IF ISJSON(@json3) = 1
	BEGIN
	SELECT JSON_VALUE(@json3,'strict$.Department') as 'Department Name'
	PRINT 'Valid!!'
	END
	ELSE
	PRINT 'Syntax Error' 

	-- example
	DECLARE @json4 nvarchar(MAX)
	SET @json4 = '{"Student" : [{"Name":"Parag","Dept":"IT","ID":7048},{"Name":"KETAN","Dept":"EC","ID":9021},{"Name":"JEEL","Dept":"CE","ID":7042}]}'

	IF ISJSON(@json4) = 1
	BEGIN
	SELECT JSON_VALUE(@json4,'lax$.Student[2].Dept') as 'Department Name'
	PRINT 'Valid!!'
	END
	ELSE
	PRINT 'Syntax Error' 	

	OR

	--example 
	DECLARE @json5 nvarchar(MAX)
	SET @json5 = '[{"Name":"Parag","Dept":"IT","ID":7048},{"Name":"KETAN","Dept":"EC","ID":9021},{"Name":"JEEL","Dept":"IT","ID":7042}]'

	IF ISJSON(@json5) = 1
	BEGIN
	SELECT JSON_VALUE(@json5,'$') as 'Test'
	PRINT 'Valid!!'
	END
	ELSE
	PRINT 'Syntax Error' 	

-- JSON_QUERY : JSON_QUERY function use to Extract Whole array or string form JSON file.
	--  In JSON_QUERY we can use 'lax' and 'strict' for mode , 'stict' gives error if specified path not exist in JSON.

	--example
	DECLARE @json6 nvarchar(MAX)
	SET @json6 = '{"Student" : [{"Name":"Parag","Dept":"IT","ID":7048},{"Name":"KETAN","Dept":"EC","ID":9021},{"Name":"JEEL","Dept":"CE","ID":7042}]}'

	IF ISJSON(@json6) = 1
	BEGIN
	SELECT JSON_QUERY(@json6,'strict$.Student[0]') as 'Full Data'
	PRINT 'Valid!!'
	END
	ELSE
	PRINT 'Syntax Error' 


	-- example
	DECLARE @json7 nvarchar(MAX)
	SET @json7 = '{"Student" : [{"Name":"Parag","Dept":"IT","ID":7048},{"Name":"KETAN","Dept":"EC","ID":9021},{"Name":"JEEL","Dept":"CE","ID":7042}]}'

	IF ISJSON(@json7) = 1
	BEGIN
	SELECT JSON_QUERY(@json7) as 'Full Data'
	PRINT 'Valid!!'
	END
	ELSE
	PRINT 'Syntax Error'    -- reurns Full Json Data

-- JSON_MODIFY() : JSON_MODIFY() function use to modifies data of JSON file.

	-- change value and add new property
	DECLARE @json8 nvarchar(MAX)
	SET @json8 = '{"Name":"Parag","Department":"IT","ID":7048}'

	IF ISJSON(@json8) = 1
	BEGIN
	SELECT JSON_MODIFY(@json8,'$.Name','JEEL') as 'Name'
	SELECT JSON_MODIFY(@json8,'$.Surname','Vadodariya') as 'new one'
	PRINT 'Valid!!'
	END
	ELSE
	PRINT 'Not Valid' 