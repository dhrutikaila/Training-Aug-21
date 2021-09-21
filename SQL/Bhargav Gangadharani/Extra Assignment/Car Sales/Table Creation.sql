

create table Car
(
	Car_ID INT ,
	VIN int PRIMARY KEY,
	Make varchar(50),
	Model varchar(50),
	Year numeric(4),
	Mileage numeric(3),
	Ask_Price money,
	Invoice_Price money,
)

create table Dealership 
(
	Dealership_ID INT PRIMARY KEY,
	Name varchar(30),
	Address varchar(50),
	City char(25),
	State char(25),
)

create table SalesPerson  
(
	SalesPerson_ID INT PRIMARY KEY,
	Name varchar(15),
)

create table Customer  
(
	Customer_ID INT PRIMARY KEY,
	Name varchar(15),
	Address varchar(50),
	City char(25),
	State char(25),
)

create table ReportsTO   
(
	Reports_to_ID INT PRIMARY KEY,
	SalesPerson_ID int foreign key references salesperson(SalesPerson_ID) ,
	ManagingSalesPerson_ID int,
)

create table WorksAT    
(
	WorksAT_ID INT PRIMARY KEY,
	SalesPerson_ID int foreign key references salesperson(SalesPerson_ID),
	Dealership_ID int foreign key references dealership(Dealership_ID),
	Month_Worked numeric(3),
	BaseSalary_for_Month money 
)

create table Inventory    
(
	Inventory_ID int PRIMARY KEY,
	VIN int foreign key references car(vin),
	Dealership_ID int foreign key references dealership(Dealership_ID),
)

create table Sale    
(
	Sale_ID INT PRIMARY KEY,
	VIN int foreign key references Car(VIN),
	Customer_ID int foreign key references Customer(Customer_ID),
	SalesPerson_ID int foreign key references salesperson(SalesPerson_ID),
	Dealership_ID int foreign key references dealership(Dealership_ID),
	SalePrice money,
	SaleDate date,
)

insert into Car values (001,1001,'honda','city',2021,20,1700000,1500000),
					   (002,1002,'BMW','X1',2020,18,4000000,3700000),
					   (003,1003,'AUDI','Q3',2018,17,6500000,8000000),
					   (004,1004,'BMW','X5',2021,15,7500000,6000000),
					   (005,1005,'AUDI','Q5',2021,15,10000000,8000000),
					   (006,1006,'Hyundai','Verna',2021,15,1700000,1500000),
					   (007,1007,'Toyota','Camry',2021,20,2500000,2300000)


insert into Dealership values(101,'Landmark Honda','Thaltej','Ahmedabad','Gujarat'),
						     (102,'Gallops Auto','Vastrapur','Ahmedabad','Gujarat'),
							 (103,'AUDI Mumbai','Malad','Mumbai','Maharastra'),
							 (104,'Concept Hyundai','Raopura','Vadodara','Gujarat'),
							 (105, 'Toyota Performance', 'Malad','Mumbai','Maharastra')

insert into SalesPerson  values (201,'Zyan'),
							    (202,'Aakash'),
								(203,'Chirag'),
								(204,'Prashant'),
								(205,'Joel')

insert into Customer  values (301,'Sam','Thaltej','Ahmedabad','Gujarat'),
							 (302,'Anup','Varachha','Surat','Gujarat'),
							 (303,'Nikhil','Dr Yagnik road','Rajkot','Gujarat'),
							 (304,'Roy','Raopura','Vadodara','Gujarat'),
							 (305,'Vivek','Malad','Mumbai','Maharashtra'),
							 (306,'Josheph','Thaltej','Ahmedabad','Gujarat'),
							 (307,'Mukesh','Varachha','Surat','Gujarat'),
							 (308,'Kishan','Dr Yagnik road','Rajkot','Gujarat'),
							 (309,'Gaurav','Akota','Vadodara','Gujarat'),
							 (310,'Amit','Malad','Mumbai','Maharashtra')

insert into ReportsTO  values(401,201,null),
							 (402,202,201),
							 (403,203,201),
							 (404,204,203),
							 (405,205,204)


insert into WorksAT values(901,201,101,6,15000),
							(902,202,102,7,18000),
							(903,203,103,12,30000),
							(904,204,104,05,22000),
							(905,205,101,3,20000)

insert into Inventory  values (601,1001,101),
							  (602,1002,102),
							  (603,1003,103),
							  (604,1004,102),
							  (605,1005,103),
							  (606,1006,104),
							  (607,1007,105)

insert into Sale values(1101,1001,301,201,101,1700000,'2021/02/12'),
					   (1102,1002,302,202,102,4000000,'2021/02/22'),
					   (1103,1003,303,203,103,6500000,'2021/09/07'),
					   (1104,1004,304,204,102,7500000,'2021/12/09'),
					   (1105,1005,305,205,103,10000000,'2021/10/21'),
					   (1106,1006,306,201,104,1700000,'2021/07/22'),
					   (1107,1001,307,202,101,1700000,'2021/01/27'),
					   (1108,1002,308,203,102,4000000,'2021/08/22'),
					   (1109,1003,309,204,103,6500000,'2021/09/03'),
					   (1110,1004,310,205,102,7500000,'2021/12/24')
					   