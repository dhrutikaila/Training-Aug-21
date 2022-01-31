CREATE TABLE Campus (
CampusID VARCHAR(5) CONSTRAINT Campus_CampusID_PK  PRIMARY KEY ,
CampusName VARCHAR(20) NOT NULL,
Street VARCHAR(20) NOT NULL,
City VARCHAR(20) NOT NULL, 
State VARCHAR(20) NOT NULL,
Zip INT NOT NULL,
Phone VARCHAR(20) NOT NULL,
CampusDiscount DECIMAL(2,2)
)

ALTER TABLE Campus alter COLUMN Street VARCHAR(30)

CREATE TABLE Position 
(PositionID VARCHAR(5) CONSTRAINT Position_PositionID_PK  PRIMARY KEY , 
Position VARCHAR(20) NOT NULL, 
YearlyMembershipFee DECIMAL(7,2)) 


CREATE TABLE Members
(MemberID VARCHAR(5) CONSTRAINT Members_MemberID_PK  PRIMARY KEY , 
LastName VARCHAR(15) NOT NULL, 
FirstName VARCHAR(15) NOT NULL, 
CampusAddress VARCHAR(40) NOT NULL, 
CampusPhone VARCHAR(10) NOT NULL, 
CampusID VARCHAR(5) CONSTRAINT Member_CampusID_FK REFERENCES Campus(CampusID) ON UPDATE CASCADE,
PositionID VARCHAR(5) CONSTRAINT Members_PositionID_FK REFERENCES Position(PositionID) ON UPDATE CASCADE, 
ContractDuration INT )


ALTER TABLE Members alter COLUMN CampusPhone VARCHAR(20)


CREATE TABLE Prices
(FoodItemTypeID INT CONSTRAINT Prices_FoodItemTypeID_PK  PRIMARY KEY IDENTITY(1,1) , 
MealType VARCHAR(15) NOT NULL, 
MealPrice DECIMAL(7,2))


CREATE TABLE FoodItems
(FoodItemID VARCHAR(5) CONSTRAINT FoodItems_FoodItemID_PK  PRIMARY KEY , 
FoodItemName VARCHAR(15), 
FoodItemTypeID INT CONSTRAINT FoodItems_FoodItemTypeID_FK REFERENCES Prices(FoodItemTypeID) 
ON UPDATE CASCADE)

ALTER TABLE FoodItems alter COLUMN FoodItemName VARCHAR(25)


CREATE TABLE Orders 
(OrderID  VARCHAR(5) CONSTRAINT Orders_OrderID_PK  PRIMARY KEY , 
MemberID VARCHAR(5) CONSTRAINT Orders_MemberID_FK REFERENCES Members(MemberID), 
OrderDate DATE)
    
CREATE TABLE OrderLine 
(OrderID VARCHAR(5) CONSTRAINT OrderLine_OrderID_FK REFERENCES Orders(OrderID),
FoodItemsID VARCHAR(5) CONSTRAINT OrderLine_FoodItemsID_FK REFERENCES FoodItems(FoodItemID),
Quantity INT)


INSERT INTO Campus VALUES
('1','IUPUI','425 University Blvd.','Indianapolis', 'IN','46202', '317-274-4591',.08),
('2','Indiana University','107 S. Indiana Ave.','Bloomington', 'IN','47405', '812-855-4848',.0),
('3','Purdue University','475 Stadium Mall Drive','West Lafayette', 'IN','47907', '765-494-1776',.06)

SELECT * FROM Campus

INSERT INTO Position VALUES 
('1','Lecturer', 1050.50),
('2','Associate Professor', 900.50),
('3','Assistant Professor', 875.50),
('4','Professor', 700.75),
('5','Full Professor', 500.50)

SELECT * FROM Position

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

SELECT * FROM Members


INSERT INTO Prices VALUES 
('Beer/Wine', 5.50),
('Dessert', 2.75),
('Dinner', 15.50), 
('Soft Drink', 2.50), 
('Lunch', 7.25)

SELECT * FROM Prices

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

SELECT * FROM FoodItems

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

SELECT * FROM Orders

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

SELECT * FROM OrderLine


--1--
SELECT 
m.FirstName+' '+m.LastName 'Faculty name' , p.Position ,p.YearlyMembershipFee/12 'Monthly due',c.CampusName
FROM Members m 
JOIN Position p ON m.PositionID=p.PositionID 
JOIN Campus c ON m.CampusID=c.CampusID
ORDER BY c.CampusName DESC,m.LastName asc 

--2--

SELECT fi.FoodItemName,p.MealType FROM FoodItems fi JOIN Prices p
ON fi.FoodItemTypeID = P.FoodItemTypeID 
WHERE p.MealType NOT LIKE '%Beer%' AND p.MealType NOT LIKE '%Wine%'
ORDER BY p.MealPrice ASC 

---3---

SELECT o.OrderID,o.OrderDate,m.FirstName+' '+m.LastName 'Name',c.CampusName , p.MealType,
p.MealPrice,ol.Quantity ,(p.MealPrice*ol.Quantity) 'Total Price'
FROM Orders o  
JOIN Members m ON o.MemberID=m.MemberID 
JOIN Campus c ON c.CampusID=m.CampusID
JOIN OrderLine ol ON o.OrderID=ol.OrderID
JOIN FoodItems fi ON fi.FoodItemID=ol.FoodItemsID
JOIN Prices p ON fi.FoodItemTypeID=p.FoodItemTypeID
ORDER BY OrderID DESC
