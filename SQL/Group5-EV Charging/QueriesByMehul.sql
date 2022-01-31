USE EVcharging

--1.Calculate duration of charging for all the vehical charged in station whose id is 4.

SELECT CustomerID,StartTime,EndTime,DATEDIFF(mi,StartTime,EndTime) AS Duration 
	FROM SessionRecord 
		WHERE PortID IN 
			(SELECT PortID FROM ConnectionPort WHERE StationId = 4)
			AND IsDeleted=0

--2.Waq to list available ports,connection type,charges,station name,timing,city from station 'NOVA'.

DECLARE @Station INT = (SELECT StationID FROM ChargingStation WHERE StationName='NOVA')
SELECT p.PortID,ct.Type,p.ChargesPerKWH,cs.StationName,cs.Timing,c.CityName
	FROM 
		ConnectionPort p JOIN ChargingStation cs ON p.StationId=cs.StationID 
		JOIN ConnectionType ct ON ct.TypeID=p.ConnectionID 
		JOIN City c ON c.CityID=cs.CityID 
			WHERE cs.StationID=@Station 
				AND p.Availability=1 
				AND p.IsDeleted=0 

--3.Show the employee name,station name where kevin was charged his vehical.

DECLARE @Customer INT = (SELECT CustomerID FROM Customer WHERE Name = 'Kevin')
SELECT c.Name AS CustomerName,cs.StationName,e.Name AS EmployeeName
	FROM 
		SessionRecord s JOIN Customer c  ON s.CustomerID=c.CustomerID
		JOIN ConnectionPort p ON s.PortID = p.PortID
		JOIN ChargingStation cs ON cs.StationID=p.StationID
		JOIN EmployeeWorksAt ew ON ew.StationID=cs.StationID
		JOIN Employees e ON e.EmployeeID=ew.EmployeeID
			WHERE c.CustomerID = @Customer

--4.List customer name who have charged on 27 august 2021.

SELECT c.Name,s.Date
	FROM 
		SessionRecord s JOIN Customer c ON s.CustomerID=c.CustomerID 
			WHERE s.Date='08/27/2021'

--5.List all the stations who has rating less than 3.

SELECT f.StationId,cs.StationName,AVG(f.Rating) AS Rating 
	FROM 
		Feedback f JOIN ChargingStation cs ON f.StationId=cs.StationID 
			WHERE cs.IsDeleted=0
				GROUP BY cs.StationName,f.StationId 
					HAVING AVG(f.Rating)<=3

--6.List station from Surat city who provides salon facility.

DECLARE @Aminity INT = (SELECT AminityID FROM Aminities WHERE AminityName='Salon')
DECLARE @City INT = (SELECT CityID FROM City WHERE CityName='Surat')
SELECT cs.StationName,c.CityName,a.AminityName
	FROM 
		ChargingStation cs JOIN StationHasAminity sa ON cs.StationID=sa.StationId 
		JOIN Aminities a ON sa.AminityID=a.AminityID
		JOIN City c ON c.CityID = cs.CityID
			WHERE a.AminityID=@Aminity AND c.CityID=@City
				AND cs.IsDeleted=0

--7.Generate annual income report stationwise.

SELECT cs.StationID,cs.StationName,SUM(s.Amount) AS Income 
	FROM 
		SessionRecord s JOIN ConnectionPort p ON s.PortID=p.PortID
		JOIN ChargingStation cs ON p.StationId=cs.StationID
			WHERE s.Date BETWEEN CONVERT(DATE,'03/01/2021') AND CONVERT(DATE,'03/01/2022')
				AND cs.IsDeleted=0
					GROUP BY cs.StationID,cs.StationName
						ORDER BY Income DESC
				
--8.Generate monthly expenditure report stationwise.

SELECT cs.StationID,cs.StationName,SUM(ep.EnergyCharges) + SUM(ep.Maintainance) + SUM(ew.Salary) AS TotalExpenditure
	FROM
		Expenditure ep JOIN ChargingStation cs ON ep.StationID=cs.StationID
		JOIN EmployeeWorksAt ew ON ew.StationID=cs.StationID
		JOIN Employees e ON e.EmployeeID=ew.EmployeeID
		WHERE DATEPART(MM,ep.Date) = DATEPART(MM,ew.Date)
			AND DATEPART(YY,ep.Date) = DATEPART(YY,ew.Date)
				GROUP BY cs.StationID,cs.StationName
					ORDER BY TotalExpenditure

--9.List down different ports customers sort in descending order.

SELECT sr.PortID,COUNT(sr.CustomerID) AS NoOfCustomers
	FROM
		Customer c JOIN SessionRecord sr ON c.CustomerID=sr.CustomerID
			GROUP BY sr.PortID
				ORDER BY NoOfCustomers DESC

--10.Waq to get charges for connectiontype.

CREATE PROCEDURE GetCharges @ConnectionType INT
	AS
		SELECT ct.TypeID AS TypeID,ct.Type AS ConnectionType,cp.ChargesPerKWH AS Charges,
				cp.PortID AS PortNO,cs.StationName 
					FROM 
						ConnectionPort cp JOIN ConnectionType ct ON ct.TypeID=cp.ConnectionID 
						JOIN ChargingStation cs ON cs.StationID=cp.PortID
							WHERE ct.TypeID = @ConnectionType


EXEC GetCharges 2
