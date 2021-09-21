-- Create a batch Select Banking as ‘Bank Dept’, Insurance as ‘Insurance Dept’ and Services as ‘Services Dept’ from employee table

Select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY , JOINING_DATE, DEPARTMENT=
Case
    when DEPARTMENT='Banking' then 'Bank Dept.'
    when DEPARTMENT='Insurance' then 'Insurance Dept.'
    when DEPARTMENT='Services' then 'Services Dept.'
end
from Employee

-- Another way --

DECLARE @bank NVARCHAR(50)
DECLARE @insurance NVARCHAR(50)
DECLARE @service NVARCHAR(50)

SET @bank = 'Bank Dept'
SET @insurance = 'Insurance Dept'
SET @service = 'Services Dept'

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY , JOINING_DATE, 
	CASE DEPARTMENT
		WHEN 'Banking' THEN @bank
		WHEN 'Insurance' THEN @insurance
		WHEN 'Services' THEN @service
		ELSE DEPARTMENT
		END AS DEPARTMENT_NAME
FROM Employee

