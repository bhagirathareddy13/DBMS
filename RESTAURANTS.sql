CREATE DATABASE Restaurants


CREATE TABLE Restaurant
(
    RID INT PRIMARY KEY,
    RName VARCHAR(100) NOT NULL,
    Contact BIGINT NOT NULL UNIQUE,
    Address VARCHAR(200) NOT NULL,
    Rating DECIMAL(2,1) CHECK (Rating BETWEEN 0 AND 5),
    Type VARCHAR(50) NOT NULL
)

INSERT INTO Restaurant VALUES
(101, 'Indian Accent', 9876501234, 'Delhi', 4.7, 'Indian'),
(102, 'Royal Andhra', 8398934933, 'Vijayawada', 4.3, 'Andhra'),
(103, 'Tasty Hub', 8116538455, 'Chennai', 4.5, 'Chinese'),
(104, 'Karavalli', 6782642824, 'Bangalore', 4.8, 'Vegetarian'),
(105, 'Food Palace', 8743268746, 'Mumbai', 4.6, 'Fast Food')


CREATE TABLE Customer
(
    CID INT PRIMARY KEY,
    CName VARCHAR(100) NOT NULL,
    Mobile BIGINT NOT NULL UNIQUE,
    Email VARCHAR(100) UNIQUE,
    Address VARCHAR(200) NOT NULL
)

INSERT INTO Customer VALUES
(201, 'Bhagi', 9876012345, 'reddy0055@gmail.com', 'Hyderabad'),
(202, 'Sneha', 9123456781, 'sneha2293@gmail.com', 'Vijayawada'),
(203, 'Joga', 9865012345, 'joganandha1918@gmail.com', 'Koilkuntla'),
(204, 'Madhu', 9654321078, 'madhu1998@gmail.com', 'Mumbai'),
(205, 'Priya', 9476501234, 'priyanka3345@gmail.com', 'Bangalore'),
(206, 'Princy', 9112345678, 'princy122007@gmail.com', 'Delhi'),
(207, 'Nandhu', 6305012345, 'nandini3110@gmail.com', 'Pune'),
(208, 'NTR', 9823012345, 'ntr2005@gmail.com', 'Chennai'),
(209, 'Nikhil', 7386012345, 'nikhil9999@gmail.com', 'Hyderabad'),
(210, 'Divya', 9440012345, 'divyareddy6666@gmail.com', 'Bangalore')

CREATE TABLE Payment
(
    PID INT PRIMARY KEY,
    Amount DECIMAL(10,2) NOT NULL CHECK (Amount > 0),
    Type VARCHAR(30) NOT NULL,
    Date DATE NOT NULL,
    Discount DECIMAL(5,2) DEFAULT 0 CHECK (Discount BETWEEN 0 AND 100)
)

INSERT INTO Payment VALUES
(501, 750.00, 'UPI',  '2026-01-15', 5.00),
(502, 1350.00, 'Card', '2026-02-20', 10.00),
(503, 600.00, 'Cash', '2026-03-12', 0.00),
(504, 1750.00, 'UPI', '2026-04-18', 15.00),
(505, 920.00, 'Card', '2026-05-25', 5.00),
(506, 680.00, 'Cash', '2026-06-10', 10.00),
(507, 2100.00, 'UPI', '2026-07-05', 20.00),
(508, 500.00, 'Card', '2026-07-22', 0.00),
(509, 1150.00, 'UPI', '2026-08-03', 10.00),
(510, 850.00, 'Cash', '2026-08-10', 5.00)

CREATE TABLE Food
(
    FID INT PRIMARY KEY,
    FName VARCHAR(100) NOT NULL,
    Type VARCHAR(50) NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity >= 0),
    Price DECIMAL(10,2) NOT NULL CHECK (Price > 0)
)

INSERT INTO Food VALUES
(301, 'Mutton Biryani', 'Non-Veg', 30, 399.00),
(302, 'Veg Biryani', 'Veg', 45, 190.00),
(303, 'Chicken Noodles', 'Non-Veg', 35, 170.00),
(304, 'Veg Fried Rice', 'Veg', 40, 140.00),
(305, 'Mutton Curry', 'Non-Veg', 25, 320.00),
(306, 'Chicken Tikka', 'Non-Veg', 30, 240.00),
(307, 'Idli Sambar', 'Veg', 55, 90.00),
(308, 'Paneer Butter Masala', 'Veg', 28, 210.00),
(309, 'Veg Pizza', 'Veg', 35, 180.00),
(310, 'Chicken Pizza', 'Non-Veg', 30, 230.00)

