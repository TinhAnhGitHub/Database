CREATE DATABASE EBookstoreDB;

USE EBookstoreDB;

CREATE TABLE USER (
    username VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    phone_number VARCHAR(20),
    email VARCHAR(100),
    password VARCHAR(50)
);

CREATE TABLE CUSTOMER (
    username VARCHAR(50) PRIMARY KEY,
    address VARCHAR(255),
    bank_acc VARCHAR(50),
    FOREIGN KEY (username) REFERENCES USER(username)
);

CREATE TABLE EMPLOYEE (
    username VARCHAR(50) PRIMARY KEY,
    employee_id INT,
    FOREIGN KEY (username) REFERENCES USER(username)
);

CREATE TABLE AUTHOR (
    author_id INT PRIMARY KEY,
    name VARCHAR(100),
    dob DATE,
    biography TEXT
);

CREATE TABLE PUBLISHER (
    pu_id INT PRIMARY KEY,
    pu_name VARCHAR(100),
    pu_phone_number VARCHAR(50),
    pu_address VARCHAR(255)
);

CREATE TABLE BOOK (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    price DECIMAL(10,2), 
    author_id INT,
    pu_id INT,
    FOREIGN KEY (author_id) REFERENCES AUTHOR(author_id),
    FOREIGN KEY (pu_id) REFERENCES PUBLISHER(pu_id)
);

CREATE TABLE GENRE (
    gen_id INT PRIMARY KEY,
    genre_name VARCHAR(100),
    description TEXT
);

CREATE TABLE BOOK_GENRE (
    book_id INT,
    gen_id INT,
    PRIMARY KEY (book_id, gen_id),
    FOREIGN KEY (book_id) REFERENCES BOOK(book_id),
    FOREIGN KEY (gen_id) REFERENCES GENRE(gen_id)
);

CREATE TABLE `ORDER` (
    order_id INT PRIMARY KEY,
    order_time DATETIME,
    order_status ENUM('Pending', 'Processing', 'Completed', 'Cancelled', 'Failed'),
    username VARCHAR(50),
    FOREIGN KEY (username) REFERENCES CUSTOMER(username)
);

CREATE TABLE ORDER_BOOK (
    order_id INT,
    book_id INT,
    quantity INT,
    PRIMARY KEY (order_id, book_id),
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (order_id) REFERENCES `ORDER`(order_id),
    FOREIGN KEY (book_id) REFERENCES BOOK(book_id)
);

CREATE TABLE ORDER_PUBLISHER (
    pu_order_id INT PRIMARY KEY,
    pu_order_status ENUM('Success', 'Pending', 'Failed'),
    pu_order_time DATE,
    username VARCHAR(50),
    pu_id INT,
    FOREIGN KEY (username) REFERENCES EMPLOYEE(username),
    FOREIGN KEY (pu_id) REFERENCES PUBLISHER(pu_id)
);

CREATE TABLE ORDER_PUBLISHER_BOOK (
    book_id INT,
    pu_order_id INT,
    quantity INT,
    PRIMARY KEY (book_id, pu_order_id),
    FOREIGN KEY (book_id) REFERENCES BOOK(book_id),
    FOREIGN KEY (pu_order_id) REFERENCES ORDER_PUBLISHER(pu_order_id)
);
