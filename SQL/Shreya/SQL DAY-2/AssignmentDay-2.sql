---1 QUE
select * from Employees
ALTER TABLE Employees DROP CONSTRAINT ukEmail
UPDATE Employees SET Email='not available'

---2 QUE

select * from Employees
UPDATE Employees SET Email='not available' , CommissionPct =0.10

--3 QUE 

SELECT * FROM Employees where DepartmentID=110

UPDATE Employees SET Email='not availableQue3' , CommissionPct =0.100 WHERE DepartmentID=110

--4 que

UPDATE Employees SET Email='not availableQue4' , CommissionPct =0.100 WHERE DepartmentID=80 AND CommissionPct<0.2


--5 QUE
UPDATE Employees SET email='not availableQue5' WHERE DepartmentID=(SELECT DepartmentID 
FROM Departments WHERE DepartmentName='Accounting');


SELECT * FROM Employees
--6 QUE

SELECT * FROM Employees

UPDATE Employees SET Salary=8000 where EmployeeID=105 AND Salary<5000


--7 QUE
UPDATE Employees SET JobId='SH_CLERK' WHERE EmployeeID=118
AND DepartmentID=30 AND JobId NOT LIKE 'SH%'


--8 QUE

UPDATE Employees SET Salary =(CASE
DepartmentID WHEN 40 THEN Salary+(Salary*0.25) 
WHEN 90 THEN Salary+(Salary*0.15)
WHEN 110 THEN Salary+(Salary*0.10)
ELSE Salary END)
WHERE DepartmentID=40 OR DepartmentID=90 OR DepartmentID=110



UPDATE Employees SET Salary += Salary*0.25 where DepartmentID = 40 
UPDATE Employees SET Salary += Salary*0.15 where DepartmentID = 90
UPDATE Employees SET Salary += Salary*0.10 where DepartmentID = 110 

--9 QUE


