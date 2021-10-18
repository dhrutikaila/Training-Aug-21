-- Practice Exercise:
--  (3)  Write a SQL statement to create a table named jobs including columns JobId, JobTitle, MinSalary and MaxSalary, and make sure that,
--       the default value for JobTitle is blank and MinSalary is 8000  and MaxSalary is NULL will be entered automatically at the time of 
--       insertion if no value assigned for the specified columns.


-- Create Database 

CREATE DATABASE TraineeAug
USE TraineeAug

--Create Table 

CREATE TABLE jobs
(
	JobId INT not null PRIMARY KEY,
	JobTitle VARCHAR(50)  DEFAULT ' ',
	MinSalary DECIMAL(6,0)  DEFAULT 8000,
	MaxSalary DECIMAL(10,0) DEFAULT NULL
)



--Select table
SELECT * FROM jobs

--Delete Table
DROP TABLE jobs