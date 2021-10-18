USE [Day13 (JSON)]

-- Practice Exercise

--	Processing JSON

	--	ISJSON
		--	JSON_VALUE
		--	JSON_QUERY
		--	JSON_MODIFY
	--	Convert JSON collections to a rowset
		--	OPENJSON
	--Convert SQL Server data to JSON or export JSON
		--FOR JSON PATH	
		--FOR JSON AUTO
		--WITHOUT_ARRAY_WRAPPER



--	ISJSON : ISJSON() is function to check wether syntax of passed json is valid or not.
	
	-- ex
	DECLARE @json1 nvarchar(MAX)
	SET @json1 = '{"Name":"Uttam","Dept":"CE","Enroll":7082}'
	
	IF ISJSON(@json1) = 1
	PRINT 'Valid!!'
	
	ELSE
	PRINT 'Not Valid' -- Valid!!


	--ex
	DECLARE @json2 nvarchar(MAX)
	SET @json2 = '{"Student" : ["{"Name":"Uttam","Dept":"CE","Enroll":7082}"]}'
	
	IF ISJSON(@json2) = 1
	PRINT 'Valid!!'
	
	ELSE
	PRINT 'Not Valid'	-- Not Valid





--	JSON_VALUE : JSON_VALUE function use to extract scalar value from Json string.
			--  In JSON_VALUE we can use 'lax' and 'strict' for mode , 'stict' gives error if specified path not eist in JSON.

	-- ex
	DECLARE @json3 nvarchar(MAX)
	SET @json3 = '{"Name":"Uttam","Dept":"CE","Enroll":7082}'
	
	IF ISJSON(@json3) = 1
	BEGIN
	SELECT JSON_VALUE(@json3,'strict$.Dept') as 'Department'
	PRINT 'Valid!!'
	END
	ELSE
	PRINT 'Not Valid' -- Valid!!	




	-- ex
	DECLARE @json4 nvarchar(MAX)
	SET @json4 = '{"Student" : [{"Name":"Uttam","Dept":"CE","Enroll":7082},{"Name":"Sudip","Dept":"ME","Enroll":7080},{"Name":"Harsh","Dept":"IT","Enroll":7084}]}'
	
	IF ISJSON(@json4) = 1
	BEGIN
	SELECT JSON_VALUE(@json4,'lax$.Student[2].Dept') as 'Department'
	PRINT 'Valid!!'
	END
	ELSE
	PRINT 'Not Valid' -- Valid!!	

	OR

	--ex error
	DECLARE @json5 nvarchar(MAX)
	SET @json5 = '[{"Name":"Uttam","Dept":"CE","Enroll":7082},{"Name":"Sudip","Dept":"ME","Enroll":7080},{"Name":"Harsh","Dept":"IT","Enroll":7084}]'
	
	IF ISJSON(@json5) = 1
	BEGIN
	--SELECT JSON_VALUE(@json5,'$') as 'Name'
	PRINT 'Valid!!'
	END
	ELSE
	PRINT 'Not Valid' -- Valid!!	





-- JSON_QUERY : JSON_QUERY function use to Extract Whole array or string form JSON file.
			--  In JSON_QUERY we can use 'lax' and 'strict' for mode , 'stict' gives error if specified path not eist in JSON.

	--ex
	DECLARE @json6 nvarchar(MAX)
	SET @json6 = '{"Student":[{"Name":"Uttam","Dept":"CE","Enroll":7082},{"Name":"Sudip","Dept":"ME","Enroll":7080},{"Name":"Harsh","Dept":"IT","Enroll":7084}]}'
	
	IF ISJSON(@json6) = 1
	BEGIN
	SELECT JSON_QUERY(@json6,'strict$.Student[0]') as 'Array or String or object'
	PRINT 'Valid!!'
	END
	ELSE
	PRINT 'Not Valid' -- Valid!!	-- path specified 


	-- ex
	DECLARE @json7 nvarchar(MAX)
	SET @json7 = '{"Student":[{"Name":"Uttam","Dept":"CE","Enroll":7082},{"Name":"Sudip","Dept":"ME","Enroll":7080},{"Name":"Harsh","Dept":"IT","Enroll":7084}]}'
	
	IF ISJSON(@json7) = 1
	BEGIN
	SELECT JSON_QUERY(@json7) as 'Array or String or object'
	PRINT 'Valid!!'
	END
	ELSE
	PRINT 'Not Valid' -- Valid!!   -- reurns whole Json file







