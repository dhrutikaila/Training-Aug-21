-- Isolation Levels

SET TRANSACTION ISOLATION LEVEL
	READ COMMITTED
SELECT LastName FROM Person.Person WHERE BusinessEntityID = 1

------------------------------------------------------------------------------------------

BEGIN TRANSACTION

SET TRANSACTION ISOLATION LEVEL
	REPEATABLE READ
SELECT LastName FROM Person.Person WHERE BusinessEntityID = 1

SELECT LastName FROM Person.Person WHERE BusinessEntityID = 1

ROLLBACK TRANSACTION


------------------------------------------------------------------------------------------


BEGIN TRANSACTION

SET TRANSACTION ISOLATION LEVEL
	SERIALIZABLE
SELECT LastName FROM Person.Person WHERE LastName = 'Harrison'

SELECT LastName FROM Person.Person WHERE LastName = 'Harrison'

ROLLBACK TRANSACTION



------------------------------------------------------------------------------------------

ALTER DATABASE AdventureWorks2012
SET ALLOW_SNAPSHOT_ISOLATION ON

BEGIN TRANSACTION

SET TRANSACTION ISOLATION LEVEL
	SNAPSHOT
SELECT LastName FROM Person.Person WHERE LastName = 'Harrison'

SELECT LastName FROM Person.Person WHERE LastName = 'Harrison'

ROLLBACK TRANSACTION
