USE EBookstoreDB;


/*
   admin role privileges
   - Có toàn quyền trong hệ thống, bao gồm tất cả những quyền của member và employee. Admin được phép:
    - Thực hiện mọi thao tác liên quan đến danh sách book, genre, tác giả, và nhà xuất bản.
        - Được thêm, sửa, xóa sách, thể loại, tác giả, và nhà xuất bản.
    - Được toàn quyền truy cập và thay đổi thông tin trong danh sách USER.
        - Được update, xóa và thêm người dùng.
        - Được coi toàn bộ thông tin của user, bao gồm username, password, tên, số điện thoại, email, địa chỉ, và bank_acc.
    - Quản lý toàn bộ đơn hàng (orders).
        - Được xem, thêm, sửa, và xóa orders. Được thay đổi trạng thái đơn hàng, và điều chỉnh thông tin sách trong đơn hàng.
    - Quản lý quyền hạn của các user khác.
        - Được thay đổi vai trò của user (admin, employee, member).
    - Thực hiện các thao tác trên database, như sao lưu, phục hồi, và cập nhật cơ sở dữ liệu.
    
    Nói chung, admin có quyền quản lý toàn bộ hệ thống và không bị hạn chế bởi bất kỳ quyền nào.
*/
SET SQL_SAFE_UPDATES = 0; -- để safe update = 0 mở khóa an toàn update
-- Insert into USER
INSERT INTO USER (username, name, phone_number, email, password) VALUES
('nguyen_phuong_duy', 'Nguyễn Phương Duy', '10101010101', 'duy.nguyen@hcmut.edu.vn', 'applesucks'),
('tinh_anh', 'Anh Nguyễn', '1111133333', 'anh.nguyen@hcmut.edu.vn', 'nolife'),
('phuc_nguyen', 'Phuc Nguyễn', '1212121212112', 'phuc.nguyen@hcmut.edu.vn', 'khucnayyeuxa'),
('an_khuong', 'An Khương', '99999999999', 'an.khuong@hcmut.edu.vn', 'mayemkhongchiuhocgihet'),
('tran_tuan_anh', 'Trần Tuấn Anh', '8888888888', 'anh.tran@hcmut.edu.vn', 'duataovaodaylamcaiquegi'),
('anh_co_khi_96', 'Anh Cơ Khí 96', '96969696969', '69.96@hcmut.edu.vn', 'Thằng em mình học bách khoa cơ khí, sinh năm 96..'),
('danh_nguyen', 'Danh Nguyễn', '919191919313131', 'danh.nguyen@hcmut.edu.vn', 'ijustdontknowwhattoputatthispoint');

-- Insert into CUSTOMER
INSERT INTO CUSTOMER (username, address, bank_acc) VALUES
('danh_nguyen', '350 Tô Hiến Thành, Phường 14, Quận 10, Hồ Chí Minh.', '1234567890'),
('phuc_nguyen', '268 Lý Thường Kiệt, Phường 14, Quận 10, Hồ Chí Minh.', '2345678901'),
('tinh_anh', '268 Lý Thường Kiệt, Phường 14, Quận 10, Hồ Chí Minh.', '3456789012'),
('anh_co_khi_96', '96 Võ Thị Sáu, Quận 69, TP. Hồ Chí Minh', '96966669');

-- Insert into EMPLOYEE
INSERT INTO EMPLOYEE (username, employee_id) VALUES
('nguyen_phuong_duy', 1),
('tran_tuan_anh', 2),
('an_khuong', 3);

-- Insert into AUTHOR
INSERT INTO AUTHOR (author_id, name, dob, biography) VALUES
(16, 'J.K. Rowling', '1965-07-31', 'Harry Potter và những người bạn :).'),
(17, 'Nguyễn Nhật Ánh', '1955-06-15', 'Famous Vietnamese author beloved by every Vietnamese young adults.'),
(110, 'Stephen King', '1947-09-21', 'American author of horror, supernatural fiction, suspense, crime, and fantasy novels.'),
(111, 'Haruki Murakami', '1949-01-12', 'Japanese novelist, short-story writer, and essayist.');

-- Insert into PUBLISHER
INSERT INTO PUBLISHER (pu_id, pu_name, pu_phone_number, pu_address) VALUES
(13, 'HarperCollins', '555-5678', '195 Broadway, New York, NY'),
(14, 'Nhà xuất bản Trẻ', '028-3931-8400', '161B Lý Chính Thắng, Quận 3, TP. Hồ Chí Minh'),
(17, 'Random House', '0123456789', '1745 Broadway, New York, NY 10019'),
(18, 'Nhà xuất bản Kim Đồng', '028-39331862', '55 Quang Trung, Quận Hai Bà Trưng, Hà Nội');

