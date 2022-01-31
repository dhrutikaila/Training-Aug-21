-- Created Database
    create database day_8_indexes
    use  day_8_indexes

-- Created Table
    Create Table Employees
    (
	EmpID int ,
	Name Varchar(20),
	Dresscode int,
	Salary smallmoney 
    )

-- Inserted Values
    Insert into Employees values 
    (1 , 'Parag', 102, 10000),
    (2 , 'Ketan', 304, 12000),
    (3 , 'Jeel', 102, 25000),
    (4 , 'Vraj', 612, 17000)

-- Clustered Index
    Create Clustered Index Index_Emp on Employees (EmpId) 

-- Nonclustered Index
    Create Nonclustered Index Non_Clu_Index on Employees (Name)

-- Examples
    Select * From Employees where EmpID = 1

    Select * From Employees where Name = 'Ketan'