--Calculate total salary paid in this month for all stations.
	  
			  SELECT CS.StationName,SUM(EM.Salary) AS [Salary Paid] 
			  FROM Employees [EM]
			  JOIN ChargingStation [CS] ON EM.StationID =CS.StationID
			  GROUP BY CS.StationName
	  

--Calculate charge amount for Rohit from used units.
    
			SELECT PO.[Chargesper_kwh(Unit)]*SE.[Units] AS [Charge Amount] FROM Session  [SE] 
			JOIN Customer AS [CU] ON SE.CustomerID=CU.CustomerID
			JOIN PORT AS [PO] ON SE.PortID= PO.PortID
			WHERE CU.Name='Rohit'


--Show the customer who have charged from the satation located in the city  'ahemdabad'.

			SELECT DISTINCT CU.Name FROM  Session AS [SE] 
			JOIN  [Port] AS [PO]          on  PO.PortID =SE.PortID
			JOIN  ChargingStation AS [CG] on  CG.StationId=PO.StationId 
			JOIN  Customer AS [CU]        on  CU.CustomerID =SE.CustomerID
			JOIN  City AS [C] ON CU.CityId=C.CityId
			WHERE C.CityName='Ahmedabad' 


--Write a query to check available ports for ccs-2 connection from all the stations.
		
			SELECT PO.StationID,COUNT(PO.PortID)as[CCS-2 Available Ports] FROM Port PO
			jOIN ChargingStation CH ON CH.StationID=PO.Stationid
			JOIN ConnectionType CO ON CO.TypeID =PO.ConnectionID
			WHERE CO.Type='ccs-2' and Availability = 1
			GROUP bY(PO.StationID)



--List station who is open for '24/7'and have Public Restroom.
			SELECT CS.StationName FROM StationHasAminity SA
			join ChargingStation CS ON CS.StationID=SA.StationId
			join Aminities AM ON AM.AminityID=SA.AminityID
			WHERE CS.Timing ='24/7' AND AminityName='Public Restroom'
		

--Set Connection type to the ccs-2 for all the car of kia company.
			update Customer
			set ConnectionID=(select TypeID 
							  from ConnectionType 
							  where Type='CCS-2')
			where Make='Kia'

--Show the customer who have charged from the satation located in the city where they are living.
							
			SELECT CU.Name FROM  Session AS [SE] 
			JOIN  [Port] AS [PO]   on  PO.PortID =SE.PortID
			JOIN  ChargingStation AS [CG] on  CG.StationId=PO.StationId 
			JOIN  Customer AS [CU]  on  CU.CustomerID =SE.CustomerID
			WHERE CU.CityId= CG.CityID

--UPDATE SessionRecord AMOUNT USING ConnectionPort TABLE PRICE 
--USING ROW_NUMBER  
   
    SELECT * INTO SessionRecord1  
	FROM (SELECT ROW_NUMBER() OVER(ORDER BY SessionID asc)as [ROW] ,* 
	      FROM SessionRecord )TEMP

	DECLARE @STEMP INT
	SET @STEMP=1
	while @STEMP<=(SELECT COUNT(SessionID)FROM SessionRecord)
	BEGIN
		DECLARE @AmountTEMP money,@PortNO int 
		SET @PortNO=(select PortID FROM SessionRecord1 where [ROW] = @STEMP)
		SET @AmountTEMP=(SELECT ChargesPerKWH FROM ConnectionPort WHERE PortID= @PortNO)
		UPDATE SessionRecord
		SET Amount=Units*@AmountTEMP
		WHERE SessionID=@STEMP
		SET @STEMP= @STEMP + 1
	END
	GO


	SELECT * FROM SessionRecord


		   
