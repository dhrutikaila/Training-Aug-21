USE DEMO
--Write a SQL statement to drop the existing foreign key fk_job_id from JobHistory table on JobId column which is referencing to the JobId of jobs table.

AlTER TABLE Job_History
DROP COLUMN JobID