-- Insert into BOOK
INSERT INTO BOOK (book_id, title, price, author_id, pu_id) VALUES
(13, 'Harry Potter 3', 29.99, 16, 13),
(14, 'Cô Gái Đến Từ Hôm Qua', 19.99, 17, 14),
(15, 'Harry Potter 5', 39.99, 16, 13),
(16, 'Mắt Biếc', 19.99, 17, 14),
(111, 'The Shining', 35.99, 110, 17),
(112, 'Norwegian Wood', 24.99, 111, 18),
(113, 'IT', 45.99, 110, 17),
(114, 'Kafka on the Shore', 29.99, 111, 18);

-- Insert into GENRE
INSERT INTO GENRE (gen_id, genre_name, description) VALUES
(13, 'Fantasy', 'A genre of speculative fiction involving magical elements.'),
(14, 'Teen Fiction', 'Books that appeal to teenagers and young adults.'),
(17, 'Horror', 'Fiction intended to scare, unsettle, or horrify the reader.'),
(18, 'Magical Realism', 'A literary genre in which magical elements appear in a realistic setting.');

-- Insert into BOOK_GENRE
INSERT INTO BOOK_GENRE (book_id, gen_id) VALUES 
(13, 13),  -- Harry Potter 3 -> Fantasy
(14, 14),  -- Cô Gái Đến Từ Hôm Qua -> Teen Fiction
(15, 13),  -- Harry Potter 5 -> Fantasy
(16, 14),  -- Mắt Biếc -> Teen Fiction
(111, 17),  -- The Shining -> Horror
(112, 18),  -- Norwegian Wood -> Magical Realism
(113, 17),  -- IT -> Horror
(114, 18);  -- Kafka on the Shore -> Magical Realism

-- Insert into ORDER
INSERT INTO `ORDER` (order_id, username, order_time, order_status) VALUES
(12, 'phuc_nguyen', '2024-06-04 11:30:00', 'Failed'),
(13, 'tinh_anh', '2024-10-04 14:30:00', 'Completed'),
(18, 'anh_co_khi_96', '2024-08-01 15:30:00', 'Completed'),
(19, 'tinh_anh', '2024-09-15 10:00:00', 'Pending'),
(110, 'phuc_nguyen', '2024-09-20 11:45:00', 'Failed');

-- Insert into ORDER_BOOK
INSERT INTO ORDER_BOOK (order_id, book_id, quantity) VALUES
(12, 13, 11),  -- Phúc ordered 1 Harry Potter 3
(13, 14, 12),  -- Tinh Anh ordered 2 Cô Gái Đến Từ Hôm Qua
(13, 16, 11),  -- Tinh Anh ordered 1 Mắt Biếc
(18, 111, 11),  -- anh_co_khi_96 ordered 1 The Shining
(18, 113, 12),  -- anh_co_khi_96 ordered 2 IT
(19, 112, 11),  -- Tinh Anh ordered 1 Norwegian Wood
(110, 114, 13);  -- Phúc ordered 3 Kafka on the Shore

-- Insert into ORDER_PUBLISHER
INSERT INTO ORDER_PUBLISHER (pu_order_id, pu_order_status, pu_order_time, username, pu_id) VALUES
(11, 'Pending', '2024-01-10', 'nguyen_phuong_duy', 13),  -- Order to HarperCollins
(12, 'Success', '2024-01-12', 'nguyen_phuong_duy', 14),  -- Order to Nhà xuất bản Trẻ
(15, 'Pending', '2024-03-10', 'tran_tuan_anh', 17),  -- Order to Random House
(16, 'Success', '2024-03-12', 'an_khuong', 18);  -- Order to Nhà xuất bản Kim Đồng

-- Insert into ORDER_PUBLISHER_BOOK
INSERT INTO ORDER_PUBLISHER_BOOK (book_id, pu_order_id, quantity) VALUES
(15, 11, 110),  -- Ordered 10 Harry Potter 5
(16, 12, 115),  -- Ordered 15 Mắt Biếc
(111, 15, 130),  -- Ordered 30 The Shining
(112, 16, 125);  -- Ordered 25 Norwegian Wood

-- Select statements (Query Fixes)
-- Select title + author
SELECT b.title, b.price, a.name AS author
FROM BOOK b
JOIN AUTHOR a ON b.author_id = a.author_id;

