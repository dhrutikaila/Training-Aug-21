--CREATE 
    USE DAY5
	CREATE PROCEDURE GetProductDesc
	AS
	BEGIN
 		SELECT P.ProductID,P.ProductName,PD.ProductDescription  
		FROM Product P
		INNER JOIN ProductDescription PD ON P.ProductID=PD.ProductID
    END

	EXEC GetProductDesc

--Stored procedure with default parameters values

	CREATE PROCEDURE GetProductDesc_withDefaultparameters(@PID INT =706)
	AS
	BEGIN
		SELECT P.ProductID,P.ProductName,PD.ProductDescription  
		FROM Product P
		INNER JOIN ProductDescription PD ON P.ProductID=PD.ProductID
		WHERE P.ProductID=@PID
	END

	EXEC GetProductDesc_withDefaultparameters
	EXEC GetProductDesc_withDefaultparameters @PID=707

--Stored procedure with an output parameter
	CREATE PROCEDURE COUNTEMP @EMPNO INT OUTPUT
	AS
	BEGIN
	SELECT @EMPNO=COUNT(EmployeeID) 
	FROM Employees 
	END


	DECLARE @ENO INT 
	EXEC COUNTEMP @ENO OUTPUT
	SELECT @ENO

--Stored procedure with Return
	 CREATE PROCEDURE COSUNTEMP2 
	AS
	RETURN(SELECT COUNT(EmployeeID) 
		   FROM Employees) 



	DECLARE @ENO INT 
	EXEC @ENO=COUNTEMP2
	SELECT @ENO



--ALTER
	ALTER PROCEDURE COUNTEMP01
	AS
	RETURN(SELECT EmployeeID FROM Employees  FOR JSON AUTO)

	DECLARE @ENO NVARCHAR(MAX)
	EXEC  @ENO=COUNTEMP8
	SELECT @ENO
    SELECT * FROM OPENJSON(@ENO)
    WITH(ID VARCHAR '$.FirstName')

--ENCRYPTION
	CREATE PROCEDURE COUNTEMP01
	with  ENCRYPTION
	AS
	RETURN(SELECT EmployeeID FROM Employees  FOR JSON AUTO)

	SP_HELPTEXT COUNTEMP01

--TRY...CATCH 
	USE AdventureWorks2012
	GO

	CREATE PROCEDURE Exception_Demo3
	AS
    BEGIN TRY
        INSERT INTO DEMO1 
            SELECT  'AAAA','ABC'
    END TRY
	
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH

	EXEC Exception_Demo3


	SELECT * FROM DEMO1


--EV CHARGING 
--1
	USE  EVF
	SELECT * INTO SessionRecord1  
	FROM (SELECT ROW_NUMBER() OVER(ORDER BY SessionID asc)as [ROW] ,* 
		  FROM SessionRecord )TEMP --GIVE ROW_NUMBER

	SELECT * FROM SessionRecord
	SELECT * FROM SessionRecord1


	--PROCEDURE
	CREATE PROCEDURE UPAMOUNT @STEMP INT 
	AS
	BEGIN
			DECLARE @AmountTEMP MONEY,@PortNO INT        
			SET @PortNO=(SELECT PortID FROM SessionRecord1 where [ROW] = @STEMP)
			SET @AmountTEMP=(SELECT ChargesPerKWH FROM ConnectionPort WHERE PortID= @PortNO)
			UPDATE SessionRecord
			SET Amount=Units*@AmountTEMP
			WHERE SessionID=@STEMP	
	END

	--LOOP EXEC
	DECLARE @STEMP INT
	SET @STEMP=1
	WHILE @STEMP<=(SELECT COUNT(SessionID)FROM SessionRecord)
	BEGIN
		 EXEC UPAMOUNT @STEMP  --CALL PROCEDURE
		 SET @STEMP= @STEMP + 1
	END
	GO

	SELECT * FROM SessionRecord





