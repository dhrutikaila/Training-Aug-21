
/*  1. Create a scaler Function to compute PF which will accept parameter basicsalary and compute PF. 
PF is 12% of the basic salary.   */

Create function Cal_PF (@Salary int)
Returns float
As
Begin
	Return (@Salary*0.12)
End
Go

SELECT 'PF' =dbo.Cal_PF(10000)


/*  2. Create a scaler Function which will compute PT which will accept MontlyEarning. */
Create Function Cal_PT(@MontlyEarning int)
Returns int
As
BEGIN
Declare @PT int
Select @PT = case 
				When (@MontlyEarning < 6000 ) Then 0
				When (@MontlyEarning >= 6000 And @MontlyEarning < 9000) Then 80
				When (@MontlyEarning >= 9000 And @MontlyEarning < 12000) Then 150
				When (@MontlyEarning > 12000 ) Then 200
				End
Return @PT
End
GO

Select 'PT' = dbo.Cal_PT(10000)


-- 3. Create a table valued function which will accept JobTitle which will return new table set based on jobtitle  
Create Function udf_Emp_Details (@JobTitle varchar(50))
Returns Table
As
Return
(
	Select * from HumanResources.Employee where JobTitle=@JobTitle
)
Go


Select * From dbo.udf_Emp_Details('Sales Representative')
