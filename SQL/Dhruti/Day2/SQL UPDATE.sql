use test1
--1
UPDATE Employees SET email='not work',
CommissionPct=0.10
--2
UPDATE Employees SET email='not work',
CommissionPct=0.10
WHERE DepartmentId=80 AND CommissionPct<.20;
--3
UPDATE Employees SET Salary=8000 WHERE EmployeeID=2 AND Salary<5000;
--4
 UPDATE Employees SET EmployeeID='SH_CLERK'
 WHERE EmployeeID=2
 AND DepartmentId=3
 AND NOT EmployeeID LIKE 'SH%';
--5
 UPDATE Employees SET Salary=  CASE EmployeeID
            WHEN 40 THEN Salary+(Salary*.25)
			   WHEN 90 THEN Salary+(Salary*.15)
			      WHEN 110 THEN Salary+(Salary*.10)
				  ELSE Salary
				  END 
				  WHERE EmployeeID IN (2,3,4,5,6,7);
--6				  
UPDATE Employees SET Salary=8000 WHERE EmployeeID=105 AND Salary<5000;
--7
UPDATE Employees SET JobID='SH_CLERK' WHERE EmployeeID=118 AND DepartmentID=30 AND Jobid<>'SH%';
--7
UPDATE Employees
SET JobId = 'SH_CLERK' 
WHERE (EmployeeID = 118 and DepartmentID = 30 and JobId <> 'SH%')
--8
UPDATE Employees
SET Salary += (Salary * 0.25) WHERE DepartmentID = 40
UPDATE Employees
SET Salary += (Salary * 0.15) WHERE DepartmentID = 90
UPDATE Employees
SET Salary += (Salary * 0.10) WHERE DepartmentID = 110
