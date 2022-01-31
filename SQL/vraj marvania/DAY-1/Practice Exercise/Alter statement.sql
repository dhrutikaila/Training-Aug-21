--1.Write a SQL statement to add a foreign key constraint named fk_job_id on JobId column of JobHistory table referencing to the primary key JobId of jobs table.

        ALTER TABLE JobHistory
        ADD job_id INT NOT NULL CONSTRAINT fk_job_id  FOREiGN KEY REFERENCES jobs(Job_ID)

        SELECT * FROM JobHistory

--2.Write a SQL statement to drop the existing foreign key fk_job_id from JobHistory table on JobId column which is referencing to the JobId of jobs table.
 
        ALTER TABLE JobHistory
        DROP COLUMN JobId 

        SELECT * FROM JobHistory
 
--3.Write a SQL statement to add a new column named location to the JobHistory table.

        ALTER TABLE JobHistory
        ADD LOCATION  VARCHAR(50) NOT NULL

        SELECT * FROM JobHistory
