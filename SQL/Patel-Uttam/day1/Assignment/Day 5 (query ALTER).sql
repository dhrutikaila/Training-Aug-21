/* 
1. Write a SQL statement to add a foreign key constraint named fk_job_id on JobId column of JobHistory table referencing to the primary key JobId of jobs table.

2. Write a SQL statement to drop the existing foreign key fk_job_id from JobHistory table on JobId column which is referencing to the JobId of jobs table.

3. Write a SQL statement to add a new column named location to the JobHistory table. */

USE [Day5 (SSMS)]
Go

sp_help JobHistory
Go

ALTER TABLE JobHistory ADD CONSTRAINT fk_job_id FOREIGN KEY(Job_ID) REFERENCES Jobs(JobId);
Go

sp_help JobHistory
Go

ALTER TABLE JobHistory DROP fk_job_id;
Go

sp_help JobHistory
Go

ALTER TABLE JobHistory ADD Location varchar(50) ;
Go

sp_help JobHistory
Go