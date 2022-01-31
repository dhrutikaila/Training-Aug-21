-- BEFORE INSERT TRIGGER

-- Create trigger on employee table to check the new inserted hire date.

DELIMITER &&
CREATE TRIGGER hiredate 
BEFORE INSERT ON employees FOR EACH ROW
BEGIN 
	IF NEW.HireDate <> CURDATE() 
    THEN SET NEW.HireDate = CURDATE(); 
END IF;
END &&
DELIMITER ;

INSERT INTO employees(EmployeeID,FirstName,LastName,Email,PhoneNumber,HireDate) VALUES(99,"Aliena","Peter","aliena@gmail.com",9867856754,'2021-09-08');

-- AFTER INSERT TRIGGER

-- Create a trigger on student table to insert a new row in activity table when the row is inserted in student table. 

CREATE TABLE student
(
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR(30) NOT NULL,
    Standard INT(2) NOT NULL
);

CREATE TABLE activity
(
    StudentID INT,
    StudentName VARCHAR(30) NOT NULL,
    Standard INT(2) NOT NULL,
    ActivityName VARCHAR(30),
    FOREIGN KEY(StudentID) REFERENCES student(StudentID)
);

DELIMITER &&
CREATE TRIGGER student_insert
AFTER INSERT ON student FOR EACH ROW
BEGIN
	INSERT INTO activity(StudentID,StudentName,Standard) VALUES	(NEW.StudentID,NEW.StudentName,NEW.Standard);
END &&
DELIMITER ;

INSERT INTO student VALUES(3,"Raj Patel",6);


-- BEFORE UPDATE TRIGGER

-- Create a trigger on activity table which will check the updated standard of students.

DELIMITER &&
CREATE TRIGGER standard_update 
BEFORE UPDATE ON activity FOR EACH ROW
BEGIN
	DECLARE error_msg VARCHAR(255);
    SET error_msg = "Cannot change activity while in same standard";
	IF NEW.Standard = OLD.Standard AND NEW.ActivityName <> OLD.ActivityName THEN
    	SIGNAL SQLSTATE '45000'   
    	SET MESSAGE_TEXT = error_msg;
    END IF;
END &&
DELIMITER ;

UPDATE activity SET ActivityName = "Badminton" WHERE StudentID = 1;
UPDATE activity SET ActivityName = "Tennis" WHERE StudentID = 3;

-- AFTER UPDATE TRIGGER

-- Create trigger on student table to insert updated and outdated details into studentlog when a row is updated in student table.

CREATE TABLE studentlog
(
    Name VARCHAR(30) NOT NULL,
    Description VARCHAR(200) NOT NULL
);

DELIMITER &&  
  
CREATE TRIGGER after_update_students  
AFTER UPDATE  
ON student FOR EACH ROW  
BEGIN  
    INSERT into studentlog VALUES (user(),   
    CONCAT('Update Student Record ', OLD.StudentName, ' Previous Class :',  
    OLD.Standard, ' Present Class ', NEW.Standard));  
END &&
  
DELIMITER ;  

UPDATE student SET Standard = Standard + 1 WHERE StudentID = 3;

-- BEFORE DELETE TRIGGER

-- Create a BEFORE DELETE trigger that inserts a new record into the salary_archives table before a row is deleted from the salaries table.


CREATE TABLE salaries 
(  
    emp_id INT PRIMARY KEY,  
    valid_from DATE NOT NULL,  
    amount DECIMAL(8 , 2 ) NOT NULL DEFAULT 0  
);  

INSERT INTO salaries (emp_id, valid_from, amount)  
VALUES  
    (102, '2020-01-10', 45000),  
    (103, '2020-01-10', 65000),  
    (105, '2020-01-10', 55000),  
    (107, '2020-01-10', 70000),  
    (109, '2020-01-10', 40000);   


CREATE TABLE salary_archives 
(  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    emp_id INT,  
    valid_from DATE NOT NULL,  
    amount DECIMAL(8 , 2 ) NOT NULL DEFAULT 0,  
    deleted_time TIMESTAMP DEFAULT NOW()  
);  

DELIMITER &&
CREATE TRIGGER before_delete
BEFORE DELETE ON salaries FOR EACH ROW
BEGIN 
	INSERT INTO salary_archives(emp_id,valid_from,amount) 
    VALUES(OLD.emp_id,OLD.valid_from,OLD.amount);
END &&
DELIMITER ;

DELETE FROM salaries WHERE emp_id = 105;

-- AFTER DELETE TRIGGER

-- 


CREATE TABLE total_salary_budget(  
    total_budget DECIMAL(10,2) NOT NULL  
);  

INSERT INTO total_salary_budget (total_budget)  
SELECT SUM(amount) FROM salaries;  

DELIMITER &&
CREATE TRIGGER after_delete_salaries  
AFTER DELETE  
ON salaries FOR EACH ROW  
BEGIN  
   UPDATE total_salary_budget SET total_budget = total_budget - old.amount;  
END &&   
DELIMITER ;  

DELETE FROM salaries WHERE emp_id = 109; 

-- DROP TRIGGER

DROP TRIGGER IF EXISTS triggerpractice.student_insert;  
