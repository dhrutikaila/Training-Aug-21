
--1.Write a query to check availabel ports from stations located in gujarat.

    DECLARE @SN varchar(10)='Gujrat'    
   SELECT PortID 
   FROM ConnectionPort p JOIN ChargingStation ch ON p.StationId=ch.StationID
   JOIN City c ON ch.CityID=c.CityID
   JOIN states s ON s.StateID=c.StateID 
   WHERE name=@SN AND p.Availability=1


--2.List Customers whose connection type is ccs-2.
     
 DECLARE @CT VARCHAR(10)='CCS-2'
 SELECT c.name AS Customername FROM 
 Customer c JOIN ConnectionType ct ON c.ConnectionID=ct.TypeID 
 WHERE type=@CT
 

--3.Waq to check station availability in rajkot for CHAdeMO connection type.
     
	 DECLARE @CN VARCHAR(10)='Rajkot',@CONTYPE VARCHAR(10)='CHAdeMO'
     SELECT StationName FROM ChargingStation WHERE CityID IN
    (SELECT CityID FROM City WHERE CityName=@CN)
    AND StationID IN
    ( SELECT StationID FROM ConnectionPort p JOIN ConnectionType ct ON p.ConnectionID=ct.TypeID
	  WHERE ct.Type=@CONTYPE)


--4.Calculate the charges done by Jaydeep from the station 'TATA'.
      
	  DECLARE @STANAME VARCHAR(10)='TATA',@NAME VARCHAR='Jaydeep'
      SELECT SUM(Amount) FROM SessionRecord WHERE CustomerID IN
     (SELECT CustomerID FROM Customer WHERE Name=@NAME)
     AND PortID IN
	(SELECT PortID FROM ConnectionPort p JOIN ChargingStation cs ON p.StationId=cs.StationID
	WHERE cs.StationName=@STANAME)


--5. List average rating of all the stations.
  
	SELECT AVG(Rating) AS AverageRating ,f.StationId 
	FROM Feedback f JOIN ChargingStation ch ON f.StationId=ch.StationID
	GROUP BY f.StationId
    
   
--6. List all the public stations with connection 'GB/T'.

     DECLARE @TYPE VARCHAR(10)='GB/T',@SNAME VARCHAR(10)='Public'
	SELECT ch.StationName FROM StationStatus s JOIN ChargingStation ch ON s.StatusID=ch.StatusID 
	JOIN ConnectionPort p ON ch.StationID=p.StationId
	JOIN ConnectionType c ON c.TypeID=p.ConnectionID 
	WHERE Type=@TYPE AND s.StatusName=@SNAME