Create database Task


create table BranchTable( Bname varchar(18) Primary key,
							City varchar(18) )
	
create table CustomerTable( Cname varchar(18) Primary key,
							City varchar(18) )

create table DepositeTable(ActNo varchar(5) Primary key, 
						   Cname varchar(18) foreign key references CustomerTable(Cname),
						   Bname varchar(18) foreign key references BranchTable(Bname), 
						   Amount int,
						   Adate DATE )

create table BorrowTable( LoanNo Varchar(5) Primary key,
							Cname varchar(18) foreign key references CustomerTable(Cname),
							Bname varchar(18),
							Amount int )


insert into CustomerTable values ('ANIL','KOLKATA'),
('SUNIL','DELHI'),
('MEHUL','BARODA'),
('MANDAR','PATNA'),
('MADHURI','NAGPUR'),
('PRAMOD','NAGPUR'),
('SANDIP','SURAT'),
('SHIVANI','MUMBAI'),
('KRANTI','MUMBAI'),
('NAREN','MUMBAI')

insert into BorrowTable values (201,'ANIL','VRCE',1000),
(206,'MEHUL','AJNI',5000),
(311,'SUNIL','DHARAMPETH',3000),
(321,'MADHURI','ANDHERI',2000),
(375,'PRAMOD','VIRAR',8000),
(481,'KRANTI','NEHRU PLACE',3000)

insert into BranchTable values ('VRCE','NAGPUR'),
('AJNI','NAGPUR'),
('KAROLBAGH','DELHI'),
('CHANDNI','DELHI'),
('DHARAMPETH','NAGPUR'),
('M.G.ROAD','BANGLORE'),
('ANDHERI','MUMBAI'),
('VIRAR','MUMBAI'),
('NEHRU PLACE','DELHI'),
('POWAI','MUMBAI')

insert into DepositeTable values (100,'ANIL','VRCE',1000,'3-1-1995'),
(101,'SUNIL','AJNI',5000,'1-4-1996'),
(102,'MEHUL','KAROLBAGH',3500,'11-17-1995'),
(104,'MADHURI','CHANDNI',1200,'12-17-1995'),
(105,'PRAMOD','M.G.ROAD',1000,'3-27-1996'),
(106,'SANDIP','ANDHERI',1000,'3-31-1996'),
(107,'SHIVANI','VIRAR',1000,'10-5-1995'),
(108,'KRANTI','NEHRU PLACE',1000,'7-2-1995'),
(109,'NAREN','POWAI',1000,'8-10-1995')


--1. List Names of Customers who are Depositors and have Same Branch City as that of SUNIL
select d.Cname,d.Bname,b.City 
from DepositeTable d join BranchTable b on d.Bname=b.Bname 
where b.City=(select b.City from DepositeTable d join BranchTable b on d.Bname=b.Bname where d.Cname='Sunil')


--2. List All the Depositors Having Depositors Having Deposit in All the Branches where SUNIL is Having Account
select * from DepositeTable where Bname=(select Bname from DepositeTable where Cname='Sunil')


--3. List the Names of Customers Living in the City where the Maximum Number of Depositors are Located
SELECT c.Cname FROM CustomerTable c WHERE c.City IN (SELECT TOP(1) c.City FROM 
DepositeTable d JOIN CustomerTable c ON c.Cname = d.Cname GROUP BY c.City ORDER BY COUNT(c.City) DESC)


--4. List Names of Borrowers Having Deposit Amount Greater than 1000 and Loan Amount Greater than 2000
select d.Cname,d.Amount,b.Amount 
from DepositeTable d join BorrowTable b on d.Cname=b.Cname 
where d.Amount>1000 and b.Amount>2000


--5. List All the Customers Living in NAGPUR and Having the Branch City as MUMBAI or DELHI
select C.Cname 
from BranchTable b join CustomerTable c on b.City=c.City 
where b.City='Nagpur' and (c.City='Mumbai' or c.City='Delhi')


--6. Count the Number of Customers Living in the City where Branch is Located
SELECT COUNT(c.Cname) 
FROM CustomerTable c JOIN BranchTable b ON c.CITY = b.CITY 