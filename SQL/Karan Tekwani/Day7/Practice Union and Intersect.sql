select * from HumanResources.Employee
select * from Person.Person


--Union
(select BusinessEntityID from HumanResources.Employee) union(select BusinessEntityID from Person.Person)
(select BusinessEntityID from HumanResources.Employee) union all(select BusinessEntityID from Person.Person)

--Difference Between Union and Union All is that Union takes only distinct values and Union all takes duplicate values
select count( BusinessEntityID) from ((select BusinessEntityID from HumanResources.Employee) union all(select BusinessEntityID from Person.Person)
)temp 
select count(distinct BusinessEntityID) from ((select BusinessEntityID from HumanResources.Employee) union all(select BusinessEntityID from Person.Person)
)temp 

--Intersect
--Insersect gives the common values in both the tables
(select BusinessEntityID from HumanResources.Employee) intersect(select BusinessEntityID from Person.Person)

select count(*) from ((select BusinessEntityID from HumanResources.Employee) intersect(select BusinessEntityID from Person.Person))temp
