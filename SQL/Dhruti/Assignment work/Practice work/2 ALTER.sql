USE test1

--1.Write a SQL statement to rename the table countries to country_new using sp(store procedure).
sp_rename 'Countries','COUNTR_NEW'


RENAME TABLE Coun TO coun_new

--2. Write a SQL statement to add a column region_id to the table locations.
ALTER TABLE Location
ADD region_id INT;


--3. Write a SQL statement to add a columns ID of the table locations.
ALTER TABLE Location
ADD ID INT ;

--4. Write a SQL statement to add a column region_id after state_province to the table locations.
ALTER TABLE Location 
ADD st_province VARCHAR;

--5. Write a SQL statement change the data type of the column country_id to integer in the table locations.
ALTER TABLE Countri
ALTER COLUMN country_id INT;

--6. Write a SQL statement to drop the column city from the table locations.
ALTER TABLE Location
DROP COLUMN city ;

--7. Write a SQL statement to change the name of the column state_province to state, keeping the data type and size same.
ALTER TABLE Location
Add state varchar;

--8. Write a SQL statement to add a primary key for the columns location_id in the locations table.
ALTER TABLE Location
ADD CONSTRAINT id_pk PRIMARY KEY (LocationID);

--9. Write a SQL statement to add a primary key fo r a combination of columns location_id and country_id.
ALTER TABLE Locations
ADD CONSTRAINT ids_pk PRIMARY KEY (LocationID,CountryID);

--10. Write a SQL statement to drop the existing primary from the table locations on a combination of columns location_id and country_id.
ALTER TABLE Locations
DROP   CONSTRAINT ids_pk ;

--11. Write a SQL statement to add a foreign key on job_id column of job_history table referencing to the primary key job_id of jobs table.
ALTER TABLE jobhistor
ADD CONSTRAINT ids_Fk   
FOREIGN KEY (job_id) REFERENCES jo(job_id);

--12. Write a SQL statement to add a foreign key constraint named fk_job_id on job_id column of job_history table referencing to the primary key job_id of jobs table.

--13. Write a SQL statement to drop the existing foreign key fk_job_id from job_history table on job_id column which is referencing to the job_id of jobs table.

--14. Write a SQL statement to add an index named indx_job_id on job_id column in the table job_history.

--15. Write a SQL statement to drop the index indx_job_id from job_history table.