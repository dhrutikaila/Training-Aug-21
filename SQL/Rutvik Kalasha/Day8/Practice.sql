--1
DECLARE @count INT
SET @count=1
WHILE(@count<=10)
BEGIN
PRINT @count;
SET @count=@count+1
END

--2
DECLARE @MAXSAL INT
SELECT @MAXSAL=MAX(Salary) FROM Employees;
IF @MAXSAL<50000
SELECT @MAXSAL+ 400
ELSE
SELECT @MAXSAL

--3
CREATE TABLE SimTable(
Id INT, EmployeeName VARCHAR(50), DepartmentName VARCHAR(50)
);

INSERT INTO SimTable ( Id, EmployeeName, DepartmentName) VALUES (1, 'Rutvk Kalasha','Dotnet'),
                                                                (2, 'Darsgan Kalathiya','HR'),
                                                                (3, 'Akash Muliya','PHP'),
                                                                (4, 'Nayan Prajapati','ANDROID') ,
                                                                (5, '','IOS')
SELECT * FROM SimTable

DECLARE @Counter INT , @MaxId INT, 
        @EmployeeName NVARCHAR(50),
		@DepartmentName NVARCHAR(50)

SELECT @Counter = MIN(Id) , @MaxId = MAX(Id) 
FROM SimTable
 
WHILE(@Counter IS NOT NULL
      AND @Counter <= @MaxId)
BEGIN
   SELECT @EmployeeName = EmployeeName,@DepartmentName = DepartmentName
   FROM SimTable WHERE Id = @Counter
    
   PRINT CONVERT(VARCHAR,@Counter) + '. Employee name is ' + @EmployeeName  +' And Department is ' +@DepartmentName
   SET @Counter  = @Counter  + 1		   
END

--4
DECLARE @EmployeeID INT = 101

IF (@EmployeeID = 100)
Select * from Employees WHERE EmployeeID = 100
ELSE
Select * from Employees WHERE EmployeeID != 101