-- JSON_MODIFY() : JSON_MODIFY() function use to modifies data of JSON file.



	-- change value and add new property
	DECLARE @json8 nvarchar(MAX)
	SET @json8 = '{"Name":"Uttam","Dept":"CE","Enroll":7082}'
	
	IF ISJSON(@json8) = 1
	BEGIN
	SELECT JSON_MODIFY(@json8,'$.Name','Nisarg') as 'Name'
	SELECT JSON_MODIFY(@json8,'$.College','GECM') as 'new entry'

	PRINT 'Valid!!'
	--PRINT @json8 
	END
	ELSE
	PRINT 'Not Valid' 


	-- add new object to json
	DECLARE @json9 nvarchar(MAX)
	SET @json9 = '{"Student":[{"Name":"Uttam","Dept":"CE","Enroll":7082},{"Name":"Sudip","Dept":"ME","Enroll":7080},{"Name":"Harsh","Dept":"IT","Enroll":7084}]}'
	DECLARE @new1 nvarchar(MAX)
	SET @new1 = '{"Name":"Nisarg","Dept":"CE","Enroll":7088}'
	IF ISJSON(@json9) = 1 AND ISJSON(@new1) = 1
	BEGIN
	SELECT JSON_MODIFY(@json9,'append $.Student',JSON_QUERY(@new1)) as 'new entry'
	PRINT 'Valid!!'
	END
	ELSE
	PRINT 'Not Valid' -- Valid!!   





	--  Add new value to array
		
	DECLARE @json10 nvarchar(MAX)
	SET @json10 = '{"Student":[{"Name":"Uttam","Dept":["CE","ME","EC"],"Enroll":7082},{"Name":"Sudip","Dept":["ME","AE","EE"],"Enroll":7080},{"Name":"Harsh","Dept":["CE","ME","EE"],"Enroll":7084}]}'
	--DECLARE @new2 nvarchar(MAX)
	--SET @new2 = '{"Name":"Nisarg","Dept":"CE","Enroll":7088}'
	IF ISJSON(@json10) = 1 
	BEGIN
	SELECT JSON_MODIFY(@json10,'append $.Student[1].Dept','IT') as 'new entry'
	PRINT 'Valid!!'
	END
	ELSE
	PRINT 'Not Valid' -- Valid!!   






	-- add array as new property to student.uttam
	DECLARE @json11 nvarchar(MAX)
	SET @json11 = '{"Student":[{"Name":"Uttam","Dept":"CE","Enroll":7082},{"Name":"Sudip","Dept":"ME","Enroll":7080},{"Name":"Harsh","Dept":"IT","Enroll":7084}]}'
	DECLARE @new3 nvarchar(MAX)
	SET @new3 = N'["Cricket","Movies"]'
	IF ISJSON(@json11) = 1 AND ISJSON(@new3) = 1
	BEGIN
	SELECT JSON_MODIFY(@json11,'append $.Student[0].Hobbies',JSON_QUERY(@new3)) as 'new entry'
	PRINT 'Valid!!'
	END
	ELSE
	PRINT 'Not Valid' -- Valid!!   




-- replace value
	DECLARE @json12 nvarchar(MAX)
	SET @json12 = '{"Student":[{"Name":"Uttam","Dept":["CE","ME","EC"],"Enroll":7082},{"Name":"Sudip","Dept":["ME","AE","EE"],"Enroll":7080},{"Name":"Harsh","Dept":["CE","ME","EE"],"Enroll":7084}]}'
	DECLARE @new2 nvarchar(MAX)
	SET @new2 = '["IT","AE","EE","ME"]'
	IF ISJSON(@json12) = 1 
	BEGIN
	SELECT JSON_MODIFY(@json12,'$.Student[0].Dept',JSON_QUERY(@new2)) as 'new entry'
	PRINT 'Valid!!'
	END
	ELSE
	PRINT 'Not Valid' -- Valid!!   




	--  restrict to add new property to json
	
	DECLARE @json13 nvarchar(MAX)
	SET @json13 = '{"Student":[{"Name":"Uttam","Dept":"CE","Enroll":7082},{"Name":"Sudip","Dept":"ME","Enroll":7080},{"Name":"Harsh","Dept":"IT","Enroll":7084}]}'
	DECLARE @new4 nvarchar(MAX)
	SET @new4 = '["EC","CSE","AE","EE","ME","IT","CE"]'
	IF ISJSON(@json13) = 1 AND ISJSON(@new4) = 1
	BEGIN
	SELECT JSON_MODIFY(@json13,'strict $.Departments',JSON_QUERY(@new4)) as 'new entry' -- remove stict and it add new property Department after Student .
	PRINT 'Valid!!'
	END
	ELSE
	PRINT 'Not Valid' -- Valid!!   






