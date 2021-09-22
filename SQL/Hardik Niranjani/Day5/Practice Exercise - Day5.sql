
--Joins Practice

-- Left Outer Join
		SELECT ProductID, Purchasing.Vendor.BusinessEntityID, [Name], StandardPrice
		FROM Purchasing.ProductVendor 
		LEFT OUTER JOIN Purchasing.Vendor
		ON (Purchasing.ProductVendor.BusinessEntityID = Purchasing.Vendor.BusinessEntityID)
		ORDER BY StandardPrice DESC


--Inner Join
			SELECT ProductID, Purchasing.Vendor.BusinessEntityID, Name
			FROM Purchasing.ProductVendor 
			INNER JOIN Purchasing.Vendor
			ON (Purchasing.ProductVendor.BusinessEntityID = Purchasing.Vendor.BusinessEntityID)
			WHERE StandardPrice > 10
			AND Name LIKE N'F%'


--Right Outer Join
		SELECT ProductID, Purchasing.Vendor.BusinessEntityID, [Name], StandardPrice
		FROM Purchasing.ProductVendor 
		RIGHT OUTER JOIN Purchasing.Vendor
		ON (Purchasing.ProductVendor.BusinessEntityID = Purchasing.Vendor.BusinessEntityID)
		WHERE StandardPrice > 10
		AND Name LIKE N'F%'
		ORDER BY StandardPrice DESC


--Full Outer Join
		SELECT ProductID, Purchasing.Vendor.BusinessEntityID, [Name], StandardPrice
		FROM Purchasing.ProductVendor 
		FULL OUTER JOIN Purchasing.Vendor
		ON (Purchasing.ProductVendor.BusinessEntityID = Purchasing.Vendor.BusinessEntityID)
		WHERE StandardPrice > 10
		AND Name LIKE N'F%'
		ORDER BY StandardPrice DESC


--Cross join

		SELECT ProductID, Purchasing.Vendor.BusinessEntityID, [Name], StandardPrice
		FROM Purchasing.ProductVendor 
		CROSS JOIN Purchasing.Vendor
		WHERE StandardPrice > 10
		AND Name LIKE N'F%'
		ORDER BY StandardPrice DESC


--Self Join

SELECT V1.BusinessEntityID,V2.[Name] 
		 FROM Purchasing.Vendor V1
		 JOIN Purchasing.Vendor V2
		 ON V1.BusinessEntityID = V2.BusinessEntityID


