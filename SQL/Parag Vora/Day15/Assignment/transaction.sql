-- CREATED DATABASE
    CREATE DATABASE DAY_15_TRANSACTION
    USE DAY_15_TRANSACTION

-- CREATED TABLE
    Create Table Customer
    (
    CustomerID int Primary key Not Null,
    CustomerName varchar(30) Not Null,
    DOB date Not Null,
    Email nvarchar(30),
    Address nvarchar(50) Not Null,
    Pincode Numeric(6) Not Null ,
    Phonenumber numeric(10) Not Null
    )

    Create Table Accounts
    (
    CustomerID int foreign key references Customer(CustomerID) Not Null,
    AccountNumber int Primary key Not Null, 
    Accounttype numeric(1) Not Null, 
    Balance money,
    )

-- Created procedure for transcation

    CREATE PROCEDURE BankTransaction @Amount money , @Debit_Account int, @Credit_Account money
    AS
    BEGIN TRANSACTION Money_Transfer

    Begin Try
    Update Accounts set Balance=Balance - @Amount where AccountNumber= @Debit_Account
    Update Accounts set Balance=Balance + @Amount where AccountNumber= @Credit_Account
    Commit Transaction BankTransaction
    End Try

    Begin Catch
    Rollback TRANSACTION Money_Transfer
    Print 'There is an issue encountered!!!'
    End Catch

    exec BankTransaction 2000,13,15
    