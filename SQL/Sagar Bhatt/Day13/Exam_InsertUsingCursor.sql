CREATE DATABASE Day13
USE Day13
GO

--- CREATE TABLE
CREATE TABLE Person(
		ID INT 
	,	Name VARCHAR(20)
	,	CONSTRAINT PkPersonID PRIMARY KEY(ID)
)

CREATE TABLE Skills(
		ID INT
	,	Skills VARCHAR(30)
	,	CONSTRAINT PkSkills PRIMARY KEY(ID,Skills)
	,	CONSTRAINT FkSkillsPersonID FOREIGN KEY(ID) REFERENCES Person(ID)
)

CREATE TABLE Qualification(
		ID INT
	,	Degree VARCHAR(30)
	,	Year INT
	,	Grade CHAR(1)
	,	CONSTRAINT FkQualificationPersonID FOREIGN KEY(ID) REFERENCES Person(ID)
)
GO

-- PROCEDURE

CREATE PROCEDURE uspJsonInsert
	@Data NVARCHAR(MAX)
AS
BEGIN
	IF ISJSON(@Data)> 0
	BEGIN
		SET NOCOUNT ON
			
		DECLARE @ID INT, @Name VARCHAR(30), @Skills VARCHAR(MAX), @Qualification VARCHAR(MAX)

		DECLARE CursorInsertPSQ CURSOR 
		SCROLL FOR
		SELECT * 
		FROM OPENJSON(@Data)
		WITH(
				ID INT 'strict $.ID'
			,	Name VARCHAR(30) 'strict $.Name'
			,	Skills NVARCHAR(MAX) N'strict $.Skills' AS JSON
			,	Qualification NVARCHAR(MAX) N'strict $.Qualification' AS JSON
		)

		OPEN CursorInsertPSQ

		IF @@CURSOR_ROWS>0
		BEGIN
				FETCH FIRST FROM CursorInsertPSQ INTO @ID,@Name,@Skills,@Qualification
			WHILE(@@FETCH_STATUS = 0)
			BEGIN
					
				INSERT INTO Person 
				VALUES(@ID,@Name)

				INSERT INTO Skills
				SELECT	@ID
					,	Skill
				FROM OPENJSON(@Skills)
				WITH(
					Skill VARCHAR(30) 'strict $'
				)

				INSERT INTO Qualification
				SELECT	@ID
					,	Degree
					,	Year
					,	Grade
				FROM OPENJSON(@Qualification)
				WITH(
						Degree VARCHAR(30) 'strict $.Degree'
					,	Year INT 'strict $.Year'
					,	Grade CHAR(1) 'strict $.Grade'
				)

				FETCH NEXT FROM CursorInsertPSQ INTO @ID,@Name,@Skills,@Qualification					
			END
		END

		CLOSE CursorInsertPSQ
		DEALLOCATE CursorInsertPSQ

		SET NOCOUNT OFF
	END
END
GO

DROP PROCEDURE uspJsonInsert
GO

DECLARE @DataJson NVARCHAR(MAX) =
'[
	{
	"ID":1,
	"Name":"Sagar",
	"Skills":[
		"C",
		"C++",
		"Java"
	],
	"Qualification":{
		"Degree":"MSC",
		"Year":2021,
		"Grade":"A"
		}
	},
	{
	"ID":2,
	"Name":"Harsh",
	"Skills":[
		"C",
		"Python",
		"Java"
	],
	"Qualification":{
		"Degree":"MCA",
		"Year":2021,
		"Grade":"B"
		}
	}
]'

EXEC uspJsonInsert @DataJson
GO

SELECT * FROM Person
SELECT * FROM Skills
SELECT * FROM Qualification
GO

DELETE FROM Skills
DELETE FROM Qualification
DELETE FROM Person
GO