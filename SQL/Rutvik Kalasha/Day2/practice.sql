/*DML*/

/*CREATE COMMAND*/
CREATE TABLE Radixweb (
E_Id INT NOT NULL,
E_Name VARCHAR (20) NOT NULL,
);

/*SELECT COMMAND*/

SELECT E_Id,E_NAME FROM Radixweb;

/*INSERT COMMAND*/

INSERT INTO Radixweb (E_Id, E_NAME)
VALUES (1,'Rutvik');

/*UPDATE COMMAND*/

UPDATE Radixweb SET E_NAME = 'not available';

/*ALTER COMMAND*/

ALTER TABLE Radixweb ADD E_location varchar(20);

/*TRUNCATE COMMAND*/

TRUNCATE TABLE Radixweb;

SELECT E_Id,E_NAME FROM Radixweb WHERE E_Id = 1;

/*DROP COMMAND*/

DROP TABLE Radixweb;

/*BETWEEN Operator*/

SELECT * FROM Employees WHERE Salary BETWEEN 1000 AND 3000;

/*NOT BETWEEN Operator*/

SELECT * FROM Employees WHERE Salary NOT BETWEEN 1000 AND 3000;

/*IN Operator*/

SELECT * FROM Employees WHERE Salary IN (1000, 8000);

/*NOT IN Operator*/

SELECT * FROM Employees WHERE Salary NOT IN (1000, 3000);

/*LIKE Operator*/

SELECT * FROM Employees WHERE FirstName LIKE 'A%';

/*ORDER BY*/

SELECT * FROM Employees ORDER BY Job_Id ASC;

/*DISTINCT and TOP*/

SELECT DISTINCT TOP 10 FirstName, Salary FROM Employees ORDER BY Salary; 