--(1)--
-- List Names of Customers who are Depositors and have 
--Same Branch City as that of SUNIL

SELECT d.Cname FROM Deposit as d 
	join BRANCH as br 
	on d.Bname = br.BNAME 
	 where br.CITY IN
	 (select br1.CITY from BRANCH as br1 join Deposit as d1 
		on d1.Bname = br1.BNAME
			where d1.Cname='SUNIL')



--(2)--
--List All the Depositors Having Depositors Having Deposit in 
--All the Branches where SUNIL is Having Account

Select d.Cname from Deposit as d 
		join Deposit d1 
		on d.Cname = d1.Cname
		where d1.Bname IN 
	   (select Bname from Deposit where Cname='SUNIL')
	


--(3)--
--List the Names of Customers Living in the City where the 
--Maximum Number of Depositors are Located

	Select CNAME from CUSTOMER 
			Where CITY = (Select TOP(1) CITY from 
					(Select Count(CITY) as DCity , br.CITY from Deposit d 
					Join BRANCH as br  ON d.Bname = br.BNAME Group by br.CITY) tmp 
						Order by DCity DESC)


--(4)--
--List Names of Borrowers Having Deposit Amount Greater than 1000 and 
--Loan Amount Greater than 2000

 Select b.CNAME from BORROW as b
			join Deposit as d
			on b.CNAME = d.Cname
			where b.AMOUNT > 1000 AND d.Amount > 2000



--(5)--
--List All the Customers Living in NAGPUR and Having the 
--Branch City as MUMBAI or DELHI

 Select c.CNAME from CUSTOMER as c
		join Deposit as d 
		on c.CNAME = d.Cname
		join BRANCH as b
		on b.BNAME = d.Bname
		where c.CITY= 'NAGPUR' AND b.CITY in ('MUMBAI', 'DELHI')




--(6)--
--Count the Number of Customers Living in the City where Branch is Located

	Select count(c.CNAME) as [Number of Customers],c.CITY
			from CUSTOMER as c
			Where c.CITY IN (Select b.CITY from BRANCH as b) 
			Group by c.CITY

			   
