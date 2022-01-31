--1. Write a SQL statement to rename the table countries to country_new using sp(store procedure).
sp_rename 'Countries' , 'Country_New'

--2. Write a SQL statement to add a column region_id to the table locations.
ALTER TABLE Locations
ADD Region_Id INT

--3. Write a SQL statement to add a columns ID of the table locations.
ALTER TABLE Locations
ADD Id INT
--4. Write a SQL statement to add a column region_id after state_province to the table locations.
ALTER TABLE Locations
ADD Region_Id INT
AFTER State_Province

--5. Write a SQL statement change the data type of the column country_id to integer in the table locations.
ALTER TABLE Locations
ALTER COLUMN Country_Id INT

--6. Write a SQL statement to drop the column city from the table locations.
ALTER TABLE Locations
DROP COLUMN City

--7. Write a SQL statement to change the name of the column state_province to state, keeping the data type and size same.
EXEC sp_rename 'Locations.State_Province','State','COLUMN'

--8. Write a SQL statement to add a primary key for the columns location_id in the locations table.
ALTER TABLE Locations
ADD CONSTRAINT PK_Location PRIMARY KEY(Location_Id)

--9. Write a SQL statement to add a primary key fo r a combination of columns location_id and country_id.
ALTER TABLE Locations
ADD CONSTRAINT PK_Location_Country PRIMARY KEY(Location_Id,Country_Id)

--10. Write a SQL statement to drop the existing primary from the table locations on a combination of columns location_id and country_id.
ALTER TABLE Locations
DROP CONSTRAINT PK_Location_Country

--11. Write a SQL statement to add a foreign key on job_id column of job_history table referencing to the primary key job_id of jobs table.
ALTER TABLE JobHistory
ADD CONSTRAINT FK_job_Id FOREIGN KEY (Job_Id) REFERENCES jobs(Job_Id)

--12. Write a SQL statement to add a foreign key constraint named fk_job_id on job_id column of job_history table referencing to the primary key job_id of jobs table.
ALTER TABLE JobHistory
ADD CONSTRAINT FK_job_Id FOREIGN KEY (Job_Id) REFERENCES jobs(Job_Id)

--13. Write a SQL statement to drop the existing foreign key fk_job_id from job_history table on job_id column which is referencing to the job_id of jobs table.
ALTER TABLE JobHistory
DROP CONSTRAINT FK_job_Id

--14. Write a SQL statement to add an index named indx_job_id on job_id column in the table job_history.
ALTER TABLE Job_History
ADD INDeX indx_job_id(Job_Id)

--15. Write a SQL statement to drop the index indx_job_id from job_history table.
ALTER TABLE Job_History
DROP INDeX indx_job_id