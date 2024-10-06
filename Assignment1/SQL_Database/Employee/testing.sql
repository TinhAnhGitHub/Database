USE ebookstoredb;
SELECT * FROM BOOK;

INSERT INTO BOOK (book_id, title, price, author_id, pu_id) 
VALUES (5, 'Harry Potter', 24.99, 1, 1);
UPDATE BOOK SET price = 25.99 WHERE book_id = 5;
SELECT * FROM BOOK;
DELETE FROM BOOK WHERE book_id = 5;


SELECT * FROM `ORDER`;
DELETE FROM `ORDER` WHERE order_id = 1;  -- cannot delete order, only admin can
UPDATE `ORDER` SET order_status = 'Processing' WHERE order_id = 2;


SELECT * FROM ORDER_PUBLISHER;
INSERT INTO ORDER_PUBLISHER (pu_order_id, pu_order_status, pu_order_time, username, pu_id)
VALUES (3, 'Pending', CURDATE(), 'employee1', 3);