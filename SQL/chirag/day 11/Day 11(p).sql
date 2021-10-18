
use subqueries
---
  CREATE PROCEDURE sdepartment
  @DepartmentId decimal(8,0)

AS   

    SET NOCOUNT ON;  
    SELECT *  
    FROM Employees  
    WHERE DepartmentID= @DepartmentId
      
GO  

EXECUTE sdepartment  70
-- Or  
EXEC sdepartment @departmentId = 70



-- find employee who working under manager


  CREATE PROCEDURE findemployee
  
    @name varchar(25)
AS   

  SET NOCOUNT ON;  

	SELECT * FROM Employees WHERE ManagerID= (SELECT EmployeeID FROM Employees where FirstName= @name)

	   
GO  

EXECUTE findemployee 'den'




use party


 --stored procedure
 CREATE PROCEDURE findcity
 @city varchar(40)

 AS
(
 SELECT * FROM party WHERE location=@city

 )

 EXECUTE findcity 'surat'



create table member 
(
memberid int primary key,
name varchar(50),
email varchar(90) unique,
city varchar(50)
)

drop table member

create table party
(
 partyid int primary key,
 partyname varchar(75),
 location varchar(75),
 partydate date ,
 hostid int foreign key (hostid) references host(hostid)
 )
 drop table party


 create table host(
 hostid int primary key,
 name varchar(75),
 city varchar(75),
)



drop table host
insert into member values(1,'chirag','a@gmail.com','ahmedabad')
 insert into member values(2,'meet','m@gmail.com','surat')
 
 
insert into host values(1,'jay','ahmedabad')
 insert into host values(2,'samir','surat')
 
 insert into party values(2,'holi festival','surat','2021-10-10',2)

 insert into party values(1,'holi festival','ahmedabad','2021-10-10',1)
















