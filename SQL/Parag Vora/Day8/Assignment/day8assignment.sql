-- 1)Create a batch Select Banking as ‘Bank Dept’, Insurance as ‘Insurance Dept’ and Services as ‘Services Dept’ from employee table

    select EMPLOYEE_ID,FIRST_NAME,LAST_NAME,'Department' =case
    when DEPARTMENT = 'Banking' then 'Bank Dept'
    when DEPARTMENT = 'Insurance' then 'Insurance Dept'
    when DEPARTMENT = 'Services' then 'Services Dept'
    else 'Common dept'
    end
    from Employee
    GO

    