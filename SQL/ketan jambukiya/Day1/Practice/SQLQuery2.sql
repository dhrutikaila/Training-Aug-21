USE DEMO

--Write a SQL statement to create a table named JobHistory including columns EmployeeId, StartDate, End_Eate, Job_Id and Department_Id and make sure that the value against column EndDate will be entered at the time of insertion to the format like ‘–/–/—-‘.

CREATE TABLE Job_History
(
  Employee_Id DECIMAL (6,0) NOT NULL PRIMARY KEY,
  [Start_Date] DATE NOT NULL,
  End_Date VARCHAR(10) NOT NULL  CONSTRAINT  CheckDate CHECK	(End_Date like '__/__/____'),
  Job_Id VARCHAR (10) NOT NULL,
  Department_ID DECIMAL (4,0)
)