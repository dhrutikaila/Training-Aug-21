-- Except and Intersect Clauses
    CREATE TABLE Books1
    (
    id INT,
    name VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price INT NOT NULL
    )
    
    CREATE TABLE Books2
    (
    id INT,
    name VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price INT NOT NULL
    )

    -- insert
    INSERT INTO Books1
    VALUES
    (1, 'Book1', 'Classics', 1800),
    (2, 'Book2', 'Literary Fiction', 1500),            
    (3, 'Book3', 'History', 2000),
    (4, 'Book4', 'Sci-Fi and Fantasy', 1300),
    (5, 'Book5', 'Humour', 5500),
    (6, 'Book6', 'Thriller and Mystery', 5000),
    (7, 'Book7', 'Romance', 8000),
    (8, 'Book8', 'Mythological Fiction', 5000),
    (9, 'Book9', 'Historical Fiction', 5400),
    (10, 'Book10', 'Religion and Mythology', 3200)
 
    INSERT INTO Books2
    VALUES
    (5, 'Book5', 'Humour', 5500),
    (6, 'Book6', 'Thriller and Mystery', 5000),
    (7, 'Book7', 'Romance', 8000),
    (8, 'Book8', 'Mythological Fiction', 5000),
    (9, 'Book9', 'Historical Fiction', 5400),
    (10, 'Book10', 'Religion and Mythology', 3200),
    (11, 'Book11', 'Biography and Memoir', 8000),
    (12, 'Book12', 'Self-Help', 5000),
    (13, 'Book13', 'Travel and Places', 5400),
    (14, 'Book14', 'Best Indian Cl', 3200)

-- Exepct : Exepct returns the raws from right side table which are not present in other table.
    -- from two different table
    SELECT * FROM Books1
    Except
    SELECT * FROM Books2

    -- from single table
    SELECT * FROM Books1
    Except
    SELECT * FROM Books1 WHERE id BETWEEN 1 AND 5

-- Intersect : Intersect returns the raws present in both table.
    -- from two different table
    SELECT * FROM Books1
    Intersect
    SELECT * FROM Books2

    -- from single table
    SELECT * FROM Books1
    Intersect
    SELECT * FROM Books1 WHERE price > 5000

-- Union : Union returns all unique raws present in both table.
    -- from two different table
    SELECT * FROM Books1
    Union
    SELECT * FROM Books2

    -- from single table
    SELECT * FROM Books1
    Union
    SELECT * FROM Books1 WHERE price > 5000

-- Union : Union All returns all raws including duplicates present in both table.
    -- from two different table

    SELECT * FROM Books1
    Union All
    SELECT * FROM Books2

    -- from single table
    SELECT * FROM Books1
    Union All
    SELECT * FROM Books1 WHERE price > 5000
