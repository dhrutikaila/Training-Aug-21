-- CREATED DATABASE
    CREATE DATABASE DAY_14_TRIGGERS
    USE  DAY_14_TRIGGERS

-- CREATING TABLES
    CREATE TABLE Student
    (
        StudentID INT PRIMARY KEY NOT NULL,
        StudentName VARCHAR(25) NOT NULL,
        TotalFees SMALLMONEY NOT NULL,
        RemainingAmt SMALLMONEY NOT NULL
    )

    CREATE TABLE Course
    (
        CourseID INT PRIMARY KEY NOT NULL,
        CourseName VARCHAR(50) NOT NULL,
        TotalFees SMALLMONEY NOT NULL
    )

    CREATE TABLE CourseEnrolled
    (
        StudentID INT  CONSTRAINT FK_ST_ID REFERENCES  Student(StudentID),
        CourseID INT CONSTRAINT FK_COURSE_ID REFERENCES Course(CourseID)
    )

    CREATE TABLE FeePayment
    (
        StudentID INT  CONSTRAINT FK_STUDENT_ID REFERENCES  Student(StudentID),
        AmountPaid SMALLMONEY NOT NULL,
        DateofPayment DATE
    )


-- INSERTING DATA

    INSERT INTO Student
    VALUES
    (1,'PARAG VORA',15000,7000),
    (2,'KETAN JAMBUKIYA',12000,3000),
    (3,'VRAJ MARVANIYA',12000,000),
    (4,'BHARGAV GANGADHARANI',15000,8000),
    (5,'JEEL GHODASARA',13500,4000),
    (6,'BRIJEN SADARIYA',14200,3200),
    (7,'KARAN SOJITRA',9500,4200),
    (8,'MILAN SORATHIYA',15000,000),
    (9,'UMANG VANJA',14200,4200),
    (10,'RUTVIK BANDHANIYA',13500,3200)


-- UPDATE TOTAL FEES AND REAMIANING AMOUNT IN STUDENT TABLE SIMULTANEOUSLY
    CREATE TRIGGER TRG_INSERT_DATA
    ON COURSEENROLLED
    FOR INSERT
    AS
    BEGIN
        DECLARE @STUDENTID INT,@COURSEID INT
        SELECT  @STUDENTID =StudentID,@COURSEID = CourseID FROM inserted
        UPDATE Student
        SET TotalFees =TotalFees + (SELECT TotalFees FROM Course WHERE CourseID = @COURSEID),
            RemainingAmt = (SELECT TotalFees FROM Course WHERE CourseID = @COURSEID) - (SELECT AmountPaid FROM FeePayment WHERE StudentID = @STUDENTID)
            WHERE StudentID = @STUDENTID
    END

-- You can't define AFTER triggers on views.
-- INSTEAD OF TRIGGERS

    -- A typical example of using an INSTEAD OF trigger is to override an insert, update, or delete operation on a view.


    CREATE TRIGGER [schema_name.] trigger_name
    ON {table_name | view_name }
    INSTEAD OF {[INSERT] [,] [UPDATE] [,] [DELETE] }
    AS
    {sql_statements}

    