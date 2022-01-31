-- Practice Exercise:
--  (2)  Write a SQL statement to create a table named JobHistory including columns EmployeeId, StartDate, End_Eate, Job_Id and Department_Id 
--       and make sure that the value against column EndDate will be entered at the time of insertion to the format like ‘–/–/—-‘.


-- Create Database 

CREATE DATABASE TraineeAug
USE TraineeAug

--Create Table 

CREATE TABLE JobHistory
(
	EmployeeId SMALLINT not null,
	StartDate DATE NOT NULL,
	End_Eate varchar(10) NOT NULL CONSTRAINT chkEndDate CHECK(End_Eate LIKE '__/__/____' ),
	Job_Id INT NOT NULL,
	Department_Id DECIMAL(7,0) NOT NULL
)

INSERT INTO JobHistory VALUES(1,'10-02-2021','12/02/2021',12,5)


--Select table
SELECT * FROM JobHistory

--Delete Table
DROP TABLE JobHistory