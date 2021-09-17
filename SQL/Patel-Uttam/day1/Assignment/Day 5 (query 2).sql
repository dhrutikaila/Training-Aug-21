USE [Day5 (SSMS)]
GO

CREATE TABLE JobHistory 
(
EmployeeId int Primary key,
StartDate Date not null,
EndDate Date not null,
Job_Id int not null,
Department_Id int not null
);
GO

SELECT * FROM JobHistory
GO

INSERT into JobHistory VALUES (1,'01/05/1996','01/01/2000',4,5);
GO

SELECT * FROM JobHistory
GO

INSERT into JobHistory VALUES (2,'01/05/1996','01/01/2000',3,6);
GO

SELECT * FROM JobHistory
GO

ALTER TABLE JobHistory ALTER Column EndDate varchar(10) not null
GO

SELECT CONVERT(varchar , GetDate(),103)
GO

TRUNCATE TABLE JobHistory
GO

INSERT into JobHistory VALUES (1,'01/05/1996','01/01/2000',4,5);
GO


INSERT into JobHistory VALUES (2,'01/05/1996','01/01/2000',3,6);
GO

SELECT * FROM JobHistory
GO

ALTER TABLE JobHistory ALTER Column StartDate varchar(10) not null
GO

SELECT * FROM JobHistory
GO

TRUNCATE TABLE JobHistory
GO

SELECT * FROM JobHistory
GO

INSERT into JobHistory VALUES (2,'01/05/1996','01/01/2000',3,6);
GO

SELECT * FROM JobHistory
GO

INSERT into JobHistory VALUES (1,'01/05/1996','01/01/2000',3,4);
GO

SELECT * FROM JobHistory
GO
/*EmployeeId, StartDate, End_Eate, Job_Id and Department_Id*/