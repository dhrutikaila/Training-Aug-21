USE AdventureWorks2016

--Select all details from person table
SELECT * FROM Person.Person

--Select all details from person table whose firstname is Diane 
SELECT * FROM Person.Person WHERE FirstName='Diane'

--Get lastnames from person table and give alias as Surname
SELECT LastName AS 'Surname' FROM Person.Person 

--Select top 5 records from Employee table
SELECT TOP 5 * FROM HumanResources.Employee

--Select employees details whose job tite like Design
SELECT * FROM HumanResources.Employee WHERE JobTitle LIKE 'Design%'

--SELECT Employee Details order by their birthdate Ascending
SELECT * FROM HumanResources.Employee ORDER BY BirthDate ASC

--Update ModifiedDate Column with 'NA' incEmployee table
UPDATE HumanResources.Employee SET ModifiedDate = 'NA'

--Update MaritalStatus To 'M' Whose BusinessEntityID is 63
UPDATE HumanResources.Employee SET MaritalStatus = 'M' WHERE BusinessEntityID = 63

--Add 6 hour into  vacationHours whose OrganizationalLevel is 2
UPDATE HumanResources.Employee SET VacationHours += 6 WHERE OrganizationLevel = 2