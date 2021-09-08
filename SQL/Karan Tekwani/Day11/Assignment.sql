/* 1. Create a Store Procedure which will accept name of the customer as input parameter
and product the following output, List Names of Customers who are Depositors and have Same Branch City 
as that of input parameter customer’s Name.   */

Alter PROCEDURE CustomerSameBranch  @Name varchar(25)
AS
select Cname from DepositeTable d join BranchTable b on d.Bname=b.Bname where b.City=
(select b.City from DepositeTable d join BranchTable b on d.Bname=b.Bname where d.Cname=@Name)

EXEC CustomerSameBranch @Name='Sunil'

/* 2.  Create a Store Procedure which will accept name of the customer as input parameter 
and produce the following output List in JSON format, All the Depositors Having Depositors 
Having Deposit in All the Branches where input parameter customer is Having an Account   */

CREATE PROCEDURE SameBranch  @Name varchar(25)
AS
select * from DepositeTable where Bname=(select Bname from DepositeTable where Cname=@Name) for json path
GO

EXEC SameBranch @Name='Sunil'


/*  3. Create a Store Procedure that will accept city name and returns the number of customers in that city. */

ALTER PROCEDURE Customer_City  @City varchar(25)
AS
select * from CustomerTable where City=@City

EXEC Customer_City @City='NAGPUR'

/*  4.  Create a Store Procedure which will accept city of the customer as input parameter and
product the following output List in JSON format List All the Customers Living in city provided in 
input parameter and Having the Branch City as MUMBAI or DELHI   */

CREATE Procedure Customer_in_city @City varchar(20)
As
    Select * from (Select Cname , Bname from DepositeTable UNION  Select Cname, Bname from BorrowTable)temp
    Where Bname IN (Select Bname from BranchTable where City IN ('MUMBAI' , 'DELHI'))
    And Cname in (Select Cname from CustomerTable where City = @City) For Json Path
Go

Execute Customer_in_city 'Nagpur'

/*  5. Count the Number of Customers Living in the City where Branch is Located  */

CREATE Procedure Same_Branch_And_City
AS
select * from DepositeTable d full join BranchTable b on d.Bname=b.Bname
full join CustomerTable c on d.Cname=c.Cname
where b.City=c.City
GO

exec Same_Branch_And_City

/*  6.Create a Procedure which will accept input in JSON parameter CustomerName,City, ACTNO,Branch,amount    */
