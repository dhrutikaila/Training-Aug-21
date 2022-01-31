CREATE TABLE JobHistory (
EmployeeId INT NOT NULL PRIMARY KEY IDENTITY(1,1) , 
StartDate DATE NOT NULL, 
End_Date VARCHAR(10) CONSTRAINT cEnddate CHECK (End_Date like '__/__/____') ,
Job_Id INT NOT NULL,
Department_Id INT CONSTRAINT dept_fk REFERENCES Department(Department_Id)
)



INSERT INTO JobHistory VALUES ('2020-09-9','12/09/2021',1,1)

SELECT * FROM JobHistory