--Write a SQL statement to create a table named jobs including columns JobId, JobTitle, MinSalary and MaxSalary, and make sure that, the default value for JobTitle is blank 
--and MinSalary is 8000 and MaxSalary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.

CREATE TABLE Jobs 
(
Job_Id INT PRIMARY KEY IDENTITY(1,1),
Job_Title VARCHAR(50) DEFAULT ' ',
MinSalary INT DEFAULT'8000',
MaxSalary INT DEFAULT NULL
)

INSERT INTO jobs(MinSalary) VALUES ('9000')

SELECT * FROM Jobs