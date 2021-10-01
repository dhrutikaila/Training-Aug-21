--SQL indexes Assignment

--Indexes

--2. Which of the following things can help speed data retrieval?

--a. A DEFAULT constraint
--b. A primary key constraint
--c. A clustered index
--d. A foreign key constraint\

--ans c


--4. Consider using a clustered index when:

--a. Columns contain a large number of distinct values
--b. Columns are accessed sequentially
--c. Columns undergo frequent changes
--d.  Queries return large result sets

--ans c


--8.  How many clustered indexes can you have for a database?

--a. 1 
--b. 2 
--c. 4 
--d. 8 

--ans a


--Comparing Clustered vs Non-clustered Indexes

--your boss wants to speed things up on the company’s database server. Therefore, he is thinking
--of having you create a couple of indexes. He asks you to explain the advantages and disadvantages 
--of creating a clustered index versus a non-clustered index. How should you respond?

--1. Clustered index is faster When Non-clustered index is slower.

--2. Clustered index requires less memory for operations When	Non-Clustered index requires more memory for operations.

--3. In clustered index, index is the main data when In Non-Clustered index, index is the copy of data.

--4. A table can have only one clustered index  when	A table can have multiple non-clustered index.

--5. Clustered index has inherent ability of storing data on the disk when Non-Clustered index does not have inherent ability of storing data on the disk.

--6. Clustered index store pointers to block not data when Non-Clustered index store both value and a pointer to actual row that holds data.

--7. In Clustered index leaf nodes are actual data itself when In Non-Clustered index leaf nodes are not the actual data itself rather they only contains included columns.

--8. In Clustered index, Clustered key defines order of data within table when In Non-Clustered index,index key defines order of data within index.

--9. A Clustered index is a type of index in which table records are physically reordered to match the index when A Non-Clustered index is a special type of index in which logical order of index does not match physical stored order of the rows on disk.\


--Creating a clustered index

--You are a database administrator for the AdventureWorks Corporation. You recently created some databases, 
--and you’ve just realized how large the databases will become in the future. 
--Therefore, you need to create a new clustered index to help with overall performance.
--Using the SSMS interface, what steps would you use to create a new clustered index on the name column for the AdventureWorks database?

--step 1. Click on AdventureWorks database 

--step 2. Click on any table of AdventureWorks database.

--step 3. Then right-click on Indexes in table option.

--step 4. click on new index.

--step 5. Then click on General menu

--step 6. Select Index Type clustered.

--step 7. Click Ok 


--by defualt a clusted index is auto generated upon table by declaring a PRIMARY KEY



-- Creating a Clustered Index Using Transact-SQL

--As a database administrator, you need to increase the performance of the PlanetsID table, so you decide to create a clustered index. 
--But instead of using SSMS, you decide to use queries to perform this task. Therefore, you create a new PlanetsID database using the following 
--commands within SMMS:

CREATE CLUSTERED INDEX ClustAccount
	ON dbo.ACCOUNTS

-- OR

USE [BANK]
GO

/****** Object:  Index [PK__ACCOUNTS__9F092CAA323BA405]    Script Date: 12-09-2021 09:32:04 ******/
ALTER TABLE [dbo].[ACCOUNTS] ADD PRIMARY KEY CLUSTERED 
(
	[Account_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO


