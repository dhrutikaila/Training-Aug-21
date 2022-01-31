--INDEX  And TRANSACTION Practice


--Implicit Transaction 
CREATE TABLE Emp (Name Varchar(30), JobTitle Varchar(30))

SET IMPLICIT_TRANSACTIONS ON
INSERT INTO Emp VALUES ('Jack', 'Developer')
INSERT INTO Emp VALUES ('Roy', 'Marketing')
--COMMIT TRANSACTION
ROLLBACK TRANSACTION

SELECT * FROM Emp
--Turn Of Implicit Transaction
SET IMPLICIT_TRANSACTIONS OFF
--------------------------------------------------------------------------------------------------

--Explicit Transaction
CREATE TABLE SavingAccount (AccountName Varchar(30) PRIMARY KEY, Balance int)
CREATE TABLE FdAccount (AccountName Varchar(30) FOREIGN KEY REFERENCES SavingAccount(AccountName), Balance int)

INSERT INTO SavingAccount VALUES ('Dev', 2500)
INSERT INTO SavingAccount VALUES ('Ravi', 7000)
INSERT INTO SavingAccount VALUES ('Jay', 15000)
INSERT INTO SavingAccount VALUES ('Rutvik', 25000)

INSERT INTO FdAccount VALUES ('Dev', 100000)
INSERT INTO FdAccount VALUES ('Ravi', 200000)
INSERT INTO FdAccount VALUES ('Jay', 50000)
INSERT INTO FdAccount VALUES ('Rutvik', 150000)

SELECT * FROM FdAccount
SELECT * FROM SavingAccount

BEGIN TRAN MyTran
UPDATE FdAccount SET Balance = Balance -50000 
WHERE AccountName = 'Ravi'

UPDATE SavingAccount SET Balance = Balance +50000 
WHERE AccountName = 'Ravi'
COMMIT TRAN MyTran


--Rollback Example 
CREATE TABLE ValueTable (id INT)  
BEGIN TRANSACTION  
       INSERT INTO ValueTable VALUES(1)
       INSERT INTO ValueTable VALUES(2)  
ROLLBACK


SELECT * FROM ValueTable

--Transaction With Mark
BEGIN TRANSACTION DeleteEmployee  
WITH MARK N'Deleting a Employee' 
DELETE FROM Emp WHERE Name = 'Roy'    
COMMIT TRANSACTION DeleteEmployee  
 
SELECT * FROM Emp



--Rollback Transaction Example 
CREATE TABLE ValueTable ([value] INT);  
DECLARE @TransactionName VARCHAR(20) = 'InsertTransaction';  
  
BEGIN TRAN @TransactionName 
INSERT INTO ValueTable VALUES(1), (2) 
ROLLBACK TRAN @TransactionName  
INSERT INTO ValueTable VALUES(3),(4);  
SELECT [value] FROM ValueTable;  
  
DROP TABLE ValueTable;

