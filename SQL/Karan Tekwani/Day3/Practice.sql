select ascii('a')
select char(100)

select charindex('a','karan tekwani',3)
select CHARINDEX('a','karan tekwani',(select charindex('a','karan tekwani')+1))

select concat('karan','tekwani')

declare @d date='12/20/2002'
select format(@d,'d','en-gb')

select LEFT('karan tekwani',5)

select len('karan')

select lower('KARAN')

select ltrim('		KARAN')

select patindex('%te%','karan tekwani')

select replace('today is wednesday','wednesday','thursday')

select rtrim('KARAN		')

select soundex('KARAN'),soundex('KAEIOURAN')

SELECT ltrim('		KARAN')+SPACE(2)+rtrim('TEKWANI		')

SELECT STR(90.26487,4,2)

SELECT STUFF('Java is easy to learn',1,4,'Python')

select SUBSTRING('karan',1,3)

select translate('15+{5*7}-[4/2]','{}[]','()()')

select TRIM('		karan tekwani		')

select unicode('ABCD')

SELECT UPPER('karan')

select REPLICATE('-',10)

select reverse('abcd')

select RIGHT('karan tekwani',3)