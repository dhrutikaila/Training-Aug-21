CREATE TABLE Campus (
CampusID Varchar(5) CONSTRAINT Campus_CampusID_PK  PRIMARY KEY,
CampusName varchar(50) not null,
Street varchar(50) not null,
City varchar(20) not null, 
State varchar(20) not null,
Zip int not null,
Phone varchar(20) not null,
CampusDiscount decimal(2,2)
)
CREATE TABLE Position (
PositionID Varchar(5) CONSTRAINT Position_PositionID_PK  PRIMARY KEY , 
Position varchar(20) not null, 
YearlyMembershipFee decimal(7,2)
)
CREATE TABLE Members (
MemberID int CONSTRAINT Members_MemberID_PK  PRIMARY KEY ,
LastName varchar(20) not null, 
FirstName varchar(20) not null,
CampusAddress varchar(100) not null,
CampusPhone varchar(20) not null,
CampusID Varchar(5)  not null CONSTRAINT Members_CampusID_FK FOREIGN KEY (CampusID) REFERENCES Campus(CampusID),
PositionID Varchar(5)  not null CONSTRAINT Members_PositionID_FK FOREIGN KEY (PositionID) REFERENCES Position(PositionID), 
ContractDuration int 
)

CREATE TABLE Prices 
(FoodItemTypeID int CONSTRAINT Prices_FoodItemID_Seq  PRIMARY KEY IDENTITY(1,1)
, MealType varchar(20) not null
,MealPrice decimal(7,2)
)
CREATE TABLE FoodItems 
(FoodItemID Varchar(5) CONSTRAINT FoodItems_FoodItemID_PK  PRIMARY KEY,
FoodItemName varchar(20) not null,
FoodItemTypeID int  not null CONSTRAINT FoodItems_FoodItemTypeID_FK FOREIGN KEY (FoodItemTypeID) REFERENCES Prices(FoodItemTypeID)
)

CREATE TABLE Orders 
(OrderID Varchar(5) CONSTRAINT Orders_OrderID_PK  PRIMARY KEY ,
MemberID int  not null CONSTRAINT Orders_MemberID_FK FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
OrderDate DATE
)

CREATE TABLE OrderLine
(OrderID Varchar(5)  not null CONSTRAINT OrderLine_OrderID_PK FOREIGN KEY (OrderID) REFERENCES Orders(OrderID), 
FoodItemsID Varchar(5)  not null CONSTRAINT OrderLine_FoodItemsID_PK FOREIGN KEY (FoodItemsID) REFERENCES FoodItems(FoodItemID), 
Quantity int 
)

USE [assignment1]
GO

INSERT INTO [dbo].[Campus]
           ([CampusID]
           ,[CampusName]
           ,[Street]
           ,[City]
           ,[State]
           ,[Zip]
           ,[Phone]
           ,[CampusDiscount])
     VALUES
         ('1','IUPUI','425 University Blvd.','Indianapolis', 'IN','46202', '317-274-4591',.08),
         ('2','IUPUI','425 University Blvd.','Indianapolis', 'IN','46202', '317-274-4591',.08),
         ('3','IUPUI','425 University Blvd.','Indianapolis', 'IN','46202', '317-274-4591',.08),
 ('4','Indiana University','107 S. Indiana Ave.','Bloomington', 'IN','47405', '812-855-4848',.07),
         ('5','IUPUI','425 University Blvd.','Indianapolis', 'IN','46202', '317-274-4591',.08),
 ('6','Purdue University','475 Stadium Mall Drive','West Lafayette', 'IN','47907', '765-494-1776',.06)

GO


USE [assignment1]
GO

INSERT INTO [dbo].[Position]
           ([PositionID]
           ,[Position]
           ,[YearlyMembershipFee])
     VALUES 
            ('1','Lecturer', 1050.50),
			('2','Associate Professor', 900.50),
			('3','Assistant Professor', 875.50),
			('4','Professor', 700.75),
			('5','Full Professor', 500.50)

GO


USE [assignment1]
GO

INSERT INTO [dbo].[Members]
           ([MemberID]
           ,[LastName]
           ,[FirstName]
           ,[CampusAddress]
           ,[CampusPhone]
           ,[CampusID]
           ,[PositionID]
           ,[ContractDuration])
     VALUES
        ('1','Ellen','Monk','009 Purnell', '812-123-1234', '2', '5', 12),
		('2','Joe','Brady','008 Statford Hall', '765-234-2345', '3', '2', 10),
		('3','Dave','Davidson','007 Purnell', '812-345-3456', '2', '3', 10),
		('4','Sebastian','Cole','210 Rutherford Hall', '765-234-2345', '3', '5', 10),
		('5','Michael','Doo','66C Peobody', '812-548-8956', '2', '1', 10),
		('6','Jerome','Clark','SL 220', '317-274-9766', '1', '1', 12),
		('7','Bob','House','ET 329', '317-278-9098', '1', '4', 10),
		('8','Bridget','Stanley','SI 234', '317-274-5678', '1', '1', 12),
		('9','Bradley','Wilson','334 Statford Hall', '765-258-2567', '3', '2', 10)