--	Convert JSON collections to a rowset

	--	OPENJSON() : OPENJSON() function use to parse JSON in SQL.
			--	 It return jSO in Table Form with type of values.
			


	-- ex
	DECLARE @json14 nvarchar(MAX)
	SET @json14 = '{"Name":"Nisarg","Dept":"CE","Enroll":7088}'
	
	IF ISJSON(@json14) = 1
	BEGIN
	SELECT * FROM OPENJSON(@json14) 
			
	PRINT 'Valid!!'
	END
	ELSE
	PRINT 'Not Valid' -- Valid!!	

	--OR

	DECLARE @json15 nvarchar(MAX)
	SET @json15 = '[{"Name":"Uttam","Dept":"CE","Enroll":7082},{"Name":"Sudip","Dept":"ME","Enroll":7080},{"Name":"Harsh","Dept":"IT","Enroll":7084}]'
	
	IF ISJSON(@json15) = 1
	BEGIN
	SELECT * FROM OPENJSON(@json15) 
		WITH(
		FirstName varchar(25) '$.Name',
		DepARTMENT varchar(25) '$.Dept',
		eNROLL varchar(25) '$.Name'
			)
	PRINT 'Valid!!'
	END
	ELSE
	PRINT 'Not Valid' -- Valid!!	





	DECLARE @json16 nvarchar(MAX)
	SET @json16 = '{"Name":"Nisarg","Dept":"CE","Enroll":7088 , "Hobbies":["VolleyBall","Cricket","Series"]}'
	
	IF ISJSON(@json16) = 1
	BEGIN

	--SELECT * FROM OPENJSON(@json16) 

	--OR

	SELECT * FROM OPENJSON(@json16) 
	WITH (
		FirstName varchar(25) '$.Name',
		DepARTMENT varchar(25) '$.Dept',
		eNROLL varchar(25) '$.Name',
		Hobbies nvarchar(MAX) '$.Hobbies' AS JSON
		)


	SELECT FirstName, DepARTMENT,eNROLL,Hobbies,HobbiesName FROM OPENJSON(@json16) 
	WITH (
		FirstName varchar(25) '$.Name',
		DepARTMENT varchar(25) '$.Dept',
		eNROLL varchar(25) '$.Name',
		Hobbies nvarchar(MAX) '$.Hobbies' AS JSON)
		CROSS APPLY OPENJSON(Hobbies) WITH (HobbiesName varchar(20) '$')

		
	PRINT 'Valid!!'
	END
	ELSE
	PRINT 'Not Valid' -- Valid!!	






--Convert SQL Server data to JSON or export JSON
		--FOR JSON PATH	
		--FOR JSON AUTO

--  FOR JSON PATH : FOR JSON PATH use to convert result table into json object , FOR JSON AUTO is simillar to FOR JSON PATH.

	--
	SELECT * FROM Employees FOR JSON PATH

	-- with root
	SELECT * FROM Employees FOR JSON PATH , ROOT('Employee')

	-- with NULL
	SELECT * FROM Employees FOR JSON PATH , INCLUDE_NULL_VALUES


	--Nested output
	SELECT EmployeeID AS 'ID' , FirstName AS 'NAME.FirstName',LastName AS 'NAME.LastName' ,Email AS 'Contact.email',PhoneNumber AS 'Contact.phone' FROM Employees FOR JSON PATH , INCLUDE_NULL_VALUES


	--without array wrapper
		SELECT EmployeeID AS 'ID' , FirstName AS 'NAME.FirstName',LastName AS 'NAME.LastName' ,Email AS 'Contact.email',PhoneNumber AS 'Contact.phone' FROM Employees FOR JSON PATH , WITHOUT_ARRAY_WRAPPER
