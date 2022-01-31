USE DEMO

--Write a SQL statement to add a foreign key constraint named fk_job_id on JobId column of JobHistory table referencing to the primary key JobId of jobs table.

ALTER TABLE Job_History
ADD JobID INT CONSTRAINT FK_Job_Id FOREIGN KEY REFERENCES Jobs(JobId)

