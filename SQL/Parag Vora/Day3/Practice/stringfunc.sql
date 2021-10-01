
select ascii('parag')
select char(68)
select charindex('s',LastName) as 'index' from employees
select concat(FirstName,' ',LastName) as Name from Employees
select format(getdate(),'hh:mm:ss tt MMMM d,yyyy')
select left(Lastname,4) from employees
select len(concat(FirstName,' ',LastName)) as length from Employees
select LOWER(LastName) as Lname from employees
select ltrim('    i  a  m  parag vora   ')
select PATINDEX('%ql%','microsoft sql server 2012')
select REPLACE(FirstName,'s','H') from employees
select rtrim('    i  a  m  parag vora       ')
select soundex('see') as see,SOUNDEX('sea') as sea 
select space(2)
select str(185)
select stuff(LastName,1,3,'par') from Employees
select substring(LastName,1,3) from Employees 
select translate(FirstName,'se','tk') from Employees  
select trim('    i  a  m  parag vora   ')
select unicode('parag') --just like ascii
select replicate('$',10)
select reverse('parag vora')
select right(Lastname,4) from employees




                   