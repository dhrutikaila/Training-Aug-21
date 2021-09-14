/*Write a SQL statement to CREATE a TABLE named jobs including columns JobId, JobTitle, 
MinSalary and MaxSalary, and make sure that, the default value for JobTitle is blank 
and MinSalary is 8000 and MaxSalary is NULL will be entered automatically at the time 
of insertion if no value assigned for the specified columns.*/

CREATE TABLE Jobs
(
JobId int NOT NULL CONSTRAINT pkJobId PRIMARY KEY,
JobTitle varchar(30) CONSTRAINT chkJobtitle DEFAULT '',
MinSalary int NOT NULL CONSTRAINT chkMinSalary DEFAULT 8000,
MaxSalary int CONSTRAINT chkMaxSalary DEFAULT NULL  
)

INSERT INTO Jobs (JobId,JobTitle,MinSalary,MaxSalary) 
VALUES 
(3,'QA ANALYST',15000,30000),
(4,'NETWORK ENG.',25000,36000);
