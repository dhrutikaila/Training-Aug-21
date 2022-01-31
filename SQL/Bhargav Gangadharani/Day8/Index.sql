Create Database Practice

Create Table Student(
	RollNo int ,
	Name Varchar(20),
	SubjectCode int,
	Marks int )

Insert into Student values 
(100 , 'Rahul', 203, 95),
(101 , 'Keyur', 203, 65),
(102 , 'Shrikant', 203, 75),
(103 , 'Shuhani', 203, 80)

-- Clustered Index
Create Clustered Index IX_STU on Student (RollNo) 

-- Nonclustered Index
Create Nonclustered Index NIX_STU on Student (Name)

Select * From Student where RollNo = 101

Select * From Student where Name = 'Rahul'


Create Table Product (
ProductId int,
ItemCode int,
Price money)

Insert into Product values
(1005,202,1000),
(1006,504,1900),
(1008,604,2600),
(1009,106,9000)

-- Clustered Index
Create Clustered Index IX_PID on Product (ProductId)

Use AdventureWorks2019
Create Nonclustered Index NIX_Firstname on Person.person (FirstName)

Select * from Person.Person where FirstName = 'Ken'


