-- cursor
DECLARE MyCursor CURSOR SCROLL 
FOR SELECT * FROM Employees
OPEN MyCursor

FETCH FIRST FROM MyCursor
FETCH LAST FROM MyCursor
FETCH PRIOR FROM MyCursor
FETCH ABSOLUTE 4 FROM MyCursor
FETCH RELATIVE 4 FROM MyCursor

CLOSE MyCursor
DEALLOCATE MyCursor

---------------------Fetch Type---------------------
Declare Emp_cursor cursor Scroll
for select * from HumanResources.Employee
Open Emp_cursor
fetch next from Emp_cursor -- will fetch next row
fetch prior from Emp_cursor -- will fetch previous row
fetch first from Emp_cursor -- will fetch first row
fetch last from Emp_cursor -- will fetch last row
fetch absolute 10 from Emp_cursor -- will fetch 10th row 
fetch relative 10 from Emp_cursor -- will fetch 10th row from current fetch
Close Emp_cursor
Deallocate Emp_cursor


-- The following example opens a cursor and fetches all the rows
DECLARE Employee_Cursor CURSOR FOR  
SELECT BusinessEntityID, JobTitle  
FROM HumanResources.Employee
OPEN Employee_Cursor
FETCH NEXT FROM Employee_Cursor 
WHILE @@FETCH_STATUS = 0  
   BEGIN  
      FETCH NEXT FROM Employee_Cursor
   END  
CLOSE Employee_Cursor
DEALLOCATE Employee_Cursor
GO  

-----------local cursor------------------------------
Declare Emp_cursor cursor local -- create cursor locally
for select * from HumanResources.Employee
Open Emp_cursor
fetch next from Emp_cursor
Close Emp_cursor
Deallocate Emp_cursor


------------------global cursor-----------------------------
Declare Emp_cursor cursor global -- creates cursor globally
for select * from HumanResources.Employee
Open Emp_cursor
fetch next from Emp_cursor
Close Emp_cursor
Deallocate Emp_cursor


-----------scroll  cursor-------------
Declare Emp_cursor cursor scroll
for select * from HumanResources.Employee
Open Emp_cursor
fetch next from Emp_cursor
fetch prior from Emp_cursor
fetch last from Emp_cursor
Close Emp_cursor
Deallocate Emp_cursor


--------WITH CURSOR VERIABLE------
DECLARE MyCursor CURSOR SCROLL 
FOR SELECT EmployeeID,FirstName FROM Employees
DECLARE @Employee_Id INT,@FirstName VARCHAR(15)

OPEN MyCursor

FETCH FIRST FROM MyCursor INTO @Employee_Id,@FirstName
PRINT ('Employee: '+CAST(@Employee_Id AS VARCHAR(5)) +' ' +@FirstName)

CLOSE MyCursor
DEALLOCATE MyCursor




