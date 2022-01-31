-- Write a SQL statement to increase the minimum and maximum salary of PU_CLERK by 2000 as well as the salary for those employees by 20%
--and commission by 10%
CREATE VIEW EmployeeSal
AS
    SELECT E.EmployeeID
	     , E.JobId
		 , E.Salary
		 , E.CommissionPct
		 , J.MinSalary
		 , J.MaxSalary
		 , E.ManagerID 
	FROM Employees E
    JOIN jobs J 
	ON J.JobId=E.JobId



    
CREATE TRIGGER Employee_Salary
ON EmployeeSalary
INSTEAD OF UPDATE
AS
BEGIN
    DECLARE @job_id VARCHAR(10)
    DECLARE @minimum_salary DECIMAL(6,0)
    DECLARE @maximum_salary DECIMAL(6,0)
    DECLARE @salary DECIMAL(8,2)
    DECLARE @commission DECIMAL(2,2)
    DECLARE @ManagerID INT
    
    SELECT @job_id=JobId
	     , @minimum_salary=MinSalary
		 , @maximum_salary=MaxSalary
		 , @salary=Salary
		 , @commission=CommissionPct 
	FROM inserted

 

    UPDATE jobs 
	SET MinSalary=@minimum_salary, MaxSalary=@maximum_salary 
	WHERE JobId=@job_id

 

    UPDATE Employees 
	SET Salary=@salary,CommissionPct=@commission 
	WHERE JobId=@job_id
END

 


    UPDATE EmployeeSalary 
    SET MinSalary=MinSalary+2000,
    MaxSalary=MaxSalary+2000,
    Salary=Salary+(Salary * 0.20),
    CommissionPct=CommissionPct+(CommissionPct * 0.10) 
    WHERE JobId='PU_CLERK'

 


 