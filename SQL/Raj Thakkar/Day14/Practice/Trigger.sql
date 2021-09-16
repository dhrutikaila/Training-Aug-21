--TRIGGER
CREATE TRIGGER TRGUPDATE ON HumanResources.Employee
FOR UPDATE
AS
BEGIN
        SELECT * FROM inserted
		SELECT * FROM deleted
END
 UPDATE HumanResources.Employee 
 SET JobTitle='DEVELOPER'
 WHERE BusinessEntityID = 3

 SELECT * FROM HumanResources.Employee


 --ALTER to insert old record
 ALTER TRIGGER HumanResources.Employee.TRGUPDATE ON HumanResources.Employee
FOR UPDATE
AS
BEGIN
        DECLARE @TITLE VARCHAR(90),
		INSERT INTO CHANGESEMPLOYEE
		SELECT * FROM deleted
END

SELECT * INTO CHANGESEMPLOYEE FROM HumanResources.Employee WHERE 1=0

 UPDATE HumanResources.Employee 
 SET JobTitle='DEVELOPER'
 WHERE BusinessEntityID = 3

 SELECT * FROM HumanResources.Employee
 SELECT * FROM CHANGESEMPLOYEE

 --INSTEAD OF
 CREATE TRIGGER TRGINSTEADOF ON HumanResources.Employee
INSTEAD OF INSERT 
AS
BEGIN
        DECLARE @Id INT, @Title VARCHAR(90)
		INSERT INTO DATAINFO VALUES (@Id,@Title)
        
		SELECT * FROM inserted
		SELECT * FROM deleted
END
 
 INSERT INTO HumanResources.Employee VALUES(,'292','ad',0x8384,3,'we', '1969-01-29','S','M','2009-01-14',1,2,3,1,newid(),GETDATE())

 SELECT * FROM HumanResources.Employee

 CREATE TABLE DATAINFO
 (
  id INT,
  Jobtitle VARCHAR(90)
 )

 --Nested trigger