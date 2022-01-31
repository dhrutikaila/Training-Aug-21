--Write a SQL statement to create a table named JobHistory including columns EmployeeId, StartDate, End_Eate, Job_Id and Department_Id 
--and make sure that the value against column EndDate will be entered at the time of insertion to the format like ‘–/–/—-‘.

CREATE TABLE JobHistory
(
Employee_Id INT PRIMARY KEY IDENTITY(1,1),
StartDate DATE NOT NULL,
End_Date VARCHAR(50) CONSTRAINT chk_Format CHECK(End_Date LIKE '__/__/____') ,
Job_Id INT NOT NULL,
Department_Id INT NOT NULL,
)

INSERT INTO JobHistory VALUES('2020/02/02','02/08/2021',1,2)

SELECT * FROM JobHistory

--Write a SQL statement to add a foreign key constraint named fk_job_id on JobId column of JobHistory table referencing to the primary key JobId of jobs table.
ALTER TABLE JobHistory
ADD CONSTRAINT  fk_job_id FOREIGN KEY (Job_Id) REFERENCES Job(Job_Id)

--Write a SQL statement to drop the existing foreign key fk_job_id from JobHistory table on JobId column which is referencing to the JobId of jobs table.
ALTER TABLE JobHistory
DROP CONSTRAINT  fk_job_id

--Write a SQL statement to add a new column named location to the JobHistory table.
ALTER TABLE JobHistory
ADD Location VARCHAR(30)