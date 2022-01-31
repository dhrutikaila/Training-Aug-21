CREATE DATABASE Practice

USE Practice

CREATE TABLE Person (
    PersonID int PRIMARY KEY IDENTITY(1,1),
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255),
	Age INT
)
 
GO
 
INSERT INTO Person VALUES('Hayes', 'Corey','123  Wern Ddu Lane','LUSTLEIGH',23)
INSERT INTO Person VALUES('Macdonald','Charlie','23  Peachfield Road','CEFN EINION',45)
INSERT INTO Person VALUES('Frost','Emma','85  Kingsway North','HOLTON',26)
INSERT INTO Person VALUES('Thomas', 'Tom','59  Dover Road', 'WESTER GRUINARDS',51)
INSERT INTO Person VALUES('Baxter','Cameron','106  Newmarket Road','HAWTHORPE',46)
INSERT INTO Person VALUES('Townsend','Imogen ','100  Shannon Way','CHIPPENHAM',20)
INSERT INTO Person VALUES('Preston','Taylor','14  Pendwyallt Road','BURTON',19)
INSERT INTO Person VALUES('Townsend','Imogen ','100  Shannon Way','CHIPPENHAM',18)
INSERT INTO Person VALUES('Khan','Jacob','72  Ballifeary Road','BANCFFOSFELEN',11)

----------------------------TRANSACTION-----------------------------------
BEGIN TRANSACTION
UPDATE Person 
SET    Lastname = 'Lucky', 
        Firstname = 'Luke' 
WHERE  PersonID = 1
SELECT @@TRANCOUNT AS OpenTRANSACTIONs 
COMMIT TRANSACTION 
SELECT @@TRANCOUNT AS OpenTRANSACTIONs

SELECT * FROM Person
------------------------ROLLBACK-----------------------------------
BEGIN TRANSACTION
UPDATE Person 
SET    Lastname = 'Donald', 
        Firstname = 'Duck'  WHERE PersonID=2
SELECT * FROM Person WHERE PersonID=2
 
ROLLBACK TRANSACTION 
 
SELECT * FROM Person WHERE PersonID=2

-------------------Save Points in TRANSACTIONs-----------------------------

BEGIN TRANSACTION 
INSERT INTO Person 
VALUES('Mouse', 'Micky','500 South Buena Vista Street, Burbank','California',43)

SAVE TRANSACTION InsertStatement

DELETE Person WHERE PersonID=3

SELECT * FROM Person 

ROLLBACK TRANSACTION InsertStatement
COMMIT
SELECT * FROM Person

--------------------Auto Rollback------------------------
BEGIN TRANSACTION
INSERT INTO Person 
VALUES('Bunny', 'Bugs','742 Evergreen Terrace','Springfield',54)
    
UPDATE Person SET Age='MiddleAge' WHERE PersonID=7
SELECT * FROM Person
 
COMMIT TRANSACTION

SELECT * FROM Person

---------------------TRANSACTIONSECTION HISTORY---------------------------
BEGIN TRANSACTION DeletePerson WITH MARK 'MarkedTRANSACTIONDescription' 
    DELETE Person WHERE PersonID BETWEEN 3 AND 4
	COMMIT TRANSACTION DeletePerson

SELECT * FROM msdb.dbo.logmarkhistory