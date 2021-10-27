
ALTER TABLE JobHistory ADD CONSTRAINT fk_job_id FOREIGN KEY (Job_Id)
REFERENCES Jobs(JobId) on update cascade

ALTER TABLE JobHistory DROP CONSTRAINT fk_job_id

ALTER TABLE JobHistory ADD  location VARCHAR(10)

SELECT * FROM JobHistory


