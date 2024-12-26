-----------------------------------------------------------------------
---------------------------* Hotel Project *---------------------------
-----------------------------------------------------------------------
Use Hotel
--------------------------------
Create Table Hotel
(
Hotel_ID int Primary Key,
Name varchar(40),
StarRate int,
Owner varchar(40),
Website varchar(100),
Contact_Num bigint,
Address varchar(50)
)
--------------------------------
Create Table Employee
(
Emp_ID int Primary Key identity(1,1),
Name varchar(40),
Position varchar(50),
Salary Money,
Hotel_ID int References Hotel(Hotel_ID)
)
--------------------------------
Create Table Emp_Serv
(
Emp_ID int,
Servicess_ID int,
Primary Key(Emp_ID,Servicess_ID),
Foreign Key (Emp_ID) References Employee(Emp_ID),
Foreign Key (Servicess_ID) References Servicess(Servicess_ID)
)
--------------------------------
Create Table Guest
(
Guest_ID int Primary Key identity(1,1),
Name varchar(50),
Age int,
Phone bigint,
Email varchar(40)
)
-- Adding Hotel_ID and set it as a foreign key
Alter Table Guest
 Add Hotel_ID int
Alter Table Guest
  Add Foreign Key(Hotel_ID) References Hotel(Hotel_ID)
--------------------------------
Create Table Booking
(
Booking_ID int Primary Key identity(1,1),
StartDate Date,
EndDate Date,
Confirmation varchar(10),
Billing_ID int, -- Added By Alter Add
Guest_Id int References Guest(Guest_ID)
)
Alter Table Booking
 Add Foreign Key(Billing_ID) References Billing(Billing_ID)
--------------------------------
Create Table Billing
(
Billing_ID int Primary Key identity(1,1),
Amount Money,
Date Date,
Pay_Method varchar(40)
)
--------------------------------
Create Table Servicess
(
Servicess_ID int Primary Key identity(1,1),
Name varchar(50),
Price Money,
Billing_ID int References Billing(Billing_ID)
)
--------------------------------
Create Table Room
(
Room_No int Primary Key identity(1,1),
Type_ varchar(20),
Availabilityy Varchar(30),
Price Money,
Guest_ID int References Guest(Guest_ID)
)
-- Adding Hotel_ID and set it as a foreign key
Alter Table Room
 Add Hotel_ID int
Alter Table Room
  Add Foreign Key(Hotel_ID) References Hotel(Hotel_ID)
--------------------------------
Create Table Room_Services
(
Room_No int,
Servicess_ID int,
Primary Key(Room_No,Servicess_ID),
Foreign Key(Room_No) References Room(Room_No),
Foreign Key(Servicess_ID) References Servicess(Servicess_ID)
)
-----------------------------------------------------------------------
---------------------------* Adding Data *---------------------------
-----------------------------------------------------------------------


-- Here i inserted data using code(Insert Into) and the other data i inserted it from the table directly using(edit rows)
Insert Into Hotel
            Values(100,'Crystal Castle',5,'Abdelrahman Sorour','crystalcastle.com',01030551431,'Eldokky')

Insert Into Employee 
            Values('Ahmed Said','Chef',10000,100),
			      ('Maher Mohamed','Security',15000,100),
				  ('Mahmoud Samy','Room Cleaning',10000,100),
				  ('Mustafa Ezz','Server',10000,100)

-- Try to select some data
Select*
From Guest

-- Try to select with condition
Select*
From Guest G
Where G.Name = 'Abdelrahman Ahmed'

-- Try to select specific data
Select G.Name, G.Age, G.Phone
From Guest G

-- Try to update data
Update Billing
Set Amount = 2000
Where Amount = 2500

-- if i want to drop table (Example) ---> Drop Table Billing

