--Create a batch Select Banking as ‘Bank Dept’, Insurance as ‘Insurance Dept’ and Services as ‘Services Dept’ from employee table
SELECT *,CASE Department 
WHEN 'Banking'  THEN 'Bank_Dept'
WHEN 'Insurence' THEN 'Insurance_Dept'
WHEN 'Services' THEN 'Services_Dept'
END 
FROM Employee1
GO

--5 Students Name, Address, City, DOB, Standard need to be inserted in the student table, need to fetch these result from json variable. and select output in the json format
DECLARE @Info NVARCHAR(MAX)
SET @Info='[{"Name":"James Cole","ADDRESS":"22nd street","City":"Manhattan","DOB":"2008-06-01","Standard":11},
            {"Name":"Anna Fehya","ADDRESS":"Judges Bunglow","City":"Miami","DOB":"2007-02-01","Standard":12},
			{"Name":"Anna hellapeya","ADDRESS":"Long island","City":"Athens","DOB":"2005-06-06","Standard":9},
			{"Name":"Hrufna victorsdottir","ADDRESS":"Nuuk","City":"Reykjavik","DOB":"2006-06-06","Standard":10},
			{"Name":"Prona Grufunsdottir","ADDRESS":"Downtown","City":"Reykjavik","DOB":"2006-07-07","Standard":10}]'   

 
SELECT * INTO InfoTable FROM(
SELECT * FROM OPENJSON(@Info)
WITH
(
    Name VARCHAR(30) '$.Name',
    Address VARCHAR(100) '$.ADDRESS',
    City VARCHAR(30) '$.City',
    DOB Date '$.DOB',
    Standard VARCHAR(20) '$.Standard'
)
) AS Temp

SELECT * FROM InfoTable

SELECT * FROM InfoTable FOR JSON AUTO
