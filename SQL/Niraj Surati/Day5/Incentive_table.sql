USE Assignment2

SP_HELP 'Employees'

-- Creating New Table Incentives

CREATE TABLE Incentives(
	  Incentive_ID INT CONSTRAINT ASG_INC_PK PRIMARY KEY IDENTITY(1,1)
	, Employee_Ref_Id DECIMAL(6) NOT NULL
	, Incentive_Date DATE
	, Incentive_Amount MONEY
	, CONSTRAINT ASG_INC_ER FOREIGN KEY (Employee_Ref_Id) REFERENCES Employees(EmployeeID) ON DELETE CASCADE ON UPDATE CASCADE
)


ALTER TABLE Incentives
DROP CONSTRAINT ASG_INC_ER

ALTER TABLE Incentives
DROP CONSTRAINT ASG_INC_PK

DROP TABLE Incentives

SELECT * FROM Incentives

-- Inserting Values

INSERT INTO Incentives
		VALUES(105,'2021-08-17',4000)
	,	(110,'2021-08-17',2000)
	,	(112,'2021-08-17',8000)
	,	(114,'2021-08-17',1000)
	,	(118,'2021-08-17',3000)
	,	(123,'2021-08-17',2500)
	,	(127,'2021-08-17',5000)
	,	(132,'2021-08-17',4500)
	,	(138,'2021-08-17',7000)
	,	(140,'2021-08-17',6000)
	,	(155,'2021-08-17',5500)
	,	(157,'2021-08-17',1000)
	,	(159,'2021-08-17',9000)
	,	(160,'2021-08-17',4000)
	,	(165,'2021-08-17',3000)
	,	(169,'2021-08-17',1414)
	,	(170,'2021-08-17',2500)
	,	(198,'2021-08-17',5000)
	,	(206,'2021-08-17',10000)


SELECT * FROM Employees








