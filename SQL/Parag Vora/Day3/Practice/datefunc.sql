-- Getdate()

    select getdate()
-- output-> 2021-08-27 09:59:28.367

-- dateadd()
   select dateadd(mm,6,'2021/08/16') as employee_date 
   select dateadd(year,22,'1999/12/29') as ageat22
--      month, mm, m -> from month
--      year, yyyy, yy -> for year
--      quarter, qq, q -> for Quarter
--      week, ww, wk -> for Week
--      weekday, dw, w ->for Weekday
--      day, dd, d -> for day
--      hour, hh -> for hour
--      minute, mi, n -> for minutes
--      second, ss, s -> for Second
--      millisecond, ms ->for Millisecond
--      dayofyear, dy, y -> Day of the year


-- datediff()
    select datediff(year,'1999/12/29',getdate()) as age
    select datediff(year,HireDate,getdate()) as experience from Employees

-- datename() --returns string value
    SELECT DATENAME(dw, '1999/12/29') AS DayAtBirth;
    SELECT DATENAME(dy, '1999/12/29') AS DatePartString; --returns day of year 
    select datename(dw,HireDate) as DayAtJoining from Employees

-- datepart()
    SELECT DATEPART(MM, '2017/08/25') AS DatePartInt; --returns integer value

-- DateFromParts()
    -- DATEFROMPARTS(year, month, day)
    select DATEFROMPARTS(1999,12,29) as dob --returns date

-- GETUTCDATE()
    select getutcdate() as UTCDate

-- ISDATE()
    --returns 1 if valid date else return 0 if invalid
    -- you must hace to include your string with '' inside the brackests
    select isdate('1999/12/29')  --true(1)
    select ISDATE('1999') --true
    select isdate('hello') --false (0)

-- current_timestamp()
    SELECT CURRENT_TIMESTAMP;

-- SYSDATETIME()
    SELECT SYSDATETIME() AS SysDateTime;

-- Year()
    SELECT YEAR('1999/12/29') AS DobYear;