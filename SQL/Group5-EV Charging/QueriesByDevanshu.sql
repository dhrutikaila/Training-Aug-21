
USE EVCharging

----1.Write a query to check available ports from all the stations.

SELECT PortID,StationID,ConnectionID,
	(Select Type FROM ConnectionType Ct Where Ct.TypeID=Cp.ConnectionId) As ConnectionType,Availability FROM ConnectionPort Cp
		WHERE Availability=1			 			


----2.List all the customer from city ahmedabad and having the connectin type 'css-2'

DECLARE @AhmedabadCityID INT
SET @AhmedabadCityID=(SELECT CityID FROM City WHERE CityName='Ahmedabad')

DECLARE @CCS2id INT =(SELECT TypeID FROM ConnectionType WHERE Type='CCS-2')

SELECT C.Name,Ct.Type 
	FROM
		Customer C JOIN City Ci ON Ci.CityID=C.CityId
		JOIN ConnectionType Ct ON Ct.TypeID=C.ConnectionID
			WHERE Ci.CityID = @AhmedabadCityID AND Ct.TypeID=@CCS2id AND C.IsDeleted=0


----3. Count customers based on payment mode they have used.

SELECT Count(Customerid)As TotalCustomer,PaymentMode 
	FROM SessionRecord
	WHERE IsDeleted=0
		GROUP BY PaymentMode


----4. Show customer name, station name, employee name of the station located in Rajkot.

DECLARE @RajkotID INT 
SET @RajkotID= (SELECT CityId FROM City WHERE CityName='Rajkot')

SELECT C.Name,Cs.StationName,E.Name,Ci.CityName
	FROM 
		Customer C JOIN SessionRecord Sr ON C.CustomerID=Sr.CustomerID 
		JOIN ConnectionPort Cp ON Sr.PortID=Cp.PortID 
		JOIN ChargingStation Cs On Cs.StationID = Cp.StationId 
		JOIN EmployeeWorksAt Ewa ON Ewa.StationID = Cs.StationId 
		JOIN Employees E ON E.EmployeeID= Ewa.EmployeeID
		JOIN City Ci ON Cs.CityId=Ci.CityId
			WHERE Ci.CityID=@RajkotID AND C.IsDeleted=0


----5.List customer name,City,Port,Station,Employee who have used credit card for payment.

DECLARE @CreditCardID INT 
SET @CreditCardID=(SELECT ID FROM PaymentMode WHERE Mode='Credit Card')


SELECT C.CustomerId,C.Name,Ci.CityName,Ct.Type,Cs.StationName,E.Name,Pm.Mode 
	FROM 
		Customer C JOIN City Ci ON C.CityId=Ci.CityId 
		JOIN ConnectionType Ct ON C.ConnectionID = Ct.TypeID 
		JOIN SessionRecord Sr ON C.CustomerID=Sr.CustomerID 
		JOIN ConnectionPort Cp ON Sr.PortID=Cp.PortID 
		JOIN ChargingStation Cs ON Cs.StationID = Cp.StationId
		JOIN EmployeeWorksAt Ewa ON Ewa.StationID = Cs.StationID
		JOIN Employees E ON E.EmployeeID=Ewa.EmployeeID 
		JOIN PaymentMode Pm ON Sr.PaymentMode=Pm.ID
			WHERE Pm.ID=@CreditCardID AND C.IsDeleted=0 



----6. List the customers who have charged from station who has Parking facility.

DECLARE @ParkingID INT 
SET @ParkingID=(SELECT AminityID FROM Aminities WHERE AminityName='Parking')


SELECT C.Name
	FROM 
		Customer C JOIN SessionRecord Sr ON C.CustomerID=Sr.CustomerID 
		JOIN ConnectionPort Cp ON Sr.PortID=Cp.PortID 
		JOIN ChargingStation Cs On Cs.StationID = Cp.StationId 
		JOIN StationHasAminity Sa ON Sa.StationID= Cs.StationID 
		JOIN Aminities A ON Sa.AminityID=A.AminityID
			WHERE A.AminityID=@ParkingID AND C.IsDeleted=0


---- 7. Query to get the annual report of annual profit and loss

WITH ExpenditureCTE(StationId,StationName,TotalExpenditure)
AS
(
SELECT cs.StationID AS StationID,cs.StationName AS StationName ,SUM(ep.EnergyCharges) + SUM(ep.Maintainance) + SUM(ew.Salary) AS TotalExpenditure
    FROM
        Expenditure ep JOIN ChargingStation cs ON ep.StationID=cs.StationID
        JOIN EmployeeWorksAt ew ON ew.StationID=cs.StationID
        JOIN Employees e ON e.EmployeeID=ew.EmployeeID
        WHERE DATEPART(MM,ep.Date) = DATEPART(MM,ew.Date)
            AND DATEPART(YY,ep.Date) = DATEPART(YY,ew.Date)
            GROUP BY cs.StationID,cs.StationName                         
)

 SELECT cs.StationID,cs.StationName,SUM(s.Amount)-(SELECT TotalExpenditure FROM ExpenditureCTE E where E.StationID=Cs.StationID) AS ProfitORLoss
    FROM 
        SessionRecord s JOIN ConnectionPort p ON s.PortID=p.PortID
        JOIN ChargingStation cs ON p.StationId=cs.StationID
            WHERE s.Date BETWEEN CONVERT(DATE,'03/01/2021') AND CONVERT(DATE,'03/01/2022')
                AND cs.IsDeleted=0
                    GROUP BY cs.StationID,cs.StationName
                        ORDER BY ProfitORLoss DESC
 


