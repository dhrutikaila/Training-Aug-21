Create Database Bank
use Bank

Create Table Customer_Info
(
Customer_ID int Primary key Identity (100101, 1) Not Null,
Customer_Name varchar(50) Not Null,
DOB date Not Null,
Email nvarchar(30) check ( Email like '%__@%.com'),
Address nvarchar(30) Not Null,
Pincode Numeric(6) Not Null,
Phone_number numeric(10) Not Null
)

Create Table Accounts
(
Customer_ID int foreign key references Customer_Info(Customer_ID) Not Null,
Account_Number int Primary key Not Null, 
Account_type numeric(2) Not Null, -- (  0 is for Saving Account & 1 is for Current Account)
Balance_Amount money,
)

Insert Into Customer_Info values 
('Kartik' , '1999-12-25', null, 'Ahmedabad', 360001, 9656985688 ),
('Rahul' , '1999-08-30', null, 'Ahmedabad', 360001, 9656985688 ),
('Kishan' , '1999-11-21', null, 'Ahmedabad', 360001, 9656985688 ),
('Roy' , '1992-12-09', null, 'Ahmedabad', 360001, 9656985688 )


Insert Into Accounts values 
(100101, 124123, 0, 500000),
(100102, 129658, 0, 200000),
(100103, 963755, 0, 300000),
(100104, 539457, 0, 1000000)


Select * from Customer_Info
Select * from Accounts


-- Detroit Bank need to implement the transaction whenever the amount is transferred from one account to the another account.

Create Procedure Bank_Transaction @Amount money , @Debit_From int, @Credit_To money
As
Begin Transaction Amount_transfer

Begin Try
	Update Accounts Set Balance_Amount = Balance_Amount - @Amount
	Where Account_Number =  @Debit_From 
	
	Update Accounts Set Balance_Amount = Balance_Amount + @Amount
	Where Account_Number =  @Credit_To
	
	Commit Transaction Amount_transfer
	Print 'Transaction Successful'
End Try

Begin Catch
	ROLLBACK Transaction Amount_transfer
	Print 'Transaction Failed'
End Catch

-- Execute Transaction
Execute Bank_Transaction @Amount = 5000 , @Debit_From =124123 , @Credit_To=963755