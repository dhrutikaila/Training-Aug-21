USE AdventureWorks2016


--INNER JOIN Practice--

--Select workOrderID, ProductID, StockedQty, LocationID FROM WorkOrder and WorkOrderRouting Table
SELECT wo.WorkOrderID AS 'wo-WorkOrderID', 
	   wor.ProductID AS 'wor-ProductID', 
	   wo.StockedQty, wor.LocationID 
	   FROM Production.WorkOrder AS wo 
	   INNER JOIN Production.WorkOrderRouting AS wor 
	   ON wo.WorkOrderID = wor.WorkOrderID 
	   ORDER BY wo.WorkOrderID DESC

--Select ProductID,WorkOrderID,OrderQuantity, StockedQuantity From WorkOrder and WorkOrderRouying table where productid is 800
SELECT wor.ProductID, 
	   wor.WorkOrderID, 
	   wo.OrderQty,Wo.StockedQty 
	   FROM Production.WorkOrder AS wo 
	   INNER JOIN Production.WorkOrderRouting AS wor 
	   ON wo.ProductID=wor.ProductID
	   WHERE wo.ProductID = 800



--LEFT OUTER JOIN Practice--

--Select all WorkOrderID, ProductID, LocationID from workOrder and WorkOrderRouting table
SELECT wo.WorkOrderID AS 'wo-WorkOrderID',
	   wor.ProductID AS 'wor-ProductID',
	   wor.LocationID AS ' wor-LocationID'
	   FROM Production.WorkOrder AS wo
	   LEFT OUTER JOIN Production.WorkOrderRouting AS wor
	   ON wo.WorkOrderID=wor.WorkOrderID

--Select all ProductID from workOrder table with productId with WorkOrderRouting table using left outer join
SELECT wo.ProductID AS 'wo-ProductID',
	   wor.ProductID AS 'wor-ProductID'
	   FROM Production.WorkOrder AS wo
	   LEFT OUTER JOIN Production.WorkOrderRouting AS wor
	   ON wo.WorkOrderID=wor.WorkOrderID



--RIGHT OUTER JOIN Practice--

--Select all WorkOrderID from WorkOrderRouting table with productID,OrderQty from workOrder table
SELECT wor.WorkOrderID AS 'wor-WorkOrderID',
	   wo.ProductID AS 'wo-ProductID',
	   wo.OrderQty AS ' wo-OrderQty'
	   FROM Production.WorkOrder AS wo
	   RIGHT OUTER JOIN Production.WorkOrderRouting AS wor
	   ON wo.WorkOrderID=wor.WorkOrderID




--FULL OUTER JOIN Practice--
SELECT wo.WorkOrderID AS 'wo-WorkOrderID',
	   wor.WorkOrderID AS 'wor-WorkOrderID',
	   wo.ProductID AS 'wo-ProductID',
	   wor.ProductID AS 'wor-ProductID'
	   FROM Production.WorkOrder AS wo
	   FULL OUTER JOIN Production.WorkOrderRouting AS wor
	   ON wo.WorkOrderID = wor.WorkOrderID



--SELF JOIN Practice--
SELECT grp.GroupName AS 'grp-Name',
	   dept.Name AS 'dept-Name'
	   FROM HumanResources.Department AS dept
	   JOIN HumanResources.Department AS grp
	   ON grp.DepartmentID=dept.DepartmentID



--CROSS JOIN Practice--
SELECT  wo.ProductID AS 'wo.ProductID',
		wo.OrderQty AS 'wo-OrderQty',
		wor.LocationID As 'wor-LocationID'
		FROM Production.WorkOrder AS wo,
		Production.WorkOrderRouting AS wor

SELECT  wo.WorkOrderID AS 'wo-WorkOrderID',
		wor.ProductID AS 'wor-ProductID'
		FROM Production.WorkOrder AS wo,
		Production.WorkOrderRouting AS wor