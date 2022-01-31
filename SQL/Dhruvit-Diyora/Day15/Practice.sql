CREATE TABLE Person2 (
    PersonID int PRIMARY KEY IDENTITY(1,1),
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255),
	Age INT
)
 
GO
 
INSERT INTO Person2 VALUES('Hayes', 'Corey','123  Wern Ddu Lane','LUSTLEIGH',23)
INSERT INTO Person2 VALUES('Macdonald','Charlie','23  Peachfield Road','CEFN EINION',45)
INSERT INTO Person2 VALUES('Frost','Emma','85  Kingsway North','HOLTON',26)
INSERT INTO Person2 VALUES('Thomas', 'Tom','59  Dover Road', 'WESTER GRUINARDS',51)
INSERT INTO Person2 VALUES('Baxter','Cameron','106  Newmarket Road','HAWTHORPE',46)
INSERT INTO Person2 VALUES('Townsend','Imogen ','100  Shannon Way','CHIPPENHAM',20)
INSERT INTO Person2 VALUES('Preston','Taylor','14  Pendwyallt Road','BURTON',19)
INSERT INTO Person2 VALUES('Townsend','Imogen ','100  Shannon Way','CHIPPENHAM',18)
INSERT INTO Person2 VALUES('Khan','Jacob','72  Ballifeary Road','BANCFFOSFELEN',11)


SET IMPLICIT_TRANSACTIONS ON 
UPDATE 
    Person 
SET 
    Lastname = 'Sawyer', 
    Firstname = 'Tom' 
WHERE 
    PersonID = 2 
SELECT 
    IIF(@@OPTIONS & 2 = 2, 
    'Implicit Transaction Mode ON', 
    'Implicit Transaction Mode OFF'
    ) AS 'Transaction Mode' 
SELECT 
    @@TRANCOUNT AS OpenTransactions 
COMMIT TRAN 
SELECT 
    @@TRANCOUNT AS OpenTransactions


BEGIN TRAN
UPDATE Person 
SET    Lastname = 'Lucky', 
        Firstname = 'Luke' 
WHERE  PersonID = 1
SELECT @@TRANCOUNT AS OpenTransactions 
COMMIT TRAN 
SELECT @@TRANCOUNT AS OpenTransactions

BEGIN TRAN
UPDATE Person 
SET    Lastname = 'Donald', 
        Firstname = 'Duck'  WHERE PersonID=2
 
 
SELECT * FROM Person WHERE PersonID=2
 
ROLLBACK TRAN 
 
SELECT * FROM Person WHERE PersonID=2




BEGIN TRANSACTION 
INSERT INTO Person 
VALUES('Mouse', 'Micky','500 South Buena Vista Street, Burbank','California',43)
SAVE TRANSACTION InsertStatement
DELETE Person WHERE PersonID=3
SELECT * FROM Person 
ROLLBACK TRANSACTION InsertStatement
COMMIT
SELECT * FROM Person


BEGIN TRAN
INSERT INTO Person 
VALUES('Bunny', 'Bugs','742 Evergreen Terrace','Springfield',54)
    
UPDATE Person SET Age='MiddleAge' WHERE PersonID=7
SELECT * FROM Person
 
COMMIT TRAN



Select * from Person
BEGIN TRAN DeletePerson WITH MARK 'MarkedTransactionDescription' 
    DELETE Person WHERE PersonID BETWEEN 2 AND 4
  Select * from Person  
    COMMIT TRAN DeletePerson

	SELECT * FROM msdb.dbo.logmarkhistory



	SELECT @@TRANCOUNT AS OpenTransactions
--isolation
SET TRANSACTION ISOLATION LEVEL
READ COMMITTED
BEGIN TRANSACTION TR
BEGIN TRY
UPDATE Person.Contact
SET EmailAddress='jolyn@yahoo.com'
WHERE ContactID=1070
UPDATE HumanResources.EmployeeAddress SET AddressID=32533


--deadlock


--Transaction1
BEGIN TRAN
UPDATE Person 
SET Lastname = 'Transaction', Firstname = 'One'  WHERE PersonID=5

UPDATE Person2 
SET Lastname = 'Transaction', Firstname = 'Two'  WHERE PersonID=5
SELECT * From Person2
COMMIT TRAN

--Transaction2
BEGIN TRAN
UPDATE Person2 
SET Lastname = 'Transaction', Firstname = 'Two'  WHERE PersonID=5
UPDATE Person 
SET Lastname = 'Transaction', Firstname = 'One'  WHERE PersonID=5