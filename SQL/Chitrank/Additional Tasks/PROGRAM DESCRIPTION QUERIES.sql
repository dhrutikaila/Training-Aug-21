/*
1.Create a listing of all Faculty Members (First and Last), their Faculty Position and the University 
that they are affiliated with (Name), along with their Monthly_Dues (Calculated Field with a column alias).
Sort the records in descending order by University and then by Faculty's last name in ascending order. 
*/

SELECT m.FirstName, m.LastName, p.Position, c.CampusName, (p.YearlyMembershipFee / 12) [Monthly_Dues] 
FROM Members m, Position p, Campus c WHERE m.PositionID = p.PositionID AND     
m.CampusID = c.CampusID ORDER BY c.CampusName DESC, m.LastName ASC

/*
2.Create a listing that shows the various food items that the faculty club serves 
(Name of the food item, type of food item and the price of the food item). 
Note: List no alcoholic beverages. Sort the records in ascending order by price.
*/
SELECT FoodItemName, MealType, MealPrice FROM FoodItems fi, Prices p
WHERE fi.FoodItemTypeID = p.FoodItemTypeID AND    
MealType NOT LIKE '%Beer%' AND MealType NOT LIKE '%Wine%'
ORDER BY MealPrice ASC;


/*
3.List the OrderID, Order Date, Faculty Member's Name, Campus Name, each FoodItem that makes up a 
given order, the type of meal, cost of the meal, quantity ordered and the total line total 
(calculated field and column alias). Sort by Order IDs in descending order.
*/
SELECT o.OrderID, OrderDate, FirstName,
LastName, CampusName, FoodItemName, MealType, MealPrice, Quantity, (MealPrice * Quantity) Total
FROM Orders AS o,OrderLine AS ol,Members AS m,Campus AS c,Prices AS p,FoodItems AS fi
WHERE fi.FoodItemID = ol.FoodItemsID AND o.OrderID = ol.OrderID 
AND o.MemberID = m.MemberID AND m.CampusID = c.CampusID
AND p.FoodItemTypeID = fi.FoodItemTypeID
ORDER BY o.OrderID DESC;

