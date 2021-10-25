CREATE TABLE States 
(
StateID INT  CONSTRAINT  States_StateID_PkAuto PRIMARY KEY IDENTITY(1,1),
[Name] VARCHAR (25) CONSTRAINT States_Name_NotNull NOT NULL,
)

CREATE TABLE City
(
CityID INT CONSTRAINT City_CityID_Pk PRIMARY KEY IDENTITY(1,1),
CityName VARCHAR (25) CONSTRAINT City_CityName_NotNull NOT NULL,
StateID INT CONSTRAINT City_StateID_FkNotNull NOT NULL FOREIGN KEY REFERENCES States(StateID) ON DELETE CASCADE ON UPDATE CASCADE,
)


INSERT INTO City(CityName,StateID)
VALUES
('Ahmedabad',8),
('Baroda',8),
('Surat',8),
('Rajkot',8),
('Jamnagar',8),
('Gandhinagar',8),
('Mumbai',15),
('Kalkata',28),
('Chennai',25),
('Pune',15),
('Bengaluru',12),
('Mysore',12),
('Bhopal',14),
('Indore',14),
('Amritsar',21),
('Jalandhar',21),
('Chandigarh',21),
('Jaypur',22),
('Jaisalmer',22),
('Jodhpur',22)



INSERT INTO  States(Name)
VALUES('Andhra Pradesh'),
      ('Arunachal Pradesh'),
	  ('Assam'),
	  ('Bihar'),
	  ('Chhattisgarh'),
	  ('Delhi'),
	  ('Goa'),
	  ('Gujrat'),
	  ('Haryana'),
	  ('Himachal Pradesh'),
	  ('Jharkhand'),
	  ('Karnataka'),
	  ('Kerala'),
	  ('Madhya Pradesh'),
	  ('Maharashtra'),
	  ('Manipur'),
	  ('Meghalaya'),
	  ('Mizoram'),
	  ('Nagaland'),
	  ('Odisha'),
	  ('Punjab'),
	  ('Rajasthan'),
	  ('sikkim'),
	  ('Tamil Nadu'),
	  ('Tripura'),
	  ('Uttar Pradesh'),
	  ('Uttarakhand'),
	  ('West Bengal')


DECLARE @City_Name VARCHAR(50);
DECLARE @State_Name VARCHAR(50);
DECLARE @City_ID INT;

DECLARE Corsore_City_State CURSOR FOR
SELECT C.CityID,C.CityName,S.Name
	FROM City C JOIN States S ON C.StateID=S.StateID;

OPEN Corsore_City_State;

FETCH NEXT FROM Corsore_City_State INTO @City_ID,@City_Name,@State_Name;
WHILE @@FETCH_STATUS=0
BEGIN
PRINT CONCAT('City ID: ',@City_ID,' CityName: ',@City_Name,' State Is: ',@State_Name);
FETCH NEXT FROM Corsore_City_State INTO @City_ID,@City_Name,@State_Name;
END;

CLOSE Corsore_City_State;

DEALLOCATE Corsore_City_State;

