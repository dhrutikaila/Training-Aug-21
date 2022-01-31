--INNER JOIN--
SELECT ProductID
     , Purchasing.Vendor.BusinessEntityID
	 , Name
FROM Purchasing.ProductVendor 
     JOIN Purchasing.Vendor
     ON Purchasing.ProductVendor.BusinessEntityID = Purchasing.Vendor.BusinessEntityID
WHERE StandardPrice > $10
  AND Name LIKE N'F%'

  --LEFT OUTER JOIN--
  SELECT ProductID
     , Purchasing.Vendor.BusinessEntityID
	 , Name
FROM Purchasing.ProductVendor 
     LEFT OUTER JOIN Purchasing.Vendor
     ON Purchasing.ProductVendor.BusinessEntityID = Purchasing.Vendor.BusinessEntityID
WHERE StandardPrice > $10
  AND Name LIKE N'F%'

  --RIGHT OUTER JOIN--
  SELECT ProductID
     , Purchasing.Vendor.BusinessEntityID
	 , Name
FROM Purchasing.ProductVendor 
     RIGHT OUTER JOIN Purchasing.Vendor
     ON Purchasing.ProductVendor.BusinessEntityID = Purchasing.Vendor.BusinessEntityID
WHERE StandardPrice > $10
  AND Name LIKE N'F%'

  --FULL OUTER JOIN--
  SELECT ProductID
     , Purchasing.Vendor.BusinessEntityID
	 , Name
FROM Purchasing.ProductVendor 
    FULL OUTER JOIN Purchasing.Vendor
     ON Purchasing.ProductVendor.BusinessEntityID = Purchasing.Vendor.BusinessEntityID
WHERE StandardPrice > $10
  AND Name LIKE N'F%'

  --CROSS JOIN--
  SELECT ProductID
     , Purchasing.Vendor.BusinessEntityID
	 , Name
FROM Purchasing.ProductVendor 
     CROSS JOIN Purchasing.Vendor
WHERE StandardPrice > $10
  AND Name LIKE N'F%'

  --SELF JOIN--
  SELECT E1.BusinessEntityID
       , E2.DepartmentID
  FROM HumanResources.EmployeeDepartmentHistory E1
       JOIN HumanResources.EmployeeDepartmentHistory E2
	   ON E1.DepartmentID=E2.BusinessEntityID
 