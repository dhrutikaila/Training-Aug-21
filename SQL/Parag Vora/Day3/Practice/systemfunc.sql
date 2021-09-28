-- HOST_ID()
    select HOST_ID() as 'HOST_ID'

-- HOST_NAME()
    select host_name() as 'HOST_NAME'

-- CAST()
    -- Using the CAST() function to convert a decimal to an integer example
        SELECT CAST(12.36 AS INT) result;
    -- Using the CAST() function to convert a decimal to another decimal with different length
        SELECT CAST(12.36 AS DEC(3,0)) result;
    -- Using the CAST() function to convert a string to a datetime value example
        SELECT CAST('1999-12-29' AS DATETIME) as result




