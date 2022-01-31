
Create Table Employee(
	EmployeeID int ,
	Name Varchar(20),
	Salary Money,
	)


Insert into Employee values 
(1 , 'Viraj', 25000),
(2 , 'Rohit', 28000),
(3 , 'Nishant', 27000),
(4 , 'Chirag', 26000)


Create Clustered Index EMP on Employee (Name) 


Create Nonclustered Index ABC on Employee (salary)


SELECT * FROM Employee  WHERE Name='Chirag'


SELECT * FROM Employee WHERE Salary=28000