-- BATCH
    -- Declare Variable
        -- declare @variable_name datatype
            declare @avgsalary int 

    -- Setting values of the variable
        declare @avgsalary int
        select @avgsalary = AVG(Salary) 
        from Employees

        print @avgsalary

    -- If-else

        declare @salary money,@salary1 Money,@salary2 money
        set @salary1=5000
        set @salary2=1334
        select @salary = Salary from Employees 
        where EmployeeID < 111
        IF 
        @salary = 5000
        update Employees set @Salary = @salary1
        Else
        begin
        update Employees set @Salary = @salary2
        end
        go      

        declare @salary money
        select @Salary = Salary from Employees
        where EmployeeID = 103
        IF @salary < 9000
        print 'Your salary will be increment by 20%'
        else
        print 'Your salary will be increment by 15%'
        go

        -- OUTPUT: Your salary will be increment by 15%

        declare @salary money
        select @Salary = Salary from Employees
        where EmployeeID = 108
        IF @salary > 10000
        print 'Your salary will be increment by 20%'
        else
        print 'Your salary will be increment by 15%'
        go

        -- OUTPUT: Your salary will be increment by 20%

    -- Case Statement
        select EmployeeID,'salary rank'=case
        when Salary>25000 then '1'
        when salary between 15000 and 25000 then '2'
        when salary between 5000 and 15000 then '3'
        else '4'
        end
        from Employees
        go

    -- while
        
        declare @counter int, @maxid int,
        @FirstName varchar(100),@LastName varchar(100)
        select  @counter = min(EmployeeID),@maxid = max(EmployeeID)
        from Employees
        PRINT 'SR.NO.  ' + 'FULL NAME OF EMPLOYEE'
        while(@counter is not null AND @counter <= @maxid)
        BEGIN 
            select @FirstName = FirstName,@LastName = LastName
            FROM Employees where EmployeeID = @counter
                
            PRINT convert(varchar,@counter -99) +'       '+ concat(@FirstName,' ',@LastName)
            SET @counter +=1
        END
        
        declare @id int
        set @id = 201
        while(select min(EmployeeID) FROM Employees) > 100
        BEGIN	
            UPDATE Employees SET EmployeeID = @id
            SET @id = @id + 1
            IF(select MAX(EmployeeID) FROM Employees) > 250 
            BREAK
            ELSE
            CONTINUE
        END

