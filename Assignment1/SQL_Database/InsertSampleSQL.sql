USE ebookstoredb;

INSERT INTO USER(username, name, phone_number, email, password) VALUES
('johnDoe', 'John Doe', '+43 1 716130', 'john.doe@gmail.com', 'pass123'),
('janeSmith', 'Jane Smith', '+43 1 123456', 'jane.smith@gmail.com', 'pass123'),
('robertBrown', 'Robert Brown', '+32 2 287 62 11', 'james.bon@gmail.com', 'pass123'),
('lisaJones', 'Lisa Jones', '+15559870123', 'lisa.blue@gmail.com', 'pass123'),
('employee1', 'David Lee', '+15551112222', 'david.lee@ebookstore.com', 'pass123'),
('employee2', 'Maria Garcia', '+15554445555', 'maria.garcia@ebookstore.com', 'emp_pass2');


INSERT INTO CUSTOMER (username, address, bank_acc) VALUES
('johnDoe', '123 Main St, Anytown, USA', 'ACC1234567890'),
('janeSmith', '456 Oak Ave, Anycity, USA', 'ACC9876543210'),
('robertBrown', '789 Pine St, Anytown, USA', 'ACC4567890123'),
('lisaJones', '101 Elm Ave, Anycity, USA', 'ACC7890123456');

INSERT INTO EMPLOYEE (username, employee_id) VALUES
('employee1', 1),
('employee2', 2);



-- Inserting authors with different birth dates and biographies

INSERT INTO AUTHOR (author_id, name, dob, biography) VALUES
(1, 'Stephen King', '1947-09-21', 'A prolific author of horror and suspense.'),
(2, 'Jane Austen', '1775-12-16', 'Known for her social commentary and wit.'),
(3, 'Agatha Christie', '1890-09-15', 'Queen of mystery novels.'),
(4, 'J.R.R. Tolkien', '1892-01-03', 'Author of The Lord of the Rings.');


-- Inserting publishers with varied information
INSERT INTO PUBLISHER (pu_id, pu_name, pu_phone_number, pu_address) VALUES
(1, 'Penguin Random House', '+15551112233', 'New York, NY'),
(2, 'Hachette Book Group', '+15551112244', 'New York, NY'),
(3, 'HarperCollins', '+15551112255', 'New York, NY'),
(4, 'Simon & Schuster', '+15551112266', 'New York, NY');


-- BOOKS 
INSERT INTO BOOK (book_id, title, price, author_id, pu_id) VALUES
(1, 'The Shining', 19.99, 1, 1),
(2, 'Pride and Prejudice', 9.99, 2, 2), 
(3, 'And Then There Were None', 12.99, 3, 3),
(4, 'The Hobbit', 14.99, 4, 4);


INSERT INTO GENRE (gen_id, genre_name, description) VALUES
(1, 'Horror', 'Fiction with scary themes.'),
(2, 'Romance', 'Stories about love and relationships.'),
(3, 'Mystery', 'Stories with puzzling crimes.'),
(4, 'Fantasy', 'Imaginative worlds and creatures.');


INSERT INTO BOOK_GENRE (book_id, gen_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);


INSERT INTO `ORDER` (order_id, order_time, order_status, username) VALUES
(1, '2024-10-05 10:00:00', 'Completed', 'johnDoe'),
(2, '2024-10-06 12:30:00', 'Pending', 'janeSmith'),
(3, '2024-10-05 14:00:00', 'Processing', 'robertBrown'),
(4, '2024-10-06 16:30:00', 'Cancelled', 'lisaJones');


INSERT INTO ORDER_BOOK (order_id, book_id, quantity) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 1);

INSERT INTO ORDER_PUBLISHER (pu_order_id, pu_order_status, pu_order_time, username, pu_id) VALUES
(1, 'Success', '2024-10-01', 'employee1', 1),
(2, 'Pending', '2024-10-02', 'employee2', 2);

INSERT INTO ORDER_PUBLISHER_BOOK (book_id, pu_order_id, quantity) VALUES
(1, 1, 100),
(2, 2, 50);





