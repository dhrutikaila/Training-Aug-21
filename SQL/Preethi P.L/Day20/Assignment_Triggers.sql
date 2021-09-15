CREATE TABLE Students
(
    StudentID INT PRIMARY KEY AUTO_INCREMENT, 
    StudentName VARCHAR(30), 
    TotalFees NUMERIC DEFAULT 0,
    RemainingAmt NUMERIC DEFAULT 0
);

CREATE TABLE Course
(
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(50),
    TotalFees NUMERIC
);

CREATE TABLE CourseEnrolled
(
 	StudentID INT,
    CourseID INT,
    FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY(CourseID) REFERENCES Course(CourseID)
);

CREATE TABLE FeePayment
(
	StudentID INT,
    AmountPaid NUMERIC,
    DateofPayment DATE,
    FOREIGN KEY(StudentID) REFERENCES Students(StudentID)
);


INSERT INTO student(StudentID,StudentName) VALUES(1,"Riya Shah"),(2,"Prachi Patel");

INSERT INTO Course VALUES(1,"Web Development",17000),(2,"Android",18000);


-- 1. Create an insert trigger on CourseEnrolled Table, record should be updated in TotalFees Field on the Student table for the respective student.

DELIMITER &&
CREATE TRIGGER q1
AFTER INSERT ON courseenrolled FOR EACH ROW
BEGIN
	UPDATE students SET TotalFees = TotalFees + (SELECT TotalFees FROM course WHERE CourseID = (SELECT 		CourseID FROM courseenrolled WHERE StudentID = NEW.StudentID )) WHERE StudentID = (SELECT StudentID 	FROM courseenrolled WHERE StudentID = NEW.StudentID);
	
END &&
DELIMITER ;

INSERT INTO courseenrolled(StudentID,CourseID) VALUES(1,1),(2,2);



-- 2. Create an insert trigger on FeePayment, record should be updated in RemainingAmt Field of the Student Table for the respective student.

DELIMITER &&
CREATE TRIGGER q2
AFTER INSERT ON feepayment FOR EACH ROW
BEGIN
	UPDATE students SET RemainingAmt = TotalFees - (SELECT AmountPaid FROM feepayment WHERE StudentID = 		NEW.StudentID) WHERE StudentID = (SELECT StudentID FROM  feepayment WHERE StudentID = NEW.StudentID); 
END &&
DELIMITER ;

INSERT INTO feepayment(StudentID,AmountPaid,DateofPayment) VALUES(1,10000,CURDATE());







