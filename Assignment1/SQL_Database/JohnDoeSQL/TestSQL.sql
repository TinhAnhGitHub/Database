USE ebookstoredb;

/*
   member role privileges
   - Có ít quyền hơn những thg như admin hoặc employee. Member chỉ đc các quyền sau đây:
	- Được coi danh sách boook, genre, tác giả, và nhà xuất bản, và chỉ được coi
    - Được một số quyền liên quan tới điều chỉnh danh sách USER
        - Được update bank_acc và địa chỉ nhà
        - Chỉ được coi username và password]
        - có thể update name, phone_number, và email
	- Được coi orders, và thêm orders. Trong orders thì được chọn sách để thêm.
    
    Nói chung là Member được hưởng các quyền trên, nhưng ko được làm một số thứ. VD: thay đổi thông tin sách, 
    tác giả, nhà xb, và sau này thì ko đc coi thông tin cá nhân của customer ìnfo và order.
    Hiện tại vẫn view đc thông tin toàn USER;
    
*/

SELECT * FROM BOOK;
SELECT * FROM CUSTOMER;
SELECT * FROM GENRE;
SELECT * FROM AUTHOR;
SELECT * FROM PUBLISHER;
UPDATE CUSTOMER SET address = '124 Updated Main St, Anytown, USA' WHERE username = 'johnDoe';
SELECT * FROM `ORDER` WHERE LOWER(username) = LOWER('johnDoe');
INSERT INTO `ORDER` (order_id, order_time, order_status, username) VALUES (5, NOW(), 'Pending', 'johnDoe');
SELECT * FROM `ORDER`;
INSERT INTO ORDER_BOOK (order_id, book_id, quantity) VALUES (5, 3, 1);
SELECT * FROM ORDER_BOOK;


-- Some queries that are not allowed to execute due to privilege restriction
UPDATE BOOK SET price = 100.99 WHERE title = 'The Shining'; 
-- This will raise 
-- 0	30	09:45:49	UPDATE BOOK SET price = 100.99 WHERE title = 'The Shining'	Error Code: 1142. UPDATE command denied to user 'johnDoe'@'localhost' for table 'book'	0.000 sec