-- User info
SELECT username, address
FROM CUSTOMER;

-- Search publisher name
SELECT b.title
FROM BOOK b
JOIN PUBLISHER p ON b.pu_id = p.pu_id
WHERE p.pu_name = 'Nhà xuất bản Trẻ';

-- Select orders by customer name
SELECT o.order_id, c.username, c.address
FROM `ORDER` o
JOIN CUSTOMER c ON o.username = c.username
WHERE c.username = 'tinh_anh';

-- Calculate total books ordered by customer
SELECT c.username, SUM(ob.quantity) AS total_books_ordered
FROM `ORDER` o
JOIN CUSTOMER c ON o.username = c.username
JOIN ORDER_BOOK ob ON o.order_id = ob.order_id
GROUP BY c.username;

-- Count books by each author
SELECT a.name, COUNT(b.book_id) AS books_written
FROM AUTHOR a
JOIN BOOK b ON a.author_id = b.author_id
GROUP BY a.name
HAVING COUNT(b.book_id) > 1;

-- List books and their genres
SELECT b.title, g.genre_name
FROM BOOK b
LEFT JOIN BOOK_GENRE bg ON b.book_id = bg.book_id
LEFT JOIN GENRE g ON bg.gen_id = g.gen_id;

-- Customers who haven't placed any orders
SELECT c.username, c.address
FROM CUSTOMER c
LEFT JOIN `ORDER` o ON c.username = o.username
WHERE o.order_id IS NULL;

-- Total revenue per publisher
SELECT p.pu_name AS publisher, SUM(ob.quantity * b.price) AS total_revenue
FROM PUBLISHER p
JOIN BOOK b ON p.pu_id = b.pu_id
JOIN ORDER_BOOK ob ON b.book_id = ob.book_id
GROUP BY p.pu_name;

-- Find customer who spent the most money
SELECT c.username, SUM(ob.quantity * b.price) AS total_spent
FROM `ORDER` o
JOIN CUSTOMER c ON o.username = c.username
JOIN ORDER_BOOK ob ON o.order_id = ob.order_id
JOIN BOOK b ON ob.book_id = b.book_id
GROUP BY c.username
ORDER BY total_spent DESC
LIMIT 1;

-- Number of unique books ordered by each order
SELECT o.order_id, COUNT(DISTINCT ob.book_id) AS unique_books_ordered
FROM `ORDER` o
JOIN ORDER_BOOK ob ON o.order_id = ob.order_id
GROUP BY o.order_id;

-- Employee placing orders with more than 1 publisher
SELECT e.username, e.employee_id, COUNT(DISTINCT op.pu_id) AS publishers_handled
FROM EMPLOYEE e
JOIN ORDER_PUBLISHER op ON e.username = op.username
GROUP BY e.username, e.employee_id
HAVING COUNT(DISTINCT op.pu_id) > 1;

-- Average book price per genre
SELECT g.genre_name, AVG(b.price) AS average_price
FROM BOOK b
JOIN BOOK_GENRE bg ON b.book_id = bg.book_id
JOIN GENRE g ON bg.gen_id = g.gen_id
GROUP BY g.genre_name;

-- Orders in the last 30 days
SELECT o.order_id, c.username, o.order_time
FROM `ORDER` o
JOIN CUSTOMER c ON o.username = c.username
JOIN ORDER_BOOK ob ON o.order_id = ob.order_id
WHERE o.order_time >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

-- Books ordered within a date range
SELECT b.title, SUM(ob.quantity) AS total_ordered
FROM BOOK b
JOIN ORDER_BOOK ob ON b.book_id = ob.book_id
JOIN `ORDER` o ON ob.order_id = o.order_id
WHERE o.order_time BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY b.title;

-- Yearly revenue per publisher
SELECT p.pu_name AS publisher, SUM(ob.quantity * b.price) AS yearly_revenue
FROM PUBLISHER p
JOIN BOOK b ON p.pu_id = b.pu_id
JOIN ORDER_BOOK ob ON b.book_id = ob.book_id
JOIN `ORDER` o ON ob.order_id = o.order_id
WHERE YEAR(o.order_time) = YEAR(CURDATE())
GROUP BY p.pu_name;

-- Orders within a specific time range
SELECT o.order_id, c.username, o.order_time
FROM `ORDER` o
JOIN ORDER_BOOK ob ON o.order_id = ob.order_id
JOIN CUSTOMER c ON o.username = c.username
WHERE TIME(o.order_time) BETWEEN '09:00:00' AND '14:30:00';

