CREATE TABLE JobHistory (
EmployeeId INT NOT NULL PRIMARY KEY IDENTITY(100,2) ,
StartDate DATE NOT NULL,
Job_Id INT NOT NULL,
EndDate VARCHAR(10) CONSTRAINT chkEnddate CHECK (EndDate like '__/__/____') ,
Department_Id INT CONSTRAINT dept_fk REFERENCES Department(Department_Id) on UPDATE Cascade
)


INSERT INTO JobHistory 
VALUES ('2020-09-9','12/09/2021',1,1),
('2020-09-9','12/09/2021',2,4),
('2020-09-9','12/09/2021',4,3),
('2020-09-9','12/09/2021',3,1)

SELECT * FROM JobHistory
