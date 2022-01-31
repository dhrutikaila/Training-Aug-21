--5 Students Name, Address, City, DOB, Standard need to be inserted in the student table, need to fetch these result from json variable. and select output in the json format
DECLARE @json NVarChar(MAX) = '[{
								"NAME": "Rutvik",
								"ADDRESS": "Botad",
								"CITY": "Botad",
								"DOB": 07-11-199,
								"STANDARD": "12th"
  }]';

  IF(ISJSON(@json)>0
  INSERT INTO Student SELECT * FROM OPENJSON (@json)
  WITH(
  NAME VARCHAR(50) '$.NAME',
  ADDRESS VARCHAR(50) '$.ADDRESS',
  CITY VARCHAR(50)    '$.CITY',
  DOB VARCHAR(50) '$.DOB',
  STANDARD VARCHAR(50) '$.STANDARD'
  )

  SELECT *  FROM Student
  SELECT * FROM FROM Student JSON AUTO

 