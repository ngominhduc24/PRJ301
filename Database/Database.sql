-- Detele database (execute this many times until it complete)
-- DECLARE @sql NVARCHAR(MAX) = '';

-- -- Generate DROP TABLE statements for all tables
-- SELECT @sql += 'DROP TABLE ' + QUOTENAME(name) + ';' 
-- FROM sys.tables;

-- -- Execute the generated SQL statement
-- EXEC sp_executesql @sql;

CREATE DATABASE prj301
GO

use prj301
GO

create table Account (
    AccountID int IDENTITY(1,1) primary key,
    Email varchar(50) not null unique,
    Password varchar(50) not null,
    Name varchar(50) not null,
    Phone varchar(50) not null,
    Address varchar(50),
    Role int not null -- 1: admin, 2: user, 3:staff
);
GO

create table Orders (
    OrderID int IDENTITY(1,1) primary key,
    AccountID int not null,
    OrderDate date not null,
    Address varchar(50) not null,
	TotalPrice int not null,
    Status int not null, -- 1: Completed, 2: processing, 0: Cancelled 
    foreign key (AccountID) references Account(AccountID)
);
GO

create table Category (
    CategoryID int IDENTITY(1,1) primary key,
    Name varchar(50) not NULL,
    Image varchar(500),
);
GO

create table Product (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    Name varchar(50) not null,
    Price int not null,
    Description varchar(50) not null,
    Image varchar(500),
    CategoryID int not null,
	Status int not null DEFAULT 1, -- 0 delete -- 1: available, 2: not available
    foreign key (CategoryID) references Category(CategoryID)
);
GO

create table OrderDetail (
    OrderID int not null,
    ProductID int not null,
    Quantity int not null
    foreign key (OrderID) references Orders(OrderID),
    foreign key (ProductID) references Product(ProductID),
    primary key (OrderID, ProductID)
);
GO

--------------------------- Insert data ---------------------------

-- account
insert into Account values ('duc@gmail.com', '1', 'minh duc', '0124727283', 'Ha Dong, Ha Noi', 2);
insert into Account values ('long@abc.com', '123456', 'viet long', '0199928372', 'Nam Tu Liem, Ha Noi', 2);
insert into Account values ('dung@fu.com', '123456', 'thi dung', '0123456789', '', 2);
insert into Account values ('admin', '1', 'admin', '0123456789', '', 1);

-- category
insert into Category values ( 'Chicken', 'https://www.lotteria.vn/media/catalog/tmp/category/BG-Menu-Chicken-01-01_2.jpg');
insert into Category values ('Burger', 'https://www.lotteria.vn/media/catalog/tmp/category/BG_New-02_4.jpg');
insert into Category values ( 'Pizza', 'https://www.lotteria.vn/media/catalog/tmp/category/BG_New-10_1.jpg');
insert into Category values ( 'Drink', '	https://www.lotteria.vn/media/catalog/tmp/category/Promotion-10_2.jpg');
insert into Category values ( 'Combo', '	https://www.lotteria.vn/media/catalog/tmp/category/BG_New-05_1.jpg');

-- type 1: Chicken
insert into Product values ('Mala Chicken', 40, 'Chicken made by Mala', 'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/cache/2e1628f5f7131a9eb328ec1fb2c22fd3/p/a/pack_loking_set_2.png', 1, 1);
insert into Product values ('Mala Family', 100, 'Combo 3 Pcs Mala Chicken', 'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/cache/2e1628f5f7131a9eb328ec1fb2c22fd3/c/h/chicken_ga_tuyet_vang.png', 1, 1);
insert into Product values ('Chicken Cheese', 40, 'No description', 'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/cache/2e1628f5f7131a9eb328ec1fb2c22fd3/c/k/ck_set_milkis.png', 1, 1);
insert into Product values ('Cheese Family', 40, 'Combo 6Pcs Chicken Cheese', 'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/cache/2e1628f5f7131a9eb328ec1fb2c22fd3/m/i/milkis_-_c.thu_n_99.png', 1, 1);
insert into Product values ('Grilled Chicken', 40, 'No description', 'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/cache/2e1628f5f7131a9eb328ec1fb2c22fd3/d/e/dessert-534x374px_squid-ring_2.png', 1, 1);

-- type 2: Burger
insert into Product values ('Beef Burger', 33, 'No description', 'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/cache/2e1628f5f7131a9eb328ec1fb2c22fd3/d/e/dessert-534x374px_chicken-skewer_2.png', 2, 1);
insert into Product values ('Fish Burger', 40, 'No description', 'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/cache/2e1628f5f7131a9eb328ec1fb2c22fd3/v/a/value_mozzarella_1.png', 2, 1);
insert into Product values ('Shrimp Burger', 48, 'No description', 'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/cache/2e1628f5f7131a9eb328ec1fb2c22fd3/v/a/value_fish_5.png', 2, 1);

-- type 3: Pizza
insert into Product values ('Pepperoni Pizza', 40, 'No description', 'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/cache/2e1628f5f7131a9eb328ec1fb2c22fd3/b/u/burger_beef-01_1.png', 3, 1);
insert into Product values ( 'Cheese Pizza', 40, 'No description', 'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/cache/2e1628f5f7131a9eb328ec1fb2c22fd3/b/u/burger_fish-burger_2.png', 3, 1);
insert into Product values ( 'Seafood Pizza', 40, 'No description', 'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/cache/2e1628f5f7131a9eb328ec1fb2c22fd3/r/_/r_s_com-gasotdau.png', 3, 1);

-- type 4: Drink
insert into Product values ( 'Coca Cola', 10, 'No description', 'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/cache/2e1628f5f7131a9eb328ec1fb2c22fd3/r/i/rice-spaghetti-534x374px._miy-thitbo_2.png', 4, 1);
insert into Product values ( 'Pepsi', 10, 'No description', 'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/cache/2e1628f5f7131a9eb328ec1fb2c22fd3/z/e/zero_1.jpg', 4, 1);
insert into Product values ( '7Up', 10, 'No description', 'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/cache/2e1628f5f7131a9eb328ec1fb2c22fd3/z/e/zero.jpg', 4, 1);

-- type 5: Combo
insert into Product values ( 'LChicken Combo', 80, '01 LChicken Burger - 01 Fried Fries', 'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/cache/2e1628f5f7131a9eb328ec1fb2c22fd3/p/a/pack_loking_set_2.png', 5, 1);
insert into Product values ( 'Beef Combo', 49, '01 LChicken Burger - 01 Fried Fries', 'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/cache/2e1628f5f7131a9eb328ec1fb2c22fd3/p/a/pack_loking_set_2.png', 5, 1);
insert into Product values ( 'Fish Combo', 66, 'Fish Combo', 'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/cache/2e1628f5f7131a9eb328ec1fb2c22fd3/p/a/pack_loking_set_2.png', 5, 1);

-- order
insert into Orders values (1, '2023-12-12', 'Ha Dong, Ha Noi', 300, 1);

-- OrderDetail
insert into OrderDetail values (1, 1, 2);
insert into OrderDetail values (1, 5, 2);
insert into OrderDetail values (1, 11, 1);