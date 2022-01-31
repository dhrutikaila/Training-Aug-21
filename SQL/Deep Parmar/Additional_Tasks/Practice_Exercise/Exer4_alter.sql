--1. Write a SQL statement to rename the table countries to country_new using sp(store procedure).
--SQL Server does not have any statement that directly renames a table. 
--However, it does provide you with a stored procedure named sp_rename that allows you to change the name of a table.
--EXEC sp_rename 'old_table_name', 'new_table_name'

	 EXEC sp_rename 'countries','country_new'

--2. Write a SQL statement to add a column region_id to the table locations.

	 ALTER TABLE Locations
	 ADD region_id INT 

	 SELECT * FROM Locations

--3. Write a SQL statement to add a columns ID of the table locations.

	 ALTER TABLE Locations	 
	 ADD ID INT NOT NULL 

--4. Write a SQL statement to add a column region_id after state_province to the table locations.
--ANSWER:-

--However, a user wanted to add the column between two of the columns. 
--SQL Server is relational engine. The order of the column should not matter in any of the T-SQL operations. 
--It does not matter in most of the cases 
--(except when the table is extra large, and it has many NULL columns it impacts the size of the table). 
--In reality whenever user wants to add a column to the table, he/she should just the column and 
--later retrieve the column in a specific order in the table using column names.

--5. Write a SQL statement change the data type of the column country_id to integer in the table locations.

	 ALTER TABLE Locations
	 ALTER COLUMN CountryId INT

--6. Write a SQL statement to drop the column city from the table locations.

	 ALTER TABLE Locations
	 DROP COLUMN City

--7. Write a SQL statement to change the name of the column state_province to state, keeping the data type and size same.

--sp_rename 'TableName.OldColumnName', 'New ColumnName', 'COLUMN';

	 EXEC sp_rename 'Locations.StateProvince','State','COLUMN'

--8. Write a SQL statement to add a primary key for the columns location_id in the locations table.

--ALTER TABLE tableName
--ADD CONSTRAINT constraintName PRIMARY KEY (column_1, column_2, ... column_n) 
--Note:- AFTER PRIMARY KEY Put a Column_Name in () it is necessary

	 ALTER TABLE Locations
	 ADD CONSTRAINT PK_LOCATION_ID PRIMARY KEY (LocationID)

	 --ANOTHER WAY:
	 ALTER TABLE Locations
	 ADD PRIMARY KEY (LocationID)

--9. Write a SQL statement to add a primary key for a combination of columns location_id and country_id.
--The Primary key can have a maximum of 16 columns.

--NOTE:- when we are creating composite primary key keep in mind composite column should be not null. 
--      If there is any column null in this case it will throw an error as below.

	 ALTER TABLE Locations
	 ADD CONSTRAINT PK_LocationId_CountryId PRIMARY KEY (LocationID,CountryID)

	 --ANOTHER WAY:
	 ALTER TABLE Locations
	 ADD PRIMARY KEY (LocationID,CountryID)
	 
--10. Write a SQL statement to drop the existing primary from the table locations on a combination of columns location_id and country_id.

	  ALTER TABLE Locations 
	  DROP CONSTRAINT PK_LocationId_CountryId

--11. Write a SQL statement to add a foreign key on job_id column of job_history table referencing to the primary key job_id of jobs table.

	  ALTER TABLE job_history
	  ADD FOREIGN KEY (job_id) REFERENCES jobs(job_id)

--12. Write a SQL statement to add a foreign key constraint named fk_job_id on job_id column of job_history 
--    table referencing to the primary key job_id of jobs table.

	  ALTER TABLE job_history
	  ADD CONSTRAINT fk_job_id FOREIGN KEY (job_id) REFERENCES jobs(job_id)

--13. Write a SQL statement to drop the existing foreign key fk_job_id from job_history table on job_id column 
--    which is referencing to the job_id of jobs table.

	  ALTER TABLE job_history
	  DROP CONSTRAINT fk_job_id

--14. Write a SQL statement to add an index named indx_job_id on job_id column in the table job_history.

	  CREATE INDEX indx_job_id ON job_history(job_id)

--15. Write a SQL statement to drop the index indx_job_id from job_history table.

	  DROP INDEX indx_job_id ON job_history