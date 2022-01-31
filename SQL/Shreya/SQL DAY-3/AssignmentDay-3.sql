--- 1 QUE

SELECT FirstName , LEN(FirstName) as LengthOfFirstName from Employees WHERE FirstName 
LIKE ('A%') OR FirstName LIKE ('J%') OR FirstName LIKE ('M%') ORDER BY FirstName ASC


--- 2 QUE
SELECT CAST(LEFT(Salary,10) AS varchar(10)) FROM Employees

SELECT FirstName,
SALARY = REPLICATE('$',10-Len(Salary))+ CAST(LEFT(Salary,13) AS varchar(10))
FROM Employees


---3 QUE 

SELECT EmployeeID, FirstName,LastName,HireDate FROM Employees
WHERE DATEPART(DAY,HireDate) LIKE 7 OR DATENAME(MONTH,HireDate) LIKE 'july'


---4 QUE 
SELECT * FROM Employees
SELECT FirstName , LEN(FirstName) as LengthOfFirstName from Employees WHERE LastName LIKE
('__C%')

---5 QUE

SELECT right(PhoneNumber,4) as phonenumber from Employees

---6 QUE 

SELECT REPLACE(PhoneNumber,124,999) as Phonenumber from Employees

---8 QUE

set datefirst 1
SELECT  HireDate , DATENAME(WEEKDAY,HireDate) AS daynames FROM Employees 
WHERE DATEPART(WEEKDAY,HireDate) LIKE 1


---9 QUE

SELECT FirstName , HireDate FROM Employees WHERE CAST(HireDate AS varchar) 
BETWEEN '1987-06-01' AND '1987-07-30' 

---10 QUE 

SELECT RIGHT(CONVERT(VARCHAR(20), GETDATE(),100),7) +' '+
SUBSTRING(DATENAME(MONTH, GETDATE()), 1, 3)+' '+ 
DATENAME(DAY, GETDATE()) + ', '+ DATENAME(YEAR, GETDATE()) date

SELECT FORMAT(SYSDATETIME(), 'hh:mm tt') +' '+
SUBSTRING(DATENAME(MONTH, GETDATE()), 1, 3)+' '+ 
DATENAME(DAY, GETDATE()) + ', '+ DATENAME(YEAR, GETDATE()) date


--12 QUE

SELECT FirstName , LastName FROM Employees WHERE MONTH(HireDate)=6;

--2 way
SELECT FirstName , LastName FROM Employees WHERE DATENAME(MONTH,HireDate) LIKE 'June'



---13 QUE

SELECT FirstName ,HireDate ,(Year(GETDATE()) - Year(HireDate)) as Experience from Employees
--2ND WAY
SELECT FirstName ,HireDate , 
DATEPART(YEAR,GETDATE()) - DATEPART(YEAR,HireDate) 
from Employees
--3RD WAY 
SELECT FirstName , HireDate , DATEDIFF(YEAR,HireDate,GETDATE()) as Experience 
FROM Employees


---14 QUE
SELECT FirstName  FROM Employees WHERE YEAR(HireDate)=1987;



