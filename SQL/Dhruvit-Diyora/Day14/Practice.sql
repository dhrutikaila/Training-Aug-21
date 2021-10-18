CREATE TRIGGER trgUpdateEmployeePayHistory
ON HumanResources.EmployeePayHistory
FOR UPDATE
AS
IF UPDATE (Rate)
BEGIN
DECLARE @AvgRate FLOAT
SELECT @AvgRate = AVG(Rate)
FROM HumanResources.EmployeePayHistory
IF(@AvgRate>20)
BEGIN
PRINT 'The average value of rate cannot be more than 20' 
IF(@AvgRate>20)
BEGIN
PRINT 'The average value of rate cannot be more than 20'
ROLLBACK TRANSACTION
END
END
END




CREATE TRIGGER reminder1  
ON Sales.Customer  
AFTER INSERT, UPDATE   
AS RAISERROR ('Notify Customer Relations', 16, 10);  
GO  



CREATE TRIGGER reminder2  
ON Sales.Customer  
AFTER INSERT, UPDATE, DELETE   
AS  
   EXEC msdb.dbo.sp_send_dbmail  
        @profile_name = 'AdventureWorks2012 Administrator',  
        @recipients = 'danw@Adventure-Works.com',  
        @body = 'Don''t forget to print a report for the sales force.',  
        @subject = 'Reminder';  
GO  


CREATE TRIGGER Purchasing.LowCredit ON Purchasing.PurchaseOrderHeader  
AFTER INSERT  
AS  
IF (ROWCOUNT_BIG() = 0)
RETURN;
IF EXISTS (SELECT 1  
           FROM inserted AS i   
           JOIN Purchasing.Vendor AS v   
           ON v.BusinessEntityID = i.VendorID  
           WHERE v.CreditRating = 5  
          )  
BEGIN  
RAISERROR ('A vendor''s credit rating is too low to accept new  
purchase orders.', 16, 1);  
ROLLBACK TRANSACTION;  
RETURN   
END;  
GO  
  
-- This statement attempts to insert a row into the PurchaseOrderHeader table  
-- for a vendor that has a below average credit rating.  
-- The AFTER INSERT trigger is fired and the INSERT transaction is rolled back.  
  
INSERT INTO Purchasing.PurchaseOrderHeader (RevisionNumber, Status, EmployeeID,  
VendorID, ShipMethodID, OrderDate, ShipDate, SubTotal, TaxAmt, Freight)  
VALUES (  
2  
,3  
,261  
,1652  
,4  
,GETDATE()  
,GETDATE()  
,44594.55  
,3567.564  
,1114.8638 );  
GO  

CREATE TABLE Country (
	CountryId INT IDENTITY(1,1),
	CountryName VARCHAR(100),
	CountryEngName VARCHAR(100),
	CountryCode VARCHAR(2)
)


CREATE TRIGGER t_country_insert ON Country INSTEAD OF INSERT
AS BEGIN
    DECLARE @country_name CHAR(128);
    DECLARE @country_name_eng CHAR(128);
    DECLARE @country_code  CHAR(8);
    SELECT @country_name = CountryName, @country_name_eng = CountryEngName, @country_code = CountryCode FROM INSERTED;
    IF @country_name IS NULL SET @country_name = @country_name_eng;
    IF @country_name_eng IS NULL SET @country_name_eng = @country_name;
    INSERT INTO country (CountryName, CountryEngName, CountryCode) VALUES (@country_name, @country_name_eng, @country_code);
END;

SELECT * FROM country;
INSERT INTO country (CountryEngName, CountryCode) VALUES ('United Kingdom', 'UK');
SELECT * FROM country;


CREATE TRIGGER t_country_delete ON country INSTEAD OF DELETE
AS BEGIN
    DECLARE @id INT;
    DECLARE @count INT;
    SELECT @id = CountryId FROM DELETED;
    SELECT @count = COUNT(*) FROM Employees WHERE EmployeeID = @id;
    IF @count = 0
        DELETE FROM country WHERE CountryId = @id;
    ELSE
        THROW 51000, 'can not delete - country is referenced in other tables', 1;
END;
DELETE FROM country WHERE CountryId = 1;


CREATE TABLE Car  
(  
   CarId int identity(1,1) primary key,  
   Name varchar(100),  
   Make varchar(100),  
   Model int ,  
   Price int ,  
   Type varchar(20)  
)  
 
INSERT INTO Car( Name, Make,  Model , Price, Type)
VALUES ('Corrolla','Toyota',2015, 20000,'Sedan'),
('Civic','Honda',2018, 25000,'Sedan'),
('Passo','Toyota',2012, 18000,'Hatchback'),
('Land Cruiser','Toyota',2017, 40000,'SUV'),
('Corrolla','Toyota',2011, 17000,'Sedan')
 
 
CREATE TABLE CarLog  
(  
   LogId int identity(1,1) primary key,
   CarId int , 
   CarName varchar(100),  
)

CREATE TRIGGER [dbo].[CarLOG_INSERT]
       ON [dbo].[CarLog]
INSTEAD OF INSERT
AS
BEGIN
PRINT('DATA CANNOT BE INSERTED DIRECTLY IN CarLog TABLE')
      
END



INSERT INTO CarLog(  CarId , CarName)
VALUES (2, 'Civic')

SELECT * FROM CarLog

CREATE TRIGGER [dbo].[CAR_INSERT]
       ON [dbo].[Car]
AFTER INSERT
AS
BEGIN
       SET NOCOUNT ON
 
       DECLARE @car_id INT, @car_name VARCHAR(50)
 
       SELECT @car_id = INSERTED.CarId,  @car_name = INSERTED.name       
       FROM INSERTED
 
  
 
       INSERT INTO CarLog
       VALUES(@car_id, @car_name)
END

INSERT INTO Car( Name, Make,  Model , Price, Type)
VALUES ('Mustang','Ford',2014, 25000,'Sedan')


SELECT * FROM Car
SELECT * FROM CarLog

DROP TRIGGER [dbo].[CarLOG_INSERT]
CREATE TRIGGER [dbo].[CarLOG_INSERT] ON [dbo].[CarLog]
INSTEAD OF INSERT
AS
BEGIN
  IF @@NESTLEVEL = 1
    PRINT('DATA CANNOT BE INSERTED DIRECTLY IN CarLog TABLE')
  ELSE
    BEGIN
       DECLARE @car_id INT, @car_name VARCHAR(50)
 
       SELECT @car_id = INSERTED.CarId,  @car_name = INSERTED.CarName      
       FROM INSERTED
       INSERT INTO CarLog
       VALUES(@car_id, @car_name)
    END
    
END

INSERT INTO CarLog(  CarId , CarName)
VALUES (2, 'Civic')

INSERT INTO Car( Name, Make,  Model , Price, Type)
VALUES ('Clio','Renault',2012, 5000,'Sedan')

SELECT * FROM CarLog
