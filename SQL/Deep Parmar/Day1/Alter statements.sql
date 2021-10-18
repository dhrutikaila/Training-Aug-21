--Alter statement

-- (1) Write a SQL statement to add a foreign key constraint named fk_job_id on JobId column of JobHistory table referencing to the primary key JobId of jobs table.


  --ALTER Queary

  ALTER TABLE JobHistory
  ADD CONSTRAINT fk_job_id FOREIGN KEY (Job_Id) REFERENCES jobs(JobId)

  -- (2) Write a SQL statement to drop the existing foreign key fk_job_id from JobHistory table on JobId column which is referencing to the JobId of jobs table

  ALTER TABLE JobHistory
  DROP CONSTRAINT fk_job_id

  -- (3) Write a SQL statement to add a new column named location to the JobHistory table.

  ALTER TABLE JobHistory
  ADD location VARCHAR(15)