CREATE TABLE Staff
(
    SID INT PRIMARY KEY,
    SName VARCHAR(100) NOT NULL,
    Order_Count INT DEFAULT 0 CHECK (Order_Count >= 0),
    Rating DECIMAL(2,1) CHECK (Rating BETWEEN 0 AND 5),
    Position VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL
)

INSERT INTO Staff VALUES
(401, 'Ramesh', 130, 4.6, 'Manager', 30000),
(402, 'Ganesh', 100, 4.3, 'Chef', 25000),
(403, 'Manoj', 115, 4.5, 'Waiter', 22000),
(404, 'Ajay', 85, 4.1, 'Cashier', 20000),
(405, 'Vijay', 105, 4.4, 'Chef', 25000)


SELECT * FROM Restaurant
SELECT * FROM Customer
SELECT * FROM Payment
SELECT * FROM Food
SELECT * FROM Staff


1.
UPDATE Restaurant
SET Address = 'Hyderabad'
WHERE RID = 101
SELECT * FROM Restaurant
WHERE RID = 101
101	Indian Accent	9876501234	Hyderabad	4.7	Indian


2.
UPDATE Restaurant
SET Rating = 4.5
WHERE RName = 'Royal Andhra'
SELECT * FROM Restaurant
WHERE RName = 'Royal Andhra'
102	Royal Andhra	8398934933	Vijayawada	4.5	Andhra


3.
UPDATE Customer
SET Email = 'bhagi1303@gmail.com',
    Address = 'Tirupati'
WHERE CName = 'Bhagi'
SELECT * FROM Customer
WHERE CName = 'Bhagi'
201	Bhagi	9876012345	bhagi1303@gmail.com	Tirupati


4.
UPDATE Food
SET Quantity = 50
WHERE FID = 305 OR Price = 399
SELECT * FROM Food
WHERE FID = 305 OR Price = 399
301	Mutton Biryani	Non-Veg	50	399.00
305	Mutton Curry	Non-Veg	50	320.00


5.
UPDATE Payment
SET Discount = 15.00 WHERE PID = 501
SELECT * FROM Payment
WHERE PID = 501
501	750.00	UPI	2026-01-15	15.00


6.
update Food
set Type = 'Fast Food' where FName = 'Veg Pizza'
select * from Food
where FName = 'Veg Pizza'
309	Veg Pizza	Fast Food	35	180.00


7.
delete from Payment
where PID = 505 AND Type = 'Card'
select * from Payment

8.
delete from Food
where FName='Chicken Noodles'
select * from Food

9.
delete from Staff
where SName='Ganesh' and Rating < 4.4
select * from Staff

10.
update Restaurant
set Type = 'Non Veg' where RID = 104
select * from Restaurant
where RID = 104
104	Karavalli	6782642824	Bangalore	4.8	Non Veg

11.
select * from Restaurant
where Type = 'Indian'
101	Indian Accent	9876501234	Hyderabad	4.7	Indian

12.
select Contact from Restaurant
where Address = 'Bangalore'
6782642824

13.
select * from Restaurant
where Rating = 4.5
102	Royal Andhra	8398934933	Vijayawada	4.5	Andhra
103	Tasty Hub	8116538455	Chennai	4.5	Chinese


14.
select Email  from Customer
where CID = 210
divyareddy6666@gmail.com


15.
select Price from Food
where Quantity = 50
399.00
320.00

16.
select * from Food
where Type = 'Non-Veg' and Price > 299
301	Mutton Biryani	Non-Veg	50	399.00
305	Mutton Curry	Non-Veg	50	320.00

17.
select Type from Payment
where PID = 508
Ans : Card

18.
update Staff
set Salary = 29000 where Rating > 4.4 AND Order_Count > 100
select * from Staff
where Rating > 4.4 AND Order_Count > 100
401	Ramesh	130	4.6	Manager	29000.00
403	Manoj	115	4.5	Waiter	29000.00


19.
delete from Staff
where Order_Count<100 or Rating < 4.3
select * from Staff
401	Ramesh	130	4.6	Manager
403	Manoj	115	4.5	Waiter
405	Vijay	105	4.4	Chef

20.
update Payment
set Amount = 1100, Discount = 20.00
where PID = 509
select * from Payment
509	1100.00	UPI	2026-08-03	20.00