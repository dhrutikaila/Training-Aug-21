---1. Write a SQL statement to rename the table countries to country_new using sp(store
---   procedure)

sp_rename 'countries', 'country_new';

sp_rename 'country_new', 'countries';

---2. Write a SQL statement to add a column region_id to the table locations.

ALTER TABLE locations ADD region_id INT;

---3. Write a SQL statement to add a columns ID of the table locations.

ALTER TABLE locations ADD ID INT;

---4. Write a SQL statement to add a column region_id after state_province to the table locations.

ALTER TABLE locations ADD region_id INT ;

---5. Write a SQL statement change the data type of the column country_id to integer in the table locations.
 
 ALTER TABLE locations ALTER COLUMN region_id INT

 ---6. Write a SQL statement to drop the column city from the table locations.

 ALTER TABLE locations DROP COLUMN citty


 ---7. Write a SQL statement to change the name of the column state_province to state, keeping the data type and size same.

 EXEC sp_rename 'Locations.StateProvince', 'state', 'COLUMN';

---8. Write a SQL statement to add a primary key for the columns location_id in the locations table.
CREATE TABLE demo
(
demo_id INT NOT NULL
)

ALTER TABLE demo ADD CONSTRAINT new_pk PRIMARY KEY (demo_id);

---9. Write a SQL statement to add a primary key for a combination of columns location_id and country_id.
CREATE TABLE PRACTICE
(
location_id INT NOT NULL,
country_id INT NOT NULL
)

ALTER TABLE PRACTICE ADD CONSTRAINT newPK PRIMARY KEY (location_id,country_id);

--10. Write a SQL statement to drop the existing primary from the table locations on a combination of columns location_id and country_id.
ALTER TABLE PRACTICE DROP CONSTRAINT newPK;

---11. Write a SQL statement to add a foreign key on job_id column of job_history table referencing to the primary key job_id of 
---    jobs table

CREATE TABLE JOBS
(
JobID VARCHAR(10) PRIMARY KEY,
JobName varchar,
JobTitle varchar
)

ALTER TABLE JobHistory
 WITH CHECK ADD CONSTRAINT fk_new
FOREIGN KEY (JobID) REFERENCES jobs(JobID)


---12. Write a SQL statement to add a foreign key constraint named fk_job_id on job_id column of job_history table referencing 
---    to the primary key job_id of jobs table.


---13. Write a SQL statement to drop the existing foreign key fk_job_id from job_history tableon job_id column which is 
---    referencing to the job_id of jobs table.
ALTER TABLE JOBS
DROP CONSTRAINT PIYUSH;


---14. Write a SQL statement to add an index named indx_job_id on job_id column in the table job_history.
CREATE INDEX indx_job_id
ON JobHistory(JobID);


---15. Write a SQL statement to drop the index indx_job_id from job_history table.
DROP INDEX JobHistory.indx_job_id;