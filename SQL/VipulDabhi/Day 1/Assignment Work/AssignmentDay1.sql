--!**!Assignment Query!**!

--You have been hired to create a relational database to support a car sales business. 
--You need to store information on the business’s employees, inventory, and completed sales. 
--You also need to account for the fact that each salesperson receives a different percentage 
--of their sales in commission. What tables and columns would you create in your relational database, 
--and how would you link the tables?

CREATE TABLE SalesPerson(
			EmployeeId INT NOT NULL PRIMARY KEY,
			EmployeeName VARCHAR(100),
			Commission INT NOT NULL);
CREATE TABLE CarsDetails(
			ModelId INT NOT NULL PRIMARY KEY,
            EmployeeId INT NOT NULL,
            Price INT NOT NULL ,
			FOREIGN KEY(EmployeeId) REFERENCES SalesPerson(EmployeeId));
			
CREATE TABLE Total_sales( 
		 	 ModelId INT NOT NULL,
             Price INT NOT NULL,
			 Sold INT NOT NULL,
			 FOREIGN KEY(Sold) REFERENCES SalesPerson(EmployeeId),
			 FOREIGN KEY(ModelId)REFERENCES CarsDetails(ModelId));
