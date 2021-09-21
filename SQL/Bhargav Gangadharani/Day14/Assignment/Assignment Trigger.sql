Create Database Trigger_Task
use Trigger_Task

Create Table Students(
	StudentId int primary key,
	StudentName Varchar(30) Not Null,
	TotalFees Money,
	RemainingAmt Money,
	) 

Create Table Courses(
	CourseId int primary key,
	CourseName Varchar(30) Not Null,
	TotalFees Money Not Null,
	)

Create Table CourseEnrolled(
	StudentId int Foreign key references Students(StudentId) Not Null,
	CourseId int Foreign key references Courses(CourseId) Not Null,
	)


Create Table FeePayment(
	StudentId int Foreign key references Students(StudentId),
	AmountPaid money Not Null,
	DateOfPayment Date Not Null
	)

Insert into Students values
(1001, 'Siddharth', 95000, 45000),
(1002, 'Rahul', 100000, 50000),
(1003, 'Shekhar', 101000, 51000),
(1004, 'Varun', 102000, 52000),
(1005, 'Randeep', 95000, 45000),
(1006, 'Kartik', 95000, 45000)

Insert into Courses values 
(111,'BE-CSE', 95000),
(112,'HTML-CSS', 5000),
(113,'SQL', 6000),
(114,'Bootstrap', 7000),
(115,'ReactJs', 8000),
(116,'NodeJs', 9000)



Insert into CourseEnrolled values
(1001,111),
(1002,111),
(1003,111),
(1004,111),
(1005,111),
(1006,111),
(1002,112),
(1003,113),
(1004,114)


Insert into FeePayment values 
(1001, 50000, '2021-08-05'),
(1002, 50000, '2021-06-22'),
(1003, 50000, '2021-05-30'),
(1004, 50000, '2021-07-07'),
(1005, 50000, '2021-06-16'),
(1006, 50000, '2021-06-18')



Select * from Students
Select * from Courses
Select * from CourseEnrolled
Select * from FeePayment

-- Create an insert trigger on CourseEnrolled Table, record should be updated in TotalFees Field on the Student table for the respective student.
Create Trigger Update_Fees_Student on CourseEnrolled
for Insert 
As 
Begin 
	Declare @CourseId int , @CourseFee int , @StudentId int
	Select @CourseId = CourseId, @StudentId= StudentId From inserted 
	Select @CourseFee = TotalFees from Courses where CourseId = @CourseId
	Update Students Set TotalFees = TotalFees + @CourseFee Where StudentId = @StudentId
	Update Students Set RemainingAmt = RemainingAmt + @CourseFee Where StudentId = @StudentId
End
Go

Insert into CourseEnrolled values (1006,116)



-- Create an insert trigger on FeePayment, record should be updated in RemainingAmt Field of the Student Table for the respective student.
Create Trigger Update_Rem_Fees_Student on FeePayment
for Insert 
As 
Begin 
	Declare @StudentId int, @AmountPaid money 
	Select @StudentId= StudentId , @AmountPaid=AmountPaid From inserted 
	Update Students Set RemainingAmt = RemainingAmt - @AmountPaid Where StudentId = @StudentId
End
Go

Insert into FeePayment Values ( 1002, 10000, '2021-09-09')
