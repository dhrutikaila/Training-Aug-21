--USE StoredProcedure

--1.Create a listing of all Faculty Members (First and Last), their Faculty Position and the 
--University that they are affiliated with (Name), along with their Monthly_Dues(Calculated Field with a column alias). 
--Sort the records in descending order by University and then by Faculty's last name in ascending order. 

/*
SP_NAME : GetFacultyInfo
AUTHOR : Mehul Jambukiya   CREATED ON : 08/09/2021
EXECUTION : 
	EXEC GetFacultyInfo 
*/

CREATE PROCEDURE GetFacultyInfo
	AS
		SET NOCOUNT ON
		SELECT m.FirstName+' '+m.LastName AS FacultyName,p.Position ,c.CampusName AS University,p.YearlyMembershipFee/12 AS MonthlyDue
			FROM 
				Members m JOIN Position p ON m.PositionID=p.PositionID
				JOIN Campus c ON c.CampusID=m.CampusID 
					ORDER BY c.CampusName DESC ,m.LastName ASC
		SET NOCOUNT OFF


EXEC GetFacultyInfo

--2.Create a listing that shows the various food items that the faculty club serves
--(Name of the food item, type of food item and the price of the food item).
--Note: List no alcoholic beverages. Sort the records in ascending order by price. 

/*
SP_NAME : GetFoodItemInfo
AUTHOR : Mehul Jambukiya   CREATED ON : 08/09/2021
EXECUTION : 
	EXEC GetFoodItemInfo
*/

CREATE PROCEDURE GetFoodItemInfo
	AS
		SET NOCOUNT ON
		SELECT f.FoodItemName AS FoodItem,p.MealType AS TypeOfFoodItem,p.MealPrice AS PriceOfFoodItem
			FROM 
				FoodItems f JOIN Prices p ON f.FoodItemTypeID=p.FoodItemTypeID
					WHERE p.FoodItemTypeID != 1
						ORDER BY p.MealPrice
		SET NOCOUNT OFF

EXEC GetFoodItemInfo

--3.List the OrderID, Order Date, Faculty Member's Name, Campus Name, each FoodItem that makes up a given order,
--the type of meal, cost of the meal, quantity ordered and the total line total (calculated field and column alias).
--Sort by Order IDs in descending order. 

/*
SP_NAME : GetInfo
AUTHOR : Mehul Jambukiya   CREATED ON : 14/09/2021
EXECUTION : 
	EXEC GetInfo 
*/

CREATE PROCEDURE GetInfo
	AS
		SET NOCOUNT ON
		SELECT o.OrderID,o.OrderDate,m.FirstName+' '+m.LastName AS FacultyName,c.CampusName,f.FoodItemName,
					f.FoodItemTypeID,p.MealType,p.MealPrice,ol.Quantity,p.MealPrice*ol.Quantity AS TotalCost
			FROM
				Orders o JOIN Members m ON o.MemberID=m.MemberID
				JOIN Campus c ON c.CampusID=m.CampusID
				JOIN OrderLine ol ON ol.OrderID=o.OrderID
				JOIN FoodItems f ON f.FoodItemID=ol.FoodItemsID
				JOIN Prices p ON p.FoodItemTypeID=f.FoodItemTypeID
					ORDER BY o.OrderID DESC
		SET NOCOUNT OFF

EXEC GetInfo


