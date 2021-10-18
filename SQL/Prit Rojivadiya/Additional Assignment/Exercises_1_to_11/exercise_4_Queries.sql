-- 1. Write a SQL statement to rename the table countries to country_new using sp(store procedure).

EXEC sp_rename 'countries','country_new'



-- 2. Write a SQL statement to add a column region_id to the table locations.

ALTER TABLE Locations 
ADD region_id int



-- 3. Write a SQL statement to add a columns ID of the table locations.

ALTER TABLE Locations
ADD ID int



-- 4. Write a SQL statement to add a column region_id after state_province to the table locations

ALTER TABLE Locations
ADD region_id int



-- 5. Write a SQL statement change the data type of the column country_id to integer in the table locations.

ALTER TABLE Locations
DROP [DF__Locations__Count__5812160E]

ALTER TABLE Locations
ALTER COLUMN CountryId int



-- 6. Write a SQL statement to drop the column city from the table locations

ALTER TABLE Locations
DROP COLUMN City



-- 7. Write a SQL statement to change the name of the column state_province to state, keeping the data type and size same.

EXEC sp_rename 'Locations.StateProvince', 'state', 'COLUMN'



-- 8. Write a SQL statement to add a primary key for the columns location_id in the locations table.

ALTER TABLE Locations
ADD CONSTRAINT pk PRIMARY KEY(LocationID)



-- 9. Write a SQL statement to add a primary key fo r a combination of columns location_id and country_id.

ALTER TABLE Locations
ADD CONSTRAINT pk_combination PRIMARY KEY(LocationID,CountryID)



-- 10. Write a SQL statement to drop the existing primary from the table locations on a combination of columns location_id and country_id.

ALTER TABLE Locations
DROP CONSTRAINT pk_combination



-- 11. Write a SQL statement to add a foreign key on job_id column of job_history table referencing to the primary key job_id of jobs table.

ALTER TABLE JobHistory
ADD CONSTRAINT fk_jobid FOREIGN KEY(Job_id) REFERENCES Jobs(Job_id)



--	12. Write a SQL statement to add a foreign key constraint named fk_job_id on job_id column of job_history table referencing to the primary key job_id of jobs table.

ALTER TABLE JobHistory
ADD CONSTRAINT fk_job_id FOREIGN KEY(Job_id) REFERENCES Jobs(Job_id)



-- 13. Write a SQL statement to drop the existing foreign key fk_job_id from job_history table on job_id column which is referencing to the job_id of jobs table.

ALTER TABLE JobHistory
DROP CONSTRAINT fk_job_id



-- 14. Write a SQL statement to add an index named indx_job_id on job_id column in the table job_history.

CREATE INDEX indx_job_id ON JobHistory(Job_id)



-- 15. Write a SQL statement to drop the index indx_job_id from job_history table.

DROP INDEX indx_job_id ON JobHistory