-- Books that were never ordered
SELECT b.title
FROM BOOK b
LEFT JOIN ORDER_BOOK ob ON b.book_id = ob.book_id
WHERE ob.book_id IS NULL;

-- Customers who ordered books from multiple genres
SELECT c.username
FROM CUSTOMER c
JOIN `ORDER` o ON c.username = o.username
JOIN ORDER_BOOK ob ON o.order_id = ob.order_id
JOIN BOOK_GENRE bg ON ob.book_id = bg.book_id
GROUP BY c.username
HAVING COUNT(DISTINCT bg.gen_id) > 1;

-- Update customer address
UPDATE CUSTOMER
SET address = '789 Đường Điện Biên Phủ, Quận Bình Thạnh, TP. Hồ Chí Minh'
WHERE username = 'tinh_anh';

-- Delete all books by J.K. Rowling
DELETE ob
FROM ORDER_BOOK ob
JOIN BOOK b ON ob.book_id = b.book_id
JOIN AUTHOR a ON b.author_id = a.author_id
WHERE a.name = 'J.K. Rowling';

-- Delete all orders of genre 'Fantasy'
DELETE ob
FROM ORDER_BOOK ob
JOIN BOOK_GENRE bg ON ob.book_id = bg.book_id
JOIN GENRE g ON bg.gen_id = g.gen_id
WHERE g.genre_name = 'Fantasy';

-- Customers who only placed one order
SELECT c.username
FROM CUSTOMER c
JOIN `ORDER` o ON c.username = o.username
GROUP BY c.username
HAVING COUNT(o.order_id) = 1;

-- Check stock status based on ordered quantity
SELECT b.title, 
       CASE 
           WHEN SUM(ob.quantity) < 5 THEN 'Needs Reordering'
           ELSE 'In Stock'
       END AS stock_status
FROM BOOK b
LEFT JOIN ORDER_PUBLISHER_BOOK ob ON b.book_id = ob.book_id
GROUP BY b.title;

-- Count successful book orders
SELECT COUNT(*) AS total_successful_orders
FROM ORDER_BOOK ob
JOIN `ORDER` o ON o.order_id = ob.order_id
WHERE o.order_status = 'Completed';

-- Find customers with failed orders
SELECT c.username, o.order_id, o.order_status
FROM `ORDER` o
JOIN CUSTOMER c ON o.username = c.username
JOIN ORDER_BOOK ob ON o.order_id = ob.order_id
WHERE o.order_status = 'Failed';

-- Update orders marked as 'Pending' to 'Failed' if they are older than 30 days
UPDATE `ORDER`
SET order_status = 'Failed'
WHERE order_status = 'Pending'
AND DATEDIFF(CURDATE(), order_time) > 30;

-- Find all pending publisher orders
SELECT p.pu_name AS publisher, op.pu_order_id, op.pu_order_status
FROM PUBLISHER p
JOIN ORDER_PUBLISHER op ON p.pu_id = op.pu_id
WHERE op.pu_order_status = 'Pending';

-- Update publisher address
UPDATE PUBLISHER
SET pu_address = '456 New Address Street, Hanoi, Vietnam'
WHERE pu_id = 1;

-- Add bank account for a customer
UPDATE CUSTOMER
SET bank_acc = '987654321'
WHERE username = 'tinh_anh';

-- Increase book price by 10% for a specific author
UPDATE BOOK
SET price = price * 1.10  
WHERE author_id = (SELECT author_id FROM AUTHOR WHERE name = 'J.K. Rowling');

-- Delete failed orders (handling foreign key constraint)
DELETE FROM `ORDER`
WHERE order_id IN (
    SELECT order_id
    FROM ORDER_BOOK
    WHERE order_status = 'Failed'
);

-- Delete books belonging to a specific genre
DELETE FROM BOOK
WHERE book_id IN (
    SELECT book_id
    FROM BOOK_GENRE
    WHERE gen_id = (SELECT gen_id FROM GENRE WHERE genre_name = 'Science Fiction')
);

-- Delete users who haven't placed any orders
DELETE FROM CUSTOMER
WHERE username NOT IN (
    SELECT DISTINCT username
    FROM `ORDER`
);

-- Delete all orders placed before a specific date
DELETE FROM `ORDER`
WHERE order_id IN (
    SELECT order_id
    FROM ORDER_BOOK
    WHERE order_time < '2024-07-01'
);
