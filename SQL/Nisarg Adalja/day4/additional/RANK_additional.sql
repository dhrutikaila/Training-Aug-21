/* join Clause */

/* it used to combine related data FROM multiple TABLEs */
/* 4 types of joins */
/* inner join
outer join
cross join 
self join */


/*1.  inner join */
/* it allow to give common data FROM diffrent sourse TABLEs*/
/* Retrives records FROM multiple TABLE after comparing values present in a common column. */
/* Retrives only those rows that satify the join condition. */
CREATE TABLE EmployeePayHistory(
payId INT Primary key not null,
Rate INT,
PayFrequency INT,
EmployeeID INT,
);
SELECT * FROM JobHistory

/*SELECT ProductID, Purchasing.Vendor.BusinessEntityID, Name
FROM Purchasing.ProductVendor INNER JOIN Purchasing.Vendor
    ON (Purchasing.ProductVendor.BusinessEntityID = Purchasing.Vendor.BusinessEntityID)
WHERE StandardPrice > $10
  AND Name LIKE N'F%'
  
  SELECT pv.ProductID, v.BusinessEntityID, v.Name
FROM Purchasing.ProductVendor AS pv 
INNER JOIN Purchasing.Vendor AS v
    ON (pv.BusinessEntityID = v.BusinessEntityID)
WHERE StandardPrice > $10
    AND Name LIKE N'F%';

  */


SELECT e.EmployeeID,j.JobID,j.StartDATE,j.EndDATE FROM Employees e join JobHistory j on e.EmployeeID = j.EmployeeID where j.startDATE>'1990-01-01';

/* outer join */
/* display the result set contain all the rows FROM one TABLE and the matching  rows FROM another TABLE */
/* display null for the col of the related TABLE where it does not find matching records. */

/* 1. left outer join */
/* it take all rows of left TABLE and take all common rows btw 2 tbls*/

SELECT e.EmployeeID,j.JobID,j.StartDATE,j.EndDATE FROM Employees e left outer join JobHistory j on e.EmployeeID = j.EmployeeID;

/* 2. right outer join */
/* it take all rows of right TABLE and take all common rows btw 2 tbls*/
SELECT * FROM Employees
SELECT e.EmployeeID,j.JobID,j.StartDATE,j.EndDATE FROM JobHistory j right outer join Employees e on j.EmployeeID = e.EmployeeID;

/* 3. full outer join */
/* it take all rows of both TABLE and take all common rows btw 2 tbls*/
SELECT e.EmployeeID,j.JobID,j.StartDATE,j.EndDATE FROM Employees e full outer join JobHistory j on e.EmployeeID = j.EmployeeID;


/* Cross Join */
/* Is also Known as the cartesian Product */
/* Join Each row FROM one TABLE with each row of the other TABLE */
SELECT e.EmployeeID,j.JobID,j.StartDATE,j.EndDATE FROM Employees e  cross join JobHistory j

/* Self Join */
/* dout  */
/* A TABLE is joined with itself */
/* one row in TABLE correlates with other rows in same TABLE */
/* we use 2 alias with same TABLE name */

SELECT j.JobID,j.StartDATE,j.EndDATE,e.DepartmentID FROM JobHistory e,JobHistory j where e.JobID=j.JobID;



/* join Clause */

/* it used to combine related data FROM multiple TABLEs */
/* 4 types of joins */
/* inner join
outer join
cross join 
self join */


/*1.  inner join */
/* it allow to give common data FROM diffrent sourse TABLEs*/
/* Retrives records FROM multiple TABLE after comparing values present in a common column. */
/* Retrives only those rows that satify the join condition. */
CREATE TABLE EmployeePayHistory(
payId INT Primary key not null,
Rate INT,
PayFrequency INT,
EmployeeID INT,
);
SELECT * FROM JobHistory

