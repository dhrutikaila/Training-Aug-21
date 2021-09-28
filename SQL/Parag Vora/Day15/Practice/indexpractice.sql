-- Table Creation
    CREATE TABLE student
    (
        id INT PRIMARY KEY,
        name VARCHAR(50) NOT NULL,
        gender VARCHAR(50) NOT NULL,
        DOB datetime NOT NULL,
        total_score INT NOT NULL,
        city VARCHAR(50) NOT NULL
    )

    EXECUTE sp_helpindex student

-- In the output you can see the only one index. This is the index that was automatically created because of the primary key constraint on the “id” column.

-- inserted value
   INSERT INTO student VALUES  
    (6, 'Kate', 'Female', '03-JAN-1985', 500, 'Liverpool'), 
    (2, 'Jon', 'Male', '02-FEB-1974', 545, 'Manchester'),
    (9, 'Wise', 'Male', '11-NOV-1987', 499, 'Manchester'), 
    (3, 'Sara', 'Female', '07-MAR-1988', 600, 'Leeds'), 
    (1, 'Jolly', 'Female', '12-JUN-1989', 500, 'London'),
    (4, 'Laura', 'Female', '22-DEC-1981', 400, 'Liverpool'),
    (7, 'Joseph', 'Male', '09-APR-1982', 643, 'London'),  
    (5, 'Alan', 'Male', '29-JUL-1993', 500, 'London'), 
    (8, 'Mice', 'Male', '16-AUG-1974', 543, 'Liverpool'),
    (10, 'Elis', 'Female', '28-OCT-1990', 400, 'Leeds');

-- The above script inserts ten records in the student table. Notice here the records are inserted in random order of the values in the “id” column. But because of the default clustered index on the id column, the records are physically stored in the ascending order of the values in the “id” column. 

    SELECT * FROM student

-- Dropped Index manually through SSMS on student table
-- Created new clustered index
    CREATE CLUSTERED INDEX IX_tblStudent_Gender_Score
    ON student(gender ASC, total_score DESC)

-- The above index first sorts all the records in the ascending order of the gender. If gender is same for two or more records, the records are sorted in the descending order of the values in their “total_score” column. You can create a clustered index on a single column as well. 


-- Creating a Non-Clustered Index   
    CREATE NONCLUSTERED INDEX IX_tblStudent_Name
    ON student(name ASC)

-- The above script creates a non-clustered index on the “name” column of the student table. The index sorts by name in ascending order. As we said earlier, the table data and index will be stored in different places. The table records will be sorted by a clustered index if there is one.


-- overview
    -- There can be only one clustered index per table. However, you can create multiple non-clustered indexes on a single table.
    -- Clustered indexes only sort tables. Therefore, they do not consume extra storage. Non-clustered indexes are stored in a separate place from the actual table claiming more storage space.
    -- Clustered indexes are faster than non-clustered indexes since they don’t involve any extra lookup step.