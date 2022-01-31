--INNER JOIN
SELECT pv.ProductID, v.BusinessEntityID, v.Name
FROM Purchasing.ProductVendor AS pv 
INNER JOIN Purchasing.Vendor AS v
    ON (pv.BusinessEntityID = v.BusinessEntityID)

	-- Same thing can be done by corelated query
SELECT pv.ProductID, v.BusinessEntityID, v.Name
FROM Purchasing.ProductVendor AS pv, Purchasing.Vendor AS v
WHERE pv.BusinessEntityID=v.BusinessEntityID


--cross join
SELECT * 
FROM HumanResources.Employee e cross join HumanResources.EmployeePayHistory 

-- Left Outer join
SELECT * 
FROM HumanResources.Employee e Left join HumanResources.EmployeePayHistory ep 
on e.BusinessEntityID = ep.BusinessEntityID

-- Right Outer join
SELECT * 
FROM HumanResources.Employee e Right join HumanResources.EmployeePayHistory ep 
on e.BusinessEntityID = ep.BusinessEntityID

-- full Outer join
SELECT * 
FROM HumanResources.Employee e full join HumanResources.EmployeePayHistory ep 
on e.BusinessEntityID = ep.BusinessEntityID


