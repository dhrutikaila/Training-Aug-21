USE[ProgDesc1708]
CREATE TABLE Campus (CampusID VARCHAR(5) NOT NULL CONSTRAINT PK_Campus PRIMARY KEY (CampusID)
, CampusName VARCHAR(30), Street VARCHAR(30), City VARCHAR(30), State VARCHAR(30), Zip INT, Phone VARCHAR(12), CampusDiscount DECIMAL (2,2))

CREATE TABLE Position (PositionID VARCHAR(5) NOT NULL CONSTRAINT PK_Position PRIMARY KEY (PositionID), Position VARCHAR(30), YearlyMembershipFee DECIMAL(7,2))

CREATE TABLE Members (MemberID VARCHAR(5) NOT NULL CONSTRAINT PK_Member PRIMARY KEY (MemberID), LastName VARCHAR(30), FirstName VARCHAR(30), CampusAddress VARCHAR(30), CampusPhone VARCHAR(12), CampusID VARCHAR(5) NOT NULL CONSTRAINT FK_Campus FOREIGN KEY REFERENCES Campus(CampusID), PositionID VARCHAR(5) NOT NULL CONSTRAINT FK_Position FOREIGN KEY REFERENCES Position(PositionID), ContractDuration INTEGER NOT NULL check (ContractDuration between 0 and 999))

CREATE TABLE Prices (FoodItemTypeID INT NOT NULL CONSTRAINT PK_FIT_ID PRIMARY KEY (FoodItemTypeID), MealType VARCHAR(30), MealPrice DECIMAL (7,2))

CREATE TABLE FoodItems 
(FoodItemID VARCHAR(5) NOT NULL CONSTRAINT PK_FoodItem PRIMARY KEY (FooditemID),
FoodItemName VARCHAR(30), 
FoodItemTypeID INT NOT NULL CONSTRAINT FK_Price FOREIGN KEY REFERENCES Prices(FoodItemTypeID))

CREATE TABLE Orders (OrderID VARCHAR(5) NOT NULL CONSTRAINT PK_Order
PRIMARY KEY (OrderID),MemberID VARCHAR(5) NOT NULL CONSTRAINT FK_Members FOREIGN KEY REFERENCES Members(MemberID), OrderDate Date)
     

CREATE TABLE OrderLine (OrderID VARCHAR(5) FOREIGN KEY REFERENCES Orders(OrderID), FoodItemsID VARCHAR(5) FOREIGN KEY REFERENCES FoodItems(FoodItemID), Quantity INTEGER NOT NULL CHECK (Quantity between 0 and 999), CONSTRAINT Pk_Orderline PRIMARY KEY (OrderID,FoodItemsID))
 
 

INSERT INTO Campus VALUES
('1','IUPUI','425 University Blvd.','Indianapolis', 'IN','46202', '3172744591',.08),
('2','Indiana University','107 S. Indiana Ave.','Bloomington', 'IN','47405', '8128554848',.07),
('3','Purdue University','475 Stadium Mall Drive','West Lafayette', 'IN','47907', '7654941776',.06)


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
('5','Michael','Doo','66CPeobody', '812-548-8956', '2', '1', 10),
('6','Jerome','Clark','SL 220', '317-274-9766', '1', '1', 12),
('7','Bob','House','ET 329', '317-278-9098', '1', '4', 10),
('8','Bridget','Stanley','SI 234', '317-274-5678', '1', '1', 12),
('9','Bradley','Wilson','334 Statford Hall', '765-258-2567', '3', '2', 10)



INSERT INTO Prices VALUES
('1','Beer/Wine', 5.50),
('2','Dessert', 2.75),
('3','Dinner', 15.50), 
('4','Soft Drink', 2.50),
('5','Lunch', 7.25)
SELECT * FROM Prices


INSERT INTO FoodItems VALUES
('10001','Lager','1'),
('10002','Red Wine','1'),
('10003','White Wine','1'),
('10004','Coke','4'),
('10005','Coffee','4'),
('10006','Chicken a la King','3'),
('10007','Rib Steak','3'),
('10008','Fish and Chips','3'),
('10009','Veggie Delight','3'),
('10010','Chocolate Mousse','3'),
('10011','Carrot Cake','2'),
('10012','Fruit Cup','2'),
('10013','Fish and Chips','5'),
('10014','Angus Beef Burger','5'),
('10015','Cobb Salad','5')


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
('9','10001',1)

--task-1-Create a listing of all Faculty Members (First and Last), their Faculty Position and the University that they are affiliated with (Name), along with their Monthly_Dues (Calculated Field with a column alias). Sort the records in descending order by University and then by Faculty's last name in ascending order.  
 SELECT CONCAT(M.FirstName, ' ', M.LastName) AS 'Name', P.Position, C.CampusName, (P.YearlyMembershipFee/12) AS 'Monthly Dues' 
FROM (Members M JOIN Position P ON M.PositionID = P.PositionID) 
	 JOIN Campus C ON M.CampusID = C.CampusID
ORDER BY C.CampusName DESC, M.LastName ASC


--task-2-Create a listing that shows the various food items that the faculty club serves (Name of the food item, type of food item and the price of the food item). Note: List no alcoholic beverages. Sort the records in ascending order by price. 
SELECT f.FoodItemName AS 'Food Item Name', F.FoodItemTypeID, P.MealPrice AS 'Food Price' FROM FoodItems F JOIN Prices P on F.FoodItemTypeID=p.FoodItemTypeID WHERE P.MealType!='Beer/Wine' AND F.FoodItemID IN (SELECT DISTINCT FoodItemsID FROM OrderLine WHERE OrderID IN (SELECT OrderID FROM Orders WHERE MemberID IN ( select MemberID from Members))) order by MealPrice ASC
SELECT F.FoodItemName AS 'Food Item Name', P.MealType AS 'Food Type', P.MealPrice AS 'Food Price' FROM FoodItems F JOIN Prices P ON F.FoodItemTypeID = P.FoodItemTypeID WHERE P.MealType != 'Beer/Wine' ORDER BY P.MealPrice ASC


--task-3-List the OrderID, Order Date, Faculty Member's Name, Campus Name, each FoodItem that makes up a given order, the type of meal, cost of the meal, quantity ordered and the total line total (calculated field and column alias). Sort by Order IDs in descending order.
SELECT O.OrderID, O.OrderDate, CONCAT(M.FirstName, ' ', M.LastName) AS 'Name', CampusName AS 'Campus Name', FoodItemName AS 'Food Item Name', P.MealType AS 'Meal Type', P.MealPrice, OL.Quantity, P.MealPrice * OL.Quantity AS 'Total'
FROM (((((Orders O JOIN Members M ON O.MemberID = M.MemberID)
	 JOIN Campus C ON M.CampusID = C.CampusID) 
	 JOIN OrderLine OL ON O.OrderID = OL.OrderID)
	 JOIN FoodItems F ON OL.FoodItemsID = F.FoodItemID)
	 JOIN Prices P ON F.FoodItemTypeID = P.FoodItemTypeID)
ORDER BY O.OrderID DESC


