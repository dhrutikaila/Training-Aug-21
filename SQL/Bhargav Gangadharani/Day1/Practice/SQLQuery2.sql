create table  JobHistory
(	EmployeeId int NOT NULL,
	StartDate date NOT NULL, 
	End_Date VARCHAR(10) NOT NULL CONSTRAINT chkdate CHECK (End_Date like '__/__/____'), 
	Job_Id int NOT NULL, 
	Department_Id int NOT NULL)