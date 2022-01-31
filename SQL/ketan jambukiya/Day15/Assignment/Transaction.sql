Create Table Customer
(
CustomerID int Primary key Identity (1, 1) Not Null,
CustomerName varchar(50) Not Null,
DOB date Not Null,
Address nvarchar(30) Not Null,
Pincode Numeric(6) Not Null check (Pincode between 100000 and 999999),
Phonenumber numeric(10) Not Null check (Phonenumber between 1000000000 and 9999999999)
)


Insert Into Customer values 
('viren' , '2000-08-13',  'Rajkot', 350003, 6546546546 ),
('Yash' , '1999-07-20', 'Ahmedabad', 350004, 8563149654 ),
('Rohan' , '2001-11-25', 'Gandhinagar', 350005, 7541236985 ),
('virat' , '1996-10-09','surat', 350006, 8564123974 )


Create Table Account
(
CustomerID int foreign key references Customer(CustomerID) Not Null,
AccountNumber int Primary key Not Null, 
Accounttype numeric Not Null, 
Amount money,
)

Insert Into Account values 
(1, 5546554, 0, 400000),
(2, 6546421, 0, 800000),
(3, 4684843, 0, 600000),
(4, 3554643, 0, 500000)

CREATE PROCEDURE BankTransaction
@Amount money , @DebitAccount int, @CreditAccount money
AS
BEGIN TRANSACTION AmountTransfer

Begin Try
Update Account set Amount=Amount-@Amount where AccountNumber=@DebitAccount
Update Account set Amount=Amount+@Amount where AccountNumber=@CreditAccount
Commit Transaction BankTransaction
End Try

Begin Catch
Rollback TRANSACTION AmountTransfer
Print 'Some Error occured in Transaction'
End Catch

Exec BankTransaction @Amount=100000, @DebitAccount=3554643,@CreditAccount=4684843

select * from Account
select * from Customer


