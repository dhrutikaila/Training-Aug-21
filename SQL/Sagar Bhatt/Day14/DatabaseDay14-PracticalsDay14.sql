CREATE DATABASE Day14
--DROP DATABASE Day14

USE Day14

CREATE TABLE Student(
	StudentID INT IDENTITY(1,1)
    , StudentName NVARCHAR(30) 
    , TotalFees DECIMAL(9,2) CONSTRAINT DFStudentTotalFees DEFAULT 0
    , RemainingAmt DECIMAL(9,2) CONSTRAINT DFStudentRemainingAmt DEFAULT 0
    , CONSTRAINT PKStudentStudentID PRIMARY KEY(StudentID)
)

CREATE TABLE Course(
	CourseID INT IDENTITY(1,1)
    , CourseName NVARCHAR(30)
    , TotalFees DECIMAL(9,2) CONSTRAINT DFCourseTotalFees DEFAULT 0
    , CONSTRAINT PKCourseCourseID PRIMARY KEY(CourseID)
)

CREATE TABLE CourseEnrolled(
	StudentID INT 
    , CourseID INT
    , CONSTRAINT PKCourseEnrolled PRIMARY KEY(StudentID,CourseID)
    , CONSTRAINT FKCourseEnrolledStudent FOREIGN KEY(StudentID) REFERENCES Student(StudentID)
    , CONSTRAINT FKCourseEnrolledCourse FOREIGN KEY(CourseID) REFERENCES Course(CourseID)
)

CREATE TABLE FeePayment(
	StudentID INT
    , AmountPaid DECIMAL(9,2) CONSTRAINT DFFeePaymentAmountPaid DEFAULT 0
    , DateofPayment DATE CONSTRAINT DFFeePaymentDoP DEFAULT GETDATE()
    , CONSTRAINT PKFeePaymentStudentID PRIMARY KEY(StudentID)
)

--Data Insert
INSERT INTO Student(StudentName)
	VALUES ('Sagar Bhatt')
	, ('Harsh Bhatt')
    , ('Meet Shah')
    , ('Vinod Patel')
	, ('Niraj Surati')

INSERT INTO Course
	VALUES ('MCA', 200000)
    , ('BCA', 100000)
    , ('Bcom', 100000)
    , ('Mcom', 200000)
GO
