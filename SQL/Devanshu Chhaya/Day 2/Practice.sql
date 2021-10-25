--Basic Select Statement

USE AdventureWorks2016

SELECT DepartmentID 'Department Number' , Name 'Department Name'
FROM HumanResources.Department

--Literals & Concatenate

SELECT LoginID,'Designation: ',JobTitle
FROM HumanResources.Employee

SELECT CAST(BirthDate AS varchar)+' '+CAST(HireDate AS varchar) AS BirthDate_HireDate
FROM HumanResources.Employee

--Calculating Column Values

SELECT BusinessEntityID,Rate,PerDayRate=Rate*8 FROM HumanResources.EmployeePayHistory

-- Where clause

SELECT * FROM HumanResources.Department WHERE GroupName='Manufacturing'

--Comparison & Logical Operator

SELECT * FROM HumanResources.Employee WHERE VacationHours<5

SELECT * FROM HumanResources.Employee WHERE JobTitle='Design Engineer' OR  JobTitle ='Tool Designer'


--Range Operator

SELECT * FROM HumanResources.Employee WHERE VacationHours BETWEEN 20 AND 30


--In/not in keyword

SELECT * FROM HumanResources.Employee WHERE JobTitle IN ('Chief Executive Officer','Senior Tool Designer')

--Like, OrderBy, Top, Distinct

SELECT * FROM HumanResources.Employee WHERE JobTitle LIKE 'Research%'

SELECT * FROM HumanResources.Employee WHERE OrganizationLevel IS NULL

SELECT * FROM HumanResources.Employee ORDER BY JobTitle

SELECT TOP(10) * FROM HumanResources.Employee


SELECT DISTINCT JobTitle FROM HumanResources.Employee 