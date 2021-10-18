---Create an insert trigger on CourseEnrolled Table, record should be updated in TotalFees Field on the 
---Student table for the respective student.
use  subqueries
create trigger forcoursinsert  on dbo.courseenrolled
after insert
as begin
	declare @sid int,@cid int,@amount int 
	select @sid=StudentID from inserted 
	
	select @cid=courseid from inserted 
	select @amount=TotalFees from course where courseid=@cid
	
	update student set TotalFees=@amount  ,RemainingAmt=@amount where studentid=@sid
end
			

drop trigger forcoursinsert

insert into CourseEnrolled values(1,1)






--Create an insert trigger on FeePayment, record should be updated in RemainingAmt Field of the Student Table for the respective student.
alter trigger feepaymenttrigeer on dbo.feepayment
after insert
as begin

		declare @pay int,@sid int
		select @pay=AmountPaid,@sid=studentid from inserted
		update student set RemainingAmt=RemainingAmt-@pay where studentid=@sid



end



select * from feepayment
select * from student
insert into FeePayment values(1,1200,GETDATE())





create table student(
StudentID int not null, StudentName varchar(50), TotalFees  int ,RemainingAmt int
)
create table Course(
CourseID int not null,CourseName varchar(20),TotalFees int
)


ALTER TABLE student alter column RemainingAmt set default 0 
	alter table student  totalfees null
	alter table student add constraint nulla  totalfees null

create table CourseEnrolled(

StudentID int ,
CourseID int 
)

create table FeePayment(

StudentID int,

		AmountPaid int,DateofPayment date
)


drop table student
drop table CourseEnrolled
drop table FeePayment

select* from student 
select* from CourseEnrolled
select* from Course


insert into student values(2,'chirag',0,0 )
insert into student values(2,'mihir',0,0  )
insert into student values(3,'jay',0,0 )
insert into student values(5,'jay',0,0 )

insert into course values(1,'bca',15000 )
insert into course values(2,'bba',15000 )


insert into CourseEnrolled values(1,1)

