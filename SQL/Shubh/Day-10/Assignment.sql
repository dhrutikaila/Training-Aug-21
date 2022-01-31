--1.Using cursor implement the following task employee.
--Update the salary of the employee using following condition
--Salary between 30000 and 40000 — 5000 hike,Salary between 40000 and 55000 — 7000 hike,Salary between 55000 and 65000 — 9000 hike

CREATE TABLE Employee (
	EmployeeId INT PRIMARY KEY,
	EmployeeName VARCHAR(30),
	DepartmenName VARCHAR(30),
	ManagerId INT NULL,
	HireDate DATETIME,
	Salary INT,
	comm NUMERIC(7,2) NULL,
	DepartmentId INT
	)

INSERT INTO Employee VALUES
    (1,'JOHNSON','ADMIN',6,'12-17-1990',33000,NULL,4),
    (2,'HARDING','MANAGER',9,'02-02-1998',52000,300,3),
    (3,'TAFT','SALES I',2,'01-02-1996',33000,500,3),
    (4,'HOOVER','SALES I',2,'04-02-1990',36000,NULL,3),
    (5,'LINCOLN','TECH',6,'06-23-1994',69000,1400,4),
    (6,'GARFIELD','MANAGER',9,'05-01-1993',54999,NULL,4),
    (7,'POLK','TECH',6,'09-22-1997',48000,NULL,4),
    (8,'GRANT','ENGINEER',10,'03-30-1997',32000,NULL,2),
    (9,'JACKSON','CEO',NULL,'01-01-1990',64800,NULL,4),
    (10,'FILLMORE','MANAGER',9,'08-09-1994',48600,NULL,2),
	(11,'ADAMS','ENGINEER',10,'03-15-1996',34000,NULL,2),
    (12,'WASHINGTON','ADMIN',6,'04-16-1998',18000,NULL,4),
    (13,'MONROE','ENGINEER',10,'12-03-2000',30000,NULL,2),
	(14,'ROOSEVELT','CPA',9,'10-12-1995',35000,NULL,1),
	(15,'SHUBH','MEME',NULL,'02-08-2021',35000,1000,1)



SET NOCOUNT ON
DECLARE @Id INT, @Name VARCHAR(50), @Salary INT
DECLARE Employee_Cursor CURSOR
STATIC FOR
SELECT  EmployeeId,EmployeeName,Salary FROM Employee  
OPEN Employee_Cursor
IF @@CURSOR_ROWS > 0
BEGIN
FETCH NEXT FROM Employee_Cursor INTO @Id,@Name,@Salary
WHILE @@FETCH_STATUS = 0 
WHILE @Id<=15
BEGIN
	  SET @Id=@Id+1
	  SET @Salary = CASE 
                  WHEN @Salary BETWEEN 30000 AND 40000 THEN @Salary + 5000
				  WHEN @Salary BETWEEN 40000 AND 55000 THEN @Salary + 7000
				  WHEN @Salary BETWEEN 55000 AND 80000 THEN @Salary + 9000
                  ELSE @Salary
                  END 
BEGIN  
PRINT 'Id: '+ CONVERT(VARCHAR(20),@Id)+', Name:'+@Name+', Salary:'+CONVERT(VARCHAR(20),@Salary)
FETCH NEXT FROM Employee_Cursor INTO @Id,@Name,@Salary
END
END
END
CLOSE Employee_Cursor
DEALLOCATE Employee_Cursor
SET NOCOUNT OFF