/*SELECT ProductID, Purchasing.Vendor.BusinessEntityID, Name
FROM Purchasing.ProductVendor INNER JOIN Purchasing.Vendor
    ON (Purchasing.ProductVendor.BusinessEntityID = Purchasing.Vendor.BusinessEntityID)
WHERE StandardPrice > $10
  AND Name LIKE N'F%'
  
  SELECT pv.ProductID, v.BusinessEntityID, v.Name
FROM Purchasing.ProductVendor AS pv 
INNER JOIN Purchasing.Vendor AS v
    ON (pv.BusinessEntityID = v.BusinessEntityID)
WHERE StandardPrice > $10
    AND Name LIKE N'F%';

  */


SELECT e.EmployeeID,j.JobID,j.StartDATE,j.EndDATE FROM Employees e join JobHistory j on e.EmployeeID = j.EmployeeID where j.startDATE>'1990-01-01';

/* outer join */
/* display the result set contain all the rows FROM one TABLE and the matching  rows FROM another TABLE */
/* display null for the col of the related TABLE where it does not find matching records. */

/* 1. left outer join */
/* it take all rows of left TABLE and take all common rows btw 2 tbls*/

SELECT e.EmployeeID,j.JobID,j.StartDATE,j.EndDATE FROM Employees e left outer join JobHistory j on e.EmployeeID = j.EmployeeID;

/* 2. right outer join */
/* it take all rows of right TABLE and take all common rows btw 2 tbls*/
SELECT * FROM Employees
SELECT e.EmployeeID,j.JobID,j.StartDATE,j.EndDATE FROM JobHistory j right outer join Employees e on j.EmployeeID = e.EmployeeID;

/* 3. full outer join */
/* it take all rows of both TABLE and take all common rows btw 2 tbls*/
SELECT e.EmployeeID,j.JobID,j.StartDATE,j.EndDATE FROM Employees e full outer join JobHistory j on e.EmployeeID = j.EmployeeID;


/* Cross Join */
/* Is also Known as the cartesian Product */
/* Join Each row FROM one TABLE with each row of the other TABLE */
SELECT e.EmployeeID,j.JobID,j.StartDATE,j.EndDATE FROM Employees e  cross join JobHistory j

/* Self Join */
/* dout  */
/* A TABLE is joined with itself */
/* one row in TABLE correlates with other rows in same TABLE */
/* we use 2 alias with same TABLE name */

SELECT j.JobID,j.StartDATE,j.EndDATE,e.DepartmentID FROM JobHistory e,JobHistory j where e.JobID=j.JobID;

/* Binary Checksum */
/* Returns the binary checksum value computed over a row of a TABLE or over a list of expressions. */

CREATE TABLE myTABLE (column1 INT, column2 VARCHAR(256));  
 
INSERT INTO myTABLE VALUES (1, 'test');  
  
SELECT BINARY_CHECKSUM(*) FROM myTABLE;  
  
UPDATE myTABLE set column2 = 'TEST';  
  
SELECT BINARY_CHECKSUM(*) FROM myTABLE;  
  
 /* Host Id */
 /* Returns the workstation identification number. The workstation identification number is the process ID (PID) of the application on the client computer that is connecting to SQL Server. */

 CREATE TABLE Orders  
   (OrderID     INT       PRIMARY KEY,    
    TerminalID  CHAR(8)   NOT NULL DEFAULT HOST_ID(),  
    OrderDATE   DATETIME  NOT NULL,  
    ShipDATE    DATETIME  NULL); 

/* CheckSum() */
/* The CHECKSUM function returns the checksum value computed over a TABLE row, or over an expression list. Use CHECKSUM to build hash indexes. */

/* Checksum ignores negative signature in numeric string */
/* dout */
SELECT CHECKSUM(N'2'), CHECKSUM(N'-2');
SELECT CHECKSUM(N'1'), CHECKSUM(N'-1');

ALTER TABLE Employees  
ADD cs_ename AS CHECKSUM(FirstName);  
GO  
CREATE INDEX Pname_index ON Employees (cs_ename);  
GO  
SELECT * FROM Employees