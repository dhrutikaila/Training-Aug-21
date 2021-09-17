--Processing JSON
	--ISJSON
	DECLARE @jsondata NVARCHAR(MAX)

	SET @jsondata='[{"name":"John","surname":"Doe","age":45,"skills":["SQL","C#","MVC"]},
				{"name":"Krupal","surname":"thakkar","age":20,"skills":["c","C+","MVC"]}]';
	
	IF ISJSON(@jsondata)>0
	SELECT * FROM OPENJSON(@jsondata)
	WITH(
	Name VARCHAR(20) '$.name',
	Surname VARCHAR(20) '$.surname',
	Age INT '$.age',
	Skills VARCHAR(30) '$.skills[0]'
	)
	--JSON_VALUE
	DECLARE @jsondata NVARCHAR(MAX)

	SET @jsondata='[{"name":"John","surname":"Doe","age":45,"skills":["SQL","C#","MVC"]},
				{"name":"Krupal","surname":"thakkar","age":20,"skills":["c","C+","MVC"]}]';

	DECLARE @TEMP VARCHAR(20)
	SET @TEMP=JSON_VALUE(@jsondata,'$[0].skills[0]');
	SELECT @TEMP
	--JSON_QUERY
	USE EMPDB
	SELECT StudentName,Address,City,
	JSON_QUERY(StudentDetail,'$[0]') AS SDetialName
	FROM Students

	
	--JSON_MODIFY
	UPDATE Students
	set StudentDetail = JSON_MODIFY(StudentDetail,'$[0].name','Karan')
	where Id = 1

	UPDATE Students
	set StudentDetail = JSON_MODIFY(StudentDetail,'$[0].age',23)
	where Id = 1

	select * from Students
--Convert JSON collections to a rowset
	--OPENJSON
	USE EMPDB

	DECLARE @jsondata NVARCHAR(MAX)

	SET @jsondata='[{"name":"John","surname":"Doe","age":45,"skills":["SQL","C#","MVC"]},
				{"name":"Krupal","surname":"thakkar","age":20,"skills":["c","C+","MVC"]}]';

	SELECT *
	FROM OPENJSON(@jsondata);
	------------------------------
	DECLARE @jsondata NVARCHAR(MAX)

	SET @jsondata='[{"name":"John","surname":"Doe","age":45,"skills":["SQL","C#","MVC"]},
				{"name":"Krupal","surname":"thakkar","age":20,"skills":["c","C+","MVC"]}]';

	SELECT * FROM OPENJSON(@jsondata)
	WITH(
	Name VARCHAR(20) '$.name',
	Surname VARCHAR(20) '$.surname',
	Age INT '$.age',
	Skills VARCHAR(30) '$.skills[0]'
	)
	------------------------------
--Convert SQL Server data to JSON or export JSON
	--FOR JSON PATH
	USE EMPDB
	SELECT * FROM Students c

	--FOR JSON AUTO
	USE EMPDB
	SELECT * FROM Students FOR JSON AUTO

	--WITHOUT_ARRAY_WRAPPER
	USE EMPDB
	SELECT * FROM Students FOR JSON PATH, WITHOUT_ARRAY_WRAPPER