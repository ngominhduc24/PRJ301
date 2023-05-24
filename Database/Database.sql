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


