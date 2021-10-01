--CREATING JSON
DECLARE @json NVARCHAR(MAX)
SET @json =
'[
	{
		"ID" : 1,
		"Name":"Chitrank",
		"Skills":["c++","PHP"],
		"Qualifications" : {
							"Degree":"BE",
							"Year":2021,
							"Grade":"A"
							}
	
	},
	{
		"ID" : 2,
		"Name":"Harsh",
		"Skills":["c++","sql"],
		"Qualifications" : {
							"Degree":"ME",
							"Year":2023,
							"Grade":"A"
							}
	}
]'

--INSERTING JSON DATA INTO MAIN TABLE 
INSERT INTO jsontable1 (ID,Name,Skills,Degree,Year,Grade)
SELECT ID,NAME,Skill,Degree,Year,Grade FROM 
OPENJSON(@json)
WITH
(
	ID INT '$.ID',
	NAME VARCHAR(20) '$.Name',
	Skills NVARCHAR(MAX) '$.Skills' AS JSON,
	Degree varchar(20) '$.Qualifications.Degree',
	Year INT '$.Qualifications.Year',
	Grade char(2) '$.Qualifications.Grade'
)
CROSS APPLY OPENJSON(Skills)
WITH (Skill varchar(20) '$')


--CREATING TABLES
CREATE TABLE Person
(
	ID INT PRIMARY KEY,
	Name VARCHAR(20) NOT NULL
)
CREATE TABLE Skills
(
	ID INT NOT NULL,
	Skills VARCHAR(15) NOT NULL,
	CONSTRAINT FK_Skills_ID FOREIGN KEY (ID) REFERENCES Person(ID)
)
CREATE TABLE Qualifications
(
	ID INT NOT NULL,
	Degree VARCHAR(15) NOT NULL,
	Year INT NOT NULL,
	Grade CHAR(2) NOT NULL,
	CONSTRAINT FK_Qualifications_ID FOREIGN KEY (ID) REFERENCES Person(ID)
)


--INSERTING DATA INTO EACH TABLE FROM jsontable1
INSERT INTO Person 
SELECT DISTINCT ID,Name FROM jsontable1

INSERT INTO Skills
SELECT ID,Skills FROM jsontable1

INSERT INTO Qualifications
SELECT DISTINCT ID,Degree,Year,Grade FROM jsontable1


--SELECT QUERY FOR EACH TABLE
SELECT * FROM Person
SELECT * FROM Skills
SELECT * FROM Qualifications

--------------------------------------------------------------------------------

/*QUERY TO GET TOTAL EXPERIENCE IN FORMAT YEARS.MONTHS*/
DECLARE @Variable datetime = '2020-09-09'
DECLARE @TotalMonths INT =DATEDIFF(MM,@Variable,GETDATE())
DECLARE @TotalYears INT = DATEDIFF(YY,@Variable,GETDATE())
SELECT CONCAT_WS('.',@TotalYears,@TotalMonths-@TotalYears*12)
--SELECT FORMAT(GETDATE()-@Variable,'y.M')

---------------------------------------------------------------------------------

/*QUERY TO GET TOTAL TIME DIFFERENCE BETWEEN TIME-IN AND TIME-OUT IN hh:mm:ss*/
DECLARE @TimeIn datetime = '10:30:10'
DECLARE @TimeOut datetime = '12:00:00'

SELECT FORMAT(@TimeOut-@TimeIn,'hh:mm:ss')
