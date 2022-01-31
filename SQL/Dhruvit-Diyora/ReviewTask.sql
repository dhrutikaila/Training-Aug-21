CREATE TABLE Campus(
	CampusID INT IDENTITY(1,1) ,
	CampusName VARCHAR(50) NOT NULL,
	Street VARCHAR(100) NOT NULL,
	City VARCHAR(50) NOT NULL,
	State VARCHAR(20) NOT NULL,
	Zip INT NOT NULL,
	Phone BIGINT NOT NULL CONSTRAINT CK_Phone CHECK(Phone LIKE '[3-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	CampusDiscount DECIMAL(2,2) NOT NULL,
	CONSTRAINT Campus_CampusId_PK PRIMARY KEY (CampusID)

)
CREATE TABLE Position(
	PositionID INT IDENTITY(1,1)  ,
	Position VARCHAR(50) NOT NULL,
	YearlyMembershipFee DECIMAL(6,2) NOT NULL,
	CONSTRAINT Position_PositionId_PK PRIMARY KEY(PositionID)
)

CREATE TABLE Members(
	MemberID INT IDENTITY(1,1),
	LastName VARCHAR(50) NOT NULL,
	FirstName VARCHAR(50) NOT NULL,
	CampusAddress VARCHAR(100) NOT NULL,
	CampusPhone BIGINT CONSTRAINT CK_CampusPhone CHECK(CampusPhone LIKE '[3-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') NOT NULL,
	CampusID INT NOT NULL CONSTRAINT FK_Campus FOREIGN KEY  REFERENCES Campus(CampusID),
	PositionID  INT NOT NULL CONSTRAINT FK_Position FOREIGN KEY  REFERENCES Position(PositionID),
	ContractDuration INT NOT NULL CONSTRAINT CK_ContractDuration CHECK (ContractDuration between 0 and 999),
	CONSTRAINT Members_MemberId_PK PRIMARY KEY(MemberID)
)

CREATE TABLE Prices(
	FoodItemTypeID INT IDENTITY(1,1),
	MealType VARCHAR(30) NOT NULL, 
	MealPrice DECIMAL (7,2) NOT NULL,
	CONSTRAINT Prices_FoodItemTypeID_PK PRIMARY KEY(FoodItemTypeID)
)

CREATE TABLE FoodItems(
	FoodItemID INT ,
	FoodItemName VARCHAR(30) NOT NULL, 
	FoodItemTypeID INT NOT NULL CONSTRAINT FK_Price FOREIGN KEY REFERENCES Prices(FoodItemTypeID),
	CONSTRAINT FoodItems_FoodItemID_PK PRIMARY KEY(FoodItemID)
)

CREATE TABLE Orders(
	OrderID INT IDENTITY(1,1) ,
	MemberID INT NOT NULL CONSTRAINT FK_MemberId FOREIGN KEY REFERENCES Members(MemberID), 
	OrderDate Date,
	CONSTRAINT Orders_OrderId_PK PRIMARY KEY(OrderID)
)

CREATE TABLE OrderLine(
	OrderID INT FOREIGN KEY REFERENCES Orders(OrderID), 
	FoodItemsID INT FOREIGN KEY REFERENCES FoodItems(FoodItemID),
	Quantity INT NOT NULL CONSTRAINT CK_Quantity CHECK (Quantity between 0 and 999),
	CONSTRAINT Pk_Orderline PRIMARY KEY (OrderID,FoodItemsID)
)


INSERT INTO Campus VALUES
('IUPUI','425 University Blvd.','Indianapolis', 'IN',46202,3172744591,.08),
('Indiana University','107 S. Indiana Ave.','Bloomington', 'IN',47405, 8128554848,.07),
('Purdue University','475 Stadium Mall Drive','West Lafayette', 'IN',47907, 7654941776,.06)

INSERT INTO Position VALUES
('Lecturer', 1050.50),
('Associate Professor', 900.50),
('Assistant Professor', 875.50),
('Professor', 700.75),
('Full Professor', 500.50)

INSERT INTO Members VALUES
('Ellen','Monk','009 Purnell', 8121231234, 2, 5, 12),
('Joe','Brady','008 Statford Hall', 7652342345, 3, 2, 10),
('Dave','Davidson','007 Purnell', 8123453456, 2, 3, 10),
('Sebastian','Cole','210 Rutherford Hall', 7652342345, 3, 5, 10),
('Michael','Doo','66CPeobody', 8125488956, 2, 1, 10),
('Jerome','Clark','SL 220', 3172749766, 1,1, 12),
('Bob','House','ET 329', 3172789098, 1, 4, 10),
('Bridget','Stanley','SI 234', 3172745678, 1, 1, 12),
('Bradley','Wilson','334 Statford Hall', 7652582567, 3, 2, 10)

INSERT INTO Prices VALUES
('Beer/Wine', 5.50),
('Dessert', 2.75),
('Dinner', 15.50), 
('Soft Drink', 2.50),
('Lunch', 7.25)

INSERT INTO FoodItems VALUES
(10001,'Lager','1'),
(10002,'Red Wine','1'),
(10003,'White Wine','1'),
(10004,'Coke','4'),
(10005,'Coffee','4'),
(10006,'Chicken a la King','3'),
(10007,'Rib Steak','3'),
(10008,'Fish and Chips','3'),
(10009,'Veggie Delight','3'),
(10010,'Chocolate Mousse','3'),
(10011,'Carrot Cake','2'),
(10012,'Fruit Cup','2'),
(10013,'Fish and Chips','5'),
(10014,'Angus Beef Burger','5'),
(10015,'Cobb Salad','5')


INSERT INTO Orders VALUES 
(9,'2015-03-05'),
(8,'2015-03-05'),
(7,'2015-03-05'),
(6,'2015-03-07'),
(5,'2015-03-07'),
(4,'2015-03-10'),
(3,'2015-03-11'),
(2,'2015-03-12'),
(1,'2015-03-13')


INSERT INTO OrderLine VALUES 
(1,10001,1),
(1,10006,1),
(1,10012,1),
(2,10004,2),
(2,10013,1),
(2,10014,1),
(3,10005,1),
(3,10011,1),
(4,10005,2),
(4,10006,1),
(4,10007,1),
(4,10010,2),
(5,10003,1),
(6,10002,2),
(7,10005,2),
(8,10005,1),
(8,10011,1),
(9,10001,1)


--Create a listing of all Faculty Members (First and Last), their Faculty Position and the University that they are affiliated with (Name), along with their Monthly_Dues (Calculated Field with a column alias). Sort the records in descending order by University and then by Faculty's last name in ascending order. 
SELECT CONCAT(M.FirstName,SPACE(1),M.LastName) FullName,P.Position,C.CampusName,(P.YearlyMembershipFee/12) Monthly_Dues FROM Members M JOIN Position P ON M.PositionID=P.PositionID JOIN Campus C ON M.CampusID = C.CampusID ORDER BY C.CampusName DESC, M.LastName ASC

--Create a listing that shows the various food items that the faculty club serves (Name of the food item, type of food item and the price of the food item). Note: List no alcoholic beverages. Sort therecords in ascending order by price. 
SELECT F.FoodItemName,P.MealType,P.MealPrice FROM 
	FoodItems F JOIN Prices P ON P.FoodItemTypeID=F.FoodItemTypeID WHERE P.MealType!='Beer/Wine' AND F.FoodItemID IN (SELECT DISTINCT FoodItemsID FROM OrderLine WHERE OrderID IN (SELECT OrderID FROM Orders WHERE MemberID IN ( SELECT MemberID FROM Members))) ORDER BY MealPrice ASC

--List the OrderID, Order Date, Faculty Member's Name, Campus Name, each FoodItem that makes up a given order, the type of meal, cost of the meal, quantity ordered and the total line total (calculated field and columnalias). Sort by Order IDs in descending order. 
SELECT O.OrderID, O.OrderDate, CONCAT(M.FirstName,SPACE(1),M.LastName) FullName, C.CampusName, F.FoodItemName, P.MealType, P.MealPrice, OL.Quantity, P.MealPrice * OL.Quantity AS 'Total'
FROM (((((Orders O JOIN Members M ON O.MemberID = M.MemberID)
	 JOIN Campus C ON M.CampusID = C.CampusID) 
	 JOIN OrderLine OL ON O.OrderID = OL.OrderID)
	 JOIN FoodItems F ON OL.FoodItemsID = F.FoodItemID)
	 JOIN Prices P ON F.FoodItemTypeID = P.FoodItemTypeID)
ORDER BY O.OrderID DESC

