

--Scaler Function 
Create Function Count_Emp_Jobtitle(@Jobtitle varchar(30))
Returns int
As
Begin
Declare @Emp_count int
Select @Emp_count=Count(JobTitle) from HumanResources.Employee where JobTitle=@Jobtitle
Return @Emp_count
End
Go

Select DBO.Count_Emp_Jobtitle(150)



Create Function NationalIDNumber(@BusinessEntityID int)
Returns int
As
Begin
Declare @NationalIDNumber int;
Select @NationalIDNumber=NationalIDNumber from HumanResources.Employee where BusinessEntityID=@BusinessEntityID
Return @NationalIDNumber
End
Go

Select DBO.NationalIDNumber(150)


--TABLE-VALUED Function
Create Function Details(@BusinessEntityID int)
Returns TABLE
As
Return
(
	SELECT * FROM HumanResources.Employee where BusinessEntityID=@BusinessEntityID
)
Go

Select * From  DBO.DETAILS(150)

---Modify/Alter Function
Alter Function Details(@BusinessEntityID int)
Returns TABLE
As
Return
(
	SELECT e.BusinessEntityID,p.FirstName,p.MiddleName,p.LAstName,e.JobTitle,e.HireDate,e.Gender 
	FROM HumanResources.Employee e join Person.Person p on e.BusinessEntityID=p.BusinessEntityID 
	where e.BusinessEntityID=@BusinessEntityID
)
Go

Select * From  DBO.DETAILS(150)

--DELETE Function
IF OBJECT_ID('Details') IS NOT NULL
	DROP Function Details
Go

