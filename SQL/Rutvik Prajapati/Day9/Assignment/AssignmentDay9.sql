--Assignment: Day9

--2. 5 Students Name, Address, City, DOB, Standard need to be inserted in the student table, 
  --need to fetch these result from json variable. and select output in the json format
  USE EMPDB

  DECLARE @JSON NVARCHAR(MAX)
  SET @JSON = N'[{"StudentName":"Niraj","Address":"123,green park","City":"Modasa","DOB":"1999-04-01","Standard":10},
				 {"StudentName":"Rakesh","Address":"124,green park","City":"Delhi","DOB":"1991-06-01","Standard":11},
				 {"StudentName":"Reena","Address":"125,green park","City":"Ahmedabad","DOB":"1995-01-01","Standard":6},
				 {"StudentName":"Mukesh","Address":"126,green park","City":"Gandhinagar","DOB":"1996-05-01","Standard":7},
				 {"StudentName":"Parth","Address":"127,green park","City":"Mumbai","DOB":"1993-09-01","Standard":12}]';
  IF ISJSON(@JSON)>0
  BEGIN
  INSERT INTO Students
  SELECT * FROM OPENJSON(@JSON)
  WITH(
  StudentName VARCHAR(20) '$.StudentName',
  Address VARCHAR(20) '$.Address',
  City VARCHAR(20) '$.City',
  DOB  VARCHAR(20) '$.DOB',
  Standard INT '$.Standard'
  )
  END
  ELSE
  PRINT 'NOT EXECUTE PROPER'

  CREATE TABLE Students(
  Id INT IDENTITY(1,1),
  StudentName VARCHAR(20),
  Address VARCHAR(20),
  City VARCHAR(20),
  DOB DATE,
  Standard INT
  );

  SELECT * FROM Students
  