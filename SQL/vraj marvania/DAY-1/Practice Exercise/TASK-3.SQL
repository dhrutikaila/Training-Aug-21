/*Write a SQL statement to create a table named jobs including columns JobId,
 JobTitle, MinSalary and MaxSalary, and make sure that, the default value for 
 JobTitle is blank and MinSalary is 8000 and MaxSalary is NULL will be entered
  automatically at the time of insertion if no value assigned for the specified columns.*/


CREATE TABLE dbo.jobs
(
	JobId INT NOT NULL IDENTITY(1,1),
	JobTitle VARCHAR(100)  DEFAULT (' '),
	MinSalary MONEY DEFAULT (8000),
	MaxSalary MONEY DEFAULT(NULL)
) 

INSERT INTO dbo.jobs(JobTitle) VALUES ('ER')

SELECT * FROM dbo.jobs