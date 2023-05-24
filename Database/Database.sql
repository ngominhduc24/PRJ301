if exists (select * from sys.databases where name = 'prj192')
    drop database prj192
GO

create database prj192
GO

use prj192
GO

create table Account (
    AccountID int IDENTITY(1,1) primary key,
    Email varchar(50) not null,
    Password varchar(50) not null,
    Name varchar(50) not null,
    Phone varchar(50) not null,
    Address varchar(50),
    Role int not null -- 1: admin, 2: user
);
GO

create table Orders (
    OrderID int not null primary key,
    AccountID int not null,
    OrderDate date not null,
    Address varchar(50) not null,
    Status int not null, -- 1: processing, 2: shipping, 3: delivered 
    foreign key (AccountID) references Account(AccountID)
);
GO

create table Category (
    CategoryID int not null primary key,
    Name varchar(50) not null
);
GO

create table Product (
    ProductID int not null primary key,
    Name varchar(50) not null,
    Price int not null,
    Description varchar(50) not null,
    Image varchar(50) not null,
    CategoryID int not null,
    foreign key (CategoryID) references Category(CategoryID)
);
GO

create table OrderDetail (
    OrderID int not null,
    ProductID int not null,
    Quantity int not null,
    Price int not null,
    foreign key (OrderID) references Orders(OrderID),
    foreign key (ProductID) references Product(ProductID),
    primary key (OrderID, ProductID)
);
GO

--------------------------- Insert data ---------------------------

-- account
insert into Account values ('duc@gmail.com', '1', 'minh duc', '0124727283', 'Ha Dong, Ha Noi', 1);
insert into Account values ('long@abc.com', '123456', 'viet long', '0199928372', 'Nam Tu Liem, Ha Noi', 2);
insert into Account values ('dung@fu.com', '123456', 'thi dung', '0123456789', '', 2);
insert into Account values ('admin', '1', 'admin', '0123456789', '', 1);

-- category
insert into Category values (1, 'Chicken');
insert into Category values (2, 'Burger');
insert into Category values (3, 'Pizza');
insert into Category values (4, 'Drink');
insert into Category values (5, 'Combo');

-- type 1: Chicken
insert into Product values (1, 'Mala Chicken', 40, 'Chicken made by Mala', 'chicken_burger.jpg', 1);
insert into Product values (2, 'Mala Family (3Pcs)', 100, 'Combo 3 Pcs Mala Chicken', 'chicken_burger.jpg', 1);
insert into Product values (3, 'Chicken Cheese', 40, '', 'Chicken_burger.jpg', 1);
insert into Product values (4, 'Cheese Family (6Pcs)', 40, 'Combo 6Pcs Chicken Cheese', 'chicken_burger.jpg', 1);
insert into Product values (5, 'Grilled Chicken', 40, '', 'Chicken_burger.jpg', 1);

-- type 2: Burger
insert into Product values (6, 'Beef Burger', 33, '', 'burger.jpg', 2);
insert into Product values (7, 'Fish Burger', 40, '', 'burger.jpg', 2);
insert into Product values (8, 'Shrimp Burger', 48, '', 'burger.jpg', 2);

-- type 3: Pizza
insert into Product values (9, 'Pepperoni Pizza', 40, '', 'pizza.jpg', 3);
insert into Product values (10, 'Cheese Pizza', 40, '', 'pizza.jpg', 3);
insert into Product values (11, 'Seafood Pizza', 40, '', 'pizza.jpg', 3);

-- type 4: Drink
insert into Product values (12, 'Coca Cola', 10, '', 'drink.jpg', 4);
insert into Product values (13, 'Pepsi', 10, '', 'drink.jpg', 4);
insert into Product values (14, '7Up', 10, '', 'drink.jpg', 4);

-- type 5: Combo
insert into Product values (15, 'LChicken Combo', 80, '01 LChicken Burger\n01 Fried Fries', 'combo.jpg', 5);
insert into Product values (16, 'Beef Combo', 49, '01 LChicken Burger\n01 Fried Fries', 'combo.jpg', 5);
insert into Product values (17, 'Fish Combo', 66, 'Fish Combo', 'combo.jpg', 5);

-- order
insert into Orders values (1, 1, '2023-12-12', 'Ha Dong, Ha Noi', 3);

-- OrderDetail
insert into OrderDetail values (1, 1, 2, 80);
insert into OrderDetail values (1, 5, 2, 80);
insert into OrderDetail values (1, 11, 1, 10);