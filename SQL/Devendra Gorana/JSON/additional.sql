--[{"ID" : 1, "Name" : "Rita", Skill : ["C", "C++", "Java"], 
--"Qualification" :{"Degree":"MSC","Year":2021,"Grade":"A"}
--Person
--Skills
--Qulification

/*
[
{"ID"=1,"Name":"Rita',"Skills":["C","C++","Java"],"Qualification":"MSC","Year":2021,"Grade":"A"}
]
*/
--Create Person Table
CREATE TABLE Person (ID int PRIMARY KEY, Names Varchar(30))
--Create Skills Table
CREATE TABLE Skills (ID int FOREIGN KEY REFERENCES Person(ID), Skill Varchar(30))
--Create Qulification Table
CREATE TABLE Qulification (ID int FOREIGN KEY REFERENCES Person(ID), Degree Varchar(30), [Year] int, Grade Varchar(3))

--SELECT Person.ID, Person.Names, Skills.Skill,Qulification.Degree, Qulification.Year,Qulification.Grade FROM Person, Skills, Qulification FOR JSON PATH
----------------------------------------------------------------------------------------------------------
CREATE TABLE TempTable(ID int, Names Varchar(30), Skill Varchar(30), Degree Varchar(30), [Year] int, Grade Varchar(3))

DECLARE @Json Nvarchar(Max)
SET @json = '{"ID":2,"Names":"Dev","Skill":"c++","Degree":"Bsc","Year":2020,"Grade":"A"}';

INSERT INTO TempTable
SELECT ID, Names, Skill, Degree, [Year], Grade
FROM OPENJSON(@json)
WITH
(
ID int '$.ID',
Names Varchar(30) '$.Names', 
Skill Varchar(30) '$.Skill', 
Degree Varchar(30) '$.Degree',
[Year] int '$.Year', 
Grade Varchar(3) '$.Grade'
)
GO

SELECT * FROM TempTable
INSERT INTO Person (ID, Names) SELECT ID, Names FROM TempTable
INSERT INTO Skills (ID, Skill) SELECT ID, Skill FROM TempTable
INSERT INTO Qulification (ID, Degree, [Year], Grade) SELECT ID, Degree, [Year], Grade FROM TempTable
DROP TABLE TempTable
------------------------------------------------------------------------------------------------------
SELECT * FROM Person
SELECT * FROM Skills
SELECT * FROM Qulification

