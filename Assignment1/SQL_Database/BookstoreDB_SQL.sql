DROP DATABASE IF EXISTS EBookstoreDB;
CREATE DATABASE EBookstoreDB;

USE EBookstoreDB;
CREATE TABLE USER (
		Username VARCHAR(50) PRIMARY KEY,
        Name varchar(100),
        Phone_Number varchar(20),
        Email varchar(100),
		Passwords varchar(50)
);

create table CUSTOMER(
	Username varchar(50) primary key,
    address varchar(255),
    bank_account varchar(50),
    foreign key (Username) references USER(Username)
);

create table EMPLOYEE (
	Username VARCHAR(50) PRIMARY KEY,
    Employee_Id VARCHAR(20),
    FOREIGN KEY (username) REFERENCES USER(username)
);

create table AUTHOR(
	Author_Id INT PRIMARY KEY,
    name VARCHAR(100),
    Dob DATE,
    biography TEXT
);

create table PUBLISHER(
	Publisher_Id INT primary key,
    Name VARCHAR(100),
    Phone_Number VARCHAR(50),
    Address VARCHAR(255)
);

create table BOOK(
	Book_Id INT primary key,
    Title VARCHAR(255),
    Price DECIMAL(10,2), 
	Author_Id INT,
    Publisher_Id INT,
    foreign key (Author_Id) References AUTHOR(Author_Id),
    foreign key (Publisher_Id) references PUBLISHER(Publisher_Id)
);

create table GENRE(
	Genre_Id INT primary key,
    genre_name VARCHAR(100),
    Description TEXT
);

create table BOOK_GENRE(
	Book_Id int,
    Genre_Id int,
    primary key (Book_Id, Genre_Id),
    foreign key (Book_Id) references BOOK(Book_Id),
    foreign key (Genre_Id) references GENRE(Genre_Id)
);

create table CUSTOMER_ORDER(
	Order_Id int primary key,
    Username VARCHAR(50),
    foreign key (Username) references CUSTOMER(Username)
);

create table ORDER_BOOK(
	Order_Id int,
    Book_Id int,
    Order_Status ENUM('Success', 'Pending' , 'Failed'), -- Dieu chinh sau --
    Order_Time DATETIME,
    Quantity int,
    Primary key (Order_Id, Book_Id),
	foreign key (Order_Id) references CUSTOMER_ORDER(Order_Id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
    foreign key (Book_Id) references BOOK(Book_Id)
);

create table ORDER_PUBLISHER(
	Order_Publisher_Id  int primary key,
    Order_Publisher_Status ENUM('Success', 'Pending' , 'Failed'), -- Dieu chinh sau --
    Order_Publisher_Time DATETIME,
    Username VARCHAR(50),
    Publisher_Id int,
	FOREIGN KEY (Username) REFERENCES EMPLOYEE(Username),
    FOREIGN KEY (Publisher_Id) REFERENCES PUBLISHER(Publisher_Id)
);


CREATE TABLE ORDER_PUBLISHER_BOOK (
    Order_Publisher_Id INT,
    Book_Id INT,
    Quantity INT,
    PRIMARY KEY (Order_Publisher_Id, Book_Id),
    FOREIGN KEY (Order_Publisher_Id) REFERENCES ORDER_PUBLISHER(Order_Publisher_Id),
    FOREIGN KEY (Book_Id) REFERENCES BOOK(Book_Id)
);









