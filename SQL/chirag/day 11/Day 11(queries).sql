--Q1: Create a Store Procedure which will accept name of the customer as input parameter and product the following output, 
--List Names of Customers who are Depositors and have Same Branch City as that of input parameter customer’s Name.

create PROCEDURE q1 
 @NAME VARCHAR(50)
as
(
	SELECT d.cname FROM deposit d join branch b ON d.bname=b.bname where b.city=(select city from branch where bname=(select bname from deposit where cname=@NAME))  

)
drop PROCEDURE q1
exec q1 'MEHUL'



	
--Q2 Create a Store Procedure which will accept name of the customer as input parameter and produce the following output List in JSON format, 
--All the Depositors Having Depositors Having Deposit in All the Branches where input parameter customer is Having an Account
create PROCEDURE q2 
 @NAME VARCHAR(50)
as

	SELECT * FROM deposit  WHERE bname = (SELECT bname FROM deposit WHERE cname = @NAME) FOR JSON PATH


drop PROCEDURE q3
exec q2 'sunil'
use store
--q3 Create a Store Procedure that will accept city name and returns the number of customers in that city

CREATE PROCEDURE Q3 @CITYNAME VARCHAR(50) 

as
		SELECT count(*) FROM customer  WHERE CITY = @CITYNAME



EXEC Q3 'nagpur' 

--Q4 Create a Store Procedure which will accept city of the customer as input parameter and product the following output 
--List in JSON format List All the Customers Living in city provided in input parameter and Having the Branch City as MUMBAI or DELHI

CREATE PROCEDURE Q4 @CITY VARCHAR(20)
	as 
	select d.Cname from customer c join deposit d on c.cname=d.cname join BRANCH b on d.Bname=b.BNAME where c.city=@CITY and b.CITY in('mumbai','delhi') for json path
	
EXEC Q4 'nagpur' 


--Q5Count the Number of Customers Living in the City where Branch is Located

CREATE PROCEDURE Q5 
as

select count(c.CNAME) from deposit d join branch b on d.Bname=b.BNAME join CUSTOMER c on d.Cname=c.cname where c.CITY=b.city

EXEC Q5  

-- Q6 Create a Procedure which will accept input in JSON parameter CustomerName,City, ACTNO,Branch,amount  


CREATE PROCEDURE Q6 @JSON NVARCHAR(MAX)

as 

insert into deposit 
select * from openjson(@json)
with
	(
	
	ACTNO VARCHAR(5) '$.ACTNO',
	Cname VARCHAR(19) '$.Cname',
	Bname VARCHAR(18) '$.Bname',
	Amount int  '$.amount',
	Adate DATE '$.adate'
)


EXEC Q6 @json='[{"ACTNO":"200","Cname":"ANIL","Bname":"VRCE","Amount":1400,"Adate":"1995-03-01"},{"ACTNO":"300","Cname":"sunil","Bname":"ajni","Amount":5000,"Adate":"1996-01-04"}]'
select * from deposit for json path
[{"ACTNO":"131","Cname":"sunil","Bname":"ajni","Amount":5000,"Adate":"1996-01-04"}]










create database store
use store

create table CUSTOMER 
(CNAME VARCHAR(19) Primary Key,
CITY VARCHAR(18)
)





	insert into customer values('ANIL','KOLKATA')	

insert into customer values('samir',	'DELHI')	
	
	insert into customer values('SUNIL',	'DELHI')	
	insert into customer values('MEHUL',	'BARODA')	
	insert into customer values('MANDAR',	'PATNA')	
	insert into customer values('MADHURI',	'NAGPUR')	
	insert into customer values('PRAMOD',	'NAGPUR')	
	insert into customer values('SANDIP',	'SURAT')	
	insert into customer values('SHIVANI',	'MUMBAI')	
	insert into customer values('KRANTI',	'MUMBAI')	
	insert into customer values('NAREN',	'MUMBAI')
	

create table BRANCH (
BNAME VARCHAR(18) primary key,
CITY VARCHAR(18)
)


select * from cus
insert into branch values('VRCE',	'NAGPUR'	)
	insert into branch values('AJNI', 'NAGPUR')
	insert into branch values('KAROLBAGH',	'DELHI')	
	insert into branch values('CHANDNI',	'DELHI')
	insert into branch values('DHARAMPETH',	'NAGPUR')	
	insert into branch values('M.G.ROAD',	'BANGLORE')	
insert into branch values('ANDHERI',	'MUMBAI')	
	insert into branch values('VIRAR',	'MUMBAI')	
insert into branch values('NEHRU PLACE','DELHI')	
	insert into branch values('POWAI',	'MUMBAI')


	create table deposit(
	ACTNO VARCHAR(5) primary key,
	Cname VARCHAR(19)foreign key (cname) REFERENCES customer(CNAME),
	Bname VARCHAR(18)foreign key (bname) REFERENCES branch(BNAME),
	Amount int,
	Adate DATE
)


select * from deposit
drop table deposit





insert into deposit values(	100,'ANIL',	'VRCE',	1400,'	1-Mar-1995')	

insert into deposit values(	101,'sunil',	'ajni',	5000,'	4-jan-1996')	
108	KRANTI	NEHRU PLACE	5000	2-Jul-1995
insert into deposit values(	108,'KRANTI',	'NEHRU PLACE',5000,'	2-Jul-1995')	

insert into deposit values(	111,'samir','ajni',	5400,'	1-feb-1995')	

insert into deposit values(	102	,'MEHUL',	'KAROLBAGH',	3500,'	17-Nov-1995')	

insert into deposit values(	104,'MADHURI',	'CHANDNI',1200,'	17-Dec-1995	')

insert into deposit values(	105,'PRAMOD',	'M.G.ROAD',	3000,'	27-Mar-1996')

insert into deposit values(	106,'SANDIP', 'ANDHERI',	2000,'	31-Mar-1996')	

insert into deposit values(	107,'SHIVANI',	'VIRAR',	1000,'	5-Sep-1995')


insert into deposit values(	109	,'NAREN',	'POWAI',	7000,'	10-Aug-1995')



create table borrow(
LOANNO VARCHAR(5) primary key,

	Cname VARCHAR(19)foreign key (cname) REFERENCES customer(CNAME),
	Bname VARCHAR(18)foreign key (bname) REFERENCES branch(BNAME),
	AMOUNT INT
)


select * from borrow

insert into borrow values(	201,	'ANIL',	'VRCE',	1000)
insert into borrow values(	206,	'MEHUL',	'AJNI',	5000)	
insert into borrow values(	311,	'SUNIL',	'DHARAMPETH',	3000)	
insert into borrow values(	321,	'MADHURI',	'ANDHERI',	2000)	
insert into borrow values(	375,	'PRAMOD',	'VIRAR',	8000)	
insert into borrow values(	481,	'KRANTI',	'NEHRU PLACE',	3000)