
----- 1.-----

ALTER TABLE dbo.Employees DROP CONSTRAINT ukEmail;

UPDATE dbo.Employees SET Email='Not Available';

----- 2. -----

UPDATE dbo.Employees SET Email='Not avilable', CommissionPct=0.10;

----- 3. -----

UPDATE dbo.Employees SET Email='Not avilable', CommissionPct=0.10 WHERE DepartmentID=110; 

----- 4. -----

UPDATE dbo.Employees SET Email='Not avilable' WHERE DepartmentId=80 AND CommissionPct<.20;

----- 5. -----

UPDATE dbo.Employees SET Email='Not avilable'
WHERE DepartmentID = (SELECT DepartmentID FROM dbo.Departments WHERE DepartmentName='Accounting')

----- 6. -----

UPDATE dbo.Employees SET Salary=8000 WHERE EmployeeID=105 AND Salary<5000;

----- 7. -----
UPDATE dbo.Employees SET JobID='SH_CLERK' WHERE EmployeeID=118 AND DepartmentID=30 AND Jobid<>'SH%';

----- 8. -----

-----9 -----