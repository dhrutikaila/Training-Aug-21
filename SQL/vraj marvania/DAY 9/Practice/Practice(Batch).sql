--Declare Variable
--1.
	 DECLARE @TEMP INT
	 SET @TEMP=1
	 print @TEMP
--2.
	 DECLARE @TEMP INT=2
	 PRINT @TEMP


--IF-ELSE

--1>
	 IF DATENAME(weekday, GETDATE()) IN (N'Saturday', N'Sunday')
			   SELECT 'Weekend';
	 ELSE 
			   SELECT 'Weekday';


--2> UPDATE SALARY OF EMPID=101 IF EMP HAVE MORE THAN 5000 INC 50% ELSE 30%

    DECLARE @ID INT=101
    IF(select Salary from Employees where EmployeeID=@ID)<5000
        UPDATE Employees SET Salary=Salary*0.30 WHERE EmployeeID=@ID
    ELSE 
        UPDATE Employees SET Salary=Salary*0.50 WHERE EmployeeID=@ID


		SELECT * FROM SessionRecord

--Case Statement
--1>

	
	SELECT SessionID,CustomerID,Amount,'TAX'=
	CASE 
			WHEN Amount < 100 THEN '0% TAX'
			WHEN  Amount>=100 AND Amount<200 THEN '2% TAX'
			WHEN (Amount>200) THEN '5% TAX'
			end
	FROM SessionRecord

--2>


	SELECT SessionID,CustomerID,'Amount'=
	   CASE 
			WHEN Amount < 100 THEN Amount
			WHEN  Amount>=100 AND Amount<200 THEN Amount+(Amount*.02)
			WHEN Amount>200 THEN Amount+Amount*.05
			end
			,'TAX'=
	    CASE 
			WHEN Amount < 100 THEN '0% TAX'
			WHEN  Amount>=100 AND Amount<200 THEN '2% TAX'
			WHEN (Amount>200) THEN '5% TAX'
			end
	FROM SessionRecord
 
--3>
   -- Uses AdventureWorks  
  
	SELECT   ProductAlternateKey, Category =  
		  CASE ProductLine  
			 WHEN 'R' THEN 'Road'  
			 WHEN 'M' THEN 'Mountain'  
			 WHEN 'T' THEN 'Touring'  
			 WHEN 'S' THEN 'Other sale items'  
			 ELSE 'Not for sale'  
		  END,  
	   EnglishProductName  
	FROM dbo.DimProduct  
	ORDER BY ProductKey;  


--while

--INC BY 1
  	DECLARE @i int=1
		   while(@i<7)
			BEGIN
			print(@i)
			SET @i= @i+1
	 END

--2>update salary in employes table

	 DECLARE @ID INT = 100,@i int = 1
	 WHILE @i<=(SELECT COUNT(EmployeeID) from Employees )
		BEGIN
		   IF(select Salary from Employees where EmployeeID=@ID)<5000
				UPDATE Employees SET Salary=Salary+Salary*0.30 WHERE EmployeeID=@ID
		   ELSE 
				UPDATE Employees SET Salary=Salary+Salary*0.50 WHERE EmployeeID=@ID
		   SET @i=@i+1 
		   SET @id=@id+1
	   END

	 SELECT * FROM Employees

--3>UPDATE AMOUNT OF SessionRecord USING WHILE 
     USE evf

	DECLARE @STEMP INT
	SET @STEMP=1
	while @STEMP<=(SELECT COUNT(SessionID)FROM SessionRecord)
	BEGIN
		DECLARE @AmountTEMP money,@PortNO int 
		SET @PortNO=(select PortID FROM SessionRecord where SessionID = @STEMP)
		SET @AmountTEMP=(SELECT ChargesPerKWH FROM ConnectionPort WHERE PortID= @PortNO)
		update SessionRecord
		SET Amount=Units*@AmountTEMP
		WHERE SessionID=@STEMP
		SET @STEMP= @STEMP + 1
	END
	GO