GO


USE [assignment1]
GO

INSERT INTO [dbo].[Prices]
           ([MealType]
           ,[MealPrice])
     VALUES
            ('Beer/Wine', 5.50),
			('Dessert', 2.75),
			('Dinner', 15.50 ),
			('Soft Drink', 2.50 ),
			('Lunch', 7.25)

GO


USE [assignment1]
GO

INSERT INTO [dbo].[FoodItems]
           ([FoodItemID]
           ,[FoodItemName]
           ,[FoodItemTypeID])
     VALUES
            ('10001','Lager', '1'),
			('10002','Red Wine', '1'),
			('10003','White Wine', '1'),
			('10004','Coke', '4'),
			('10005','Coffee', '4'),
			('10006','Chicken a la King', '3'),
			('10007','Rib Steak', '3'),
			('10008','Fish and Chips', '3'),
			('10009','Veggie Delight', '3'),
			('10010','Chocolate Mousse', '2'),
			('10011','Carrot Cake', '2'),
			('10012','Fruit Cup', '2'),
			('10013','Fish and Chips', '5'),
			('10014','Angus Beef Burger', '5'),
			('10015','Cobb Salad', '5')

GO


USE [assignment1]
GO

INSERT INTO [dbo].[Orders]
           ([OrderID]
           ,[MemberID]
           ,[OrderDate])
     VALUES
            ('1', '9', 'March 5, 2015'),
			('2', '8', 'March 5, 2015'),
			('3', '7', 'March 5, 2015'),
			('4', '6', 'March 7, 2015'),
			('5', '5', 'March 7, 2015'),
			('6', '4', 'March 10, 2015'),
			('7', '3', 'March 11, 2015'),
			('8', '2', 'March 12, 2015'),
			('9', '1', 'March 13, 2015')

GO


USE [assignment1]
GO

INSERT INTO [dbo].[OrderLine]
           ([OrderID]
           ,[FoodItemsID]
           ,[Quantity])
     VALUES
            ('1','10001',1),
			('1','10006',1),
			('1','10012',1),
			('2','10004',2),
			('2','10013',1),
			('2','10014',1),
			('3','10005',1),
			('3','10011',1),
			('4','10005',2),
			('4','10004',2),
			('4','10006',1),
			('4','10007',1),
			('4','10010',2),
			('5','10003',1),
			('6','10002',2),
			('7','10005',2),
			('8','10005',1),
			('8','10011',1),
			('9','10001',1)

GO


--Create a listing of all Faculty Members (First and Last), their Faculty Position and the University that they
--are affiliated with (Name), along with their Monthly_Dues (Calculated Field with a column alias). Sort the records in
--descending order by Universityand then by Faculty's last name in ascending order. 

SELECT a.FirstName + ' ' + a.LastName AS 'Faculty Members', b.Position, c.CampusName AS 'Name', b.YearlyMembershipFee/12 AS 'Monthly_Dues'  
FROM Members a  JOIN Position b ON a.PositionID = b.PositionID  JOIN Campus c ON a.CampusID = c.CampusID
ORDER BY c.CampusName DESC, a.LastName ASC

--Create a listing that shows the various food items that the faculty club serves (Name of the food item, 
--type of food item and the price of the food item). Note: List no alcoholic beverages.Sort the records in ascending order by price. 
SELECT a.FoodItemName,b.MealType,b.MealPrice FROM FoodItems a JOIN Prices b ON a.FoodItemTypeID = b.FoodItemTypeID ORDER BY b.MealPrice ASC

--List the OrderID, Order Date, Faculty Member's Name, Campus Name, each FoodItem that makes up a given order, the type of meal,
--cost of the meal, quantity ordered and the total line total (calculated field and column alias). Sort by Order IDs in descending order. 
SELECT a.OrderID,a.OrderDate,b.FirstName,e.FoodItemName,f.MealType,f.MealPrice,d.Quantity,SUM(f.MealPrice)  FROM Orders a  JOIN Members b ON a.MemberID = b.MemberID
JOIN Campus c ON b.CampusID = c.CampusID JOIN OrderLine d ON a.OrderID = d.OrderID JOIN FoodItems e ON d.FoodItemsID = e.FoodItemID
JOIN Prices f ON e.FoodItemTypeID = f.FoodItemTypeID  ORDER BY a.OrderID DESC 