/*SELECT * FROM Campus 
SELECT * FROM Position
SELECT * FROM Members
SELECT * FROM Prices
SELECT * FROM FoodItems
SELECT * FROM Orders
SELECT * FROM OrderLine

CREATE TABLE Campus(
CampusID VARCHAR(5) CONSTRAINT Campus_CampusID_PK PRIMARY KEY,
CampusName VARCHAR(30) CONSTRAINT Campus_CampusName_NotNull NOT NULL,
Street VARCHAR(30) CONSTRAINT Campus_Street_NotNull NOT NULL,
City VARCHAR(20) CONSTRAINT Campus_City_NotNull NOT NULL,
State VARCHAR(20) CONSTRAINT Campus_State_NotNull NOT NULL,
Zip VARCHAR(10) CONSTRAINT Campus_Zip_NotNull NOT NULL,
Phone VARCHAR(15) CONSTRAINT Campus_Phone_NotNull NOT NULL,
CampusDiscount DECIMAL(2,2) CONSTRAINT Campus_CampusDiscount_DefNull DEFAULT NULL
)


CREATE TABLE Position(
PositionID VARCHAR(5) CONSTRAINT Position_PositionID_PK PRIMARY KEY,
Position VARCHAR(25) CONSTRAINT Position_Position_NotNull NOT NULL,
YearlyMembershipFee DECIMAL(7,2) CONSTRAINT Position_YearlyMembershipFee_NotNull NOT NULL
)

CREATE TABLE Members(
MemberID VARCHAR(5) CONSTRAINT Members_MemberID_PK PRIMARY KEY,
LastName VARCHAR(30) CONSTRAINT Members_LastName_NotNull NOT NULL,
FirstName VARCHAR(30) CONSTRAINT Members_FirstName_NotNull NOT NULL,
CampusAddress VARCHAR(50) CONSTRAINT Members_FirstName_NotNull NOT NULL,
CampusPhone VARCHAR(15) CONSTRAINT Members_CampusPhone_NotNull NOT NULL,
CampusID VARCHAR(5) CONSTRAINT Members_CampusID_FK FOREIGN KEY REFERENCES Campus(CampusID) ON DELETE SET NULL ON UPDATE CASCADE,
PositionID VARCHAR(5) CONSTRAINT Members_PositionID_FK FOREIGN KEY REFERENCES Position(PositionID) ON DELETE SET NULL ON UPDATE CASCADE,
ContractDuration INT CONSTRAINT Members_ContractDuration_ChkMax3Digits CHECK (ContractDuration>=0 AND ContractDuration<=999)
)

CREATE TABLE Prices(
FoodItemTypeID INT CONSTRAINT Prices_FoodItemID_PK_Seq PRIMARY KEY IDENTITY(1,1),
MealType VARCHAR(20) CONSTRAINT Prices_MealType_NotNull NOT NULL,
MealPrice DECIMAL(7,2) CONSTRAINT Prices_MealPrice_NotNull NOT NULL
)

CREATE TABLE FoodItems(
FoodItemID VARCHAR(5) CONSTRAINT Fooditems_FoodItemID_PK PRIMARY KEY,
FoodItemName VARCHAR(30) CONSTRAINT FoodItems_FoodItemName_NotNull NOT NULL,
FoodItemTypeID INT CONSTRAINT FoodItems_FoodItemTypeID_FK FOREIGN KEY REFERENCES Prices(FoodItemTypeID) ON DELETE SET NULL ON UPDATE CASCADE
)

CREATE TABLE Orders(
OrderID VARCHAR(5) CONSTRAINT Orders_OrderID_PK PRIMARY KEY,
MemberID VARCHAR(5) CONSTRAINT Orders_MemberID_FK FOREIGN KEY REFERENCES Members(MemberID) ON DELETE SET NULL ON UPDATE CASCADE,
OrderDate DATE CONSTRAINT Orders_OrderDate_NotNull NOT NULL
)

CREATE TABLE OrderLine(
OrderID VARCHAR(5) CONSTRAINT OrderLine_OredrID_FK FOREIGN KEY REFERENCES Orders(OrderID) ON DELETE NO ACTION ON UPDATE CASCADE,
FoodItemsID VARCHAR(5) CONSTRAINT OrderLine_FoodItemsID_FK FOREIGN KEY REFERENCES FoodItems(FoodItemID) ON DELETE NO ACTION ON UPDATE CASCADE,
Quantity INT CONSTRAINT OrderLine_Quantity_ChkMax3Digits CHECK (Quantity>=0 AND Quantity<=999),
CONSTRAINT OrderLine_OrderIDFoodItemsID_CPK PRIMARY KEY(OrderID,FoodItemsID)
)

INSERT INTO Campus VALUES
('1','IUPUI','425 University Blvd.','Indianapolis', 'IN','46202', '317-274-4591',.08),
('2','Indiana University','107 S. Indiana Ave.','Bloomington', 'IN','47405', '812-855-4848',.07),
('3','Purdue University','475 Stadium Mall Drive','West Lafayette', 'IN','47907', '765-494-1776',.06)

INSERT INTO Position VALUES
('1','Lecturer', 1050.50),
('2','Associate Professor', 900.50),
('3','Assistant Professor', 875.50),
('4','Professor', 700.75),
('5','Full Professor', 500.50)

INSERT INTO Members VALUES
('1','Ellen','Monk','009 Purnell', '812-123-1234', '2', '5', 12),
('2','Joe','Brady','008 Statford Hall', '765-234-2345', '3', '2', 10),
('3','Dave','Davidson','007 Purnell', '812-345-3456', '2', '3', 10),
('4','Sebastian','Cole','210 Rutherford Hall', '765-234-2345', '3', '5', 10),
('5','Michael','Doo','66C Peobody', '812-548-8956', '2', '1', 10),
('6','Jerome','Clark','SL 220', '317-274-9766', '1', '1', 12),
('7','Bob','House','ET 329', '317-278-9098', '1', '4', 10),
('8','Bridget','Stanley','SI 234', '317-274-5678', '1', '1', 12),
('9','Bradley','Wilson','334 Statford Hall', '765-258-2567', '3', '2', 10)

INSERT INTO Prices VALUES
('Beer/Wine', 5.50),
('Dessert', 2.75),
('Dinner', 15.50),
('Soft Drink', 2.50),
('Lunch', 7.25)

INSERT INTO FoodItems VALUES
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

INSERT INTO Orders VALUES
('1', '9', 'March 5, 2015'),
('2', '8', 'March 5, 2015'),
('3', '7', 'March 5, 2015'),
('4', '6', 'March 7, 2015'),
('5', '5', 'March 7, 2015'),
('6', '4', 'March 10, 2015'),
('7', '3', 'March 11, 2015'),
('8', '2', 'March 12, 2015'),
('9', '1', 'March 13, 2015')

INSERT INTO OrderLine VALUES
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
('9','10001',1)*/