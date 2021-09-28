-- Update Queries

--1) Any modifications, including UPDATE, INSERT, and DELETE statements, must reference columns from only one base table.

        update view4 set name = 'parag vora',City = 'AHMEDABAD' where name='Susan Mavris' 
        --will not allow you to update the name and city because here we are dealing with two base tables.so,the solution of this query is ,we have to apply this update query independetly on respective base tables

        -- we can update city by following query
        update view4 set City = 'AHMEDABAD' where name = 'Susan Mavris'


-- 2)The columns being modified in the view must directly reference the underlying data in the table columns. The columns cannot be derived in any other way, such as through the following:

    --2.1) An aggregate function: AVG, COUNT, SUM, MIN, MAX, GROUPING, STDEV, STDEVP, VAR, and VARP.

        update view2 set number_of_employees = 5 where DepartmentName = 'Administration'
        -- will  not allow you to update number of employees because number of employees used aggregate function called count.

    --2.2) A computation. The column cannot be computed from an expression that uses other columns. Columns that are formed by using the set operators UNION, UNION ALL, CROSSJOIN, EXCEPT, and INTERSECT amount to a computation and are also not updatable.

        update view4 set name = 'parag vora' where name='Susan Mavris'
        -- will not allow you to update name beacuse name column is conacatenation of two fields (first_name , last_name) so it will be evaluated as computed column.

-- 3)The columns being modified are not affected by GROUP BY, HAVING, or DISTINCT clauses.
            
    update view4 set city = 'Seattle' where Name = 'Hermann Baer'
    select count(DepartmentName),City from view4 where City = 'Seattle' group by City 

-- 4)TOP is not used anywhere in the select_statement of the view together with the WITH CHECK OPTION clause.
    


-- -- SQL VIEW ENCRYPTION
    --We can encrypt the VIEW using the WITH ENCRYPTION clause. Previously, we checked users can see the view definition using the sp_helptext command. If we do not want users to view the definition, we can encrypt it.

        create view view3 
        with encryption as
        select e.EmployeeID,datediff(day,j.StartDate,j.EndDate) as no_of_days
        from Employees as e
        join  Departments as d
        on  d.DepartmentID = 90
        join JobHistory as j
        on j.DepartmentID = d.DepartmentID

    -- Now if you run the sp_helptext command to view the definition, you get the following error message.
    -- The text for object 'View3' is encrypted.
