CREATE TABLE JobHistory(
	EmployeeId INT PRIMARY KEY,
	StartDate DATE NOT NULL,
	End_Date VARCHAR(8) CONSTRAINT enddate CHECK (End_Date LIKE '[0-3][0-9]/[0-1][0-9]/[1-2][0-9][0-9][0-9]') ,
	Job_Id SMALLINT NOT NULL,
	Department_Id SMALLINT,

);

DROP TABLE JobHistory;

INSERT INTO JobHistory VALUES (1,'20200625','02/09/2021',25,5);

SELECT * FROM JobHistory;
