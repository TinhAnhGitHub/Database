USE EBookstoreDB;
show databases;
SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS = 0;


TRUNCATE TABLE ORDER_PUBLISHER_BOOK;
TRUNCATE TABLE ORDER_PUBLISHER;
TRUNCATE TABLE ORDER_BOOK;
TRUNCATE TABLE CUSTOMER_ORDER;
TRUNCATE TABLE BOOK_GENRE;
TRUNCATE TABLE GENRE;
TRUNCATE TABLE BOOK;
TRUNCATE TABLE PUBLISHER;
TRUNCATE TABLE AUTHOR;
TRUNCATE TABLE EMPLOYEE;
TRUNCATE TABLE CUSTOMER;
TRUNCATE TABLE USER;

SET FOREIGN_KEY_CHECKS = 1;

-- users
INSERT INTO USER (Username, Name, Phone_Number, Email, Passwords) VALUES
('nguyen_phuong_duy', 'Nguyễn Phương Duy', '10101010101', 'duy.nguyen@hcmut.edu.vn', 'applesucks'),
('tinh_anh', 'Anh Nguyễn', '1111133333', 'anh.nguyen@hcmut.edu.vn', 'nolife'),
('phuc_nguyen', 'Phuc Nguyễn', '1212121212112', 'phuc.nguyen@hcmut.edu.vn', 'khucnayyeuxa'),
('an_khuong', 'An Khương', '99999999999', 'an.khuong@hcmut.edu.vn', 'mayemkhongchiuhocgihet'),
('tran_tuan_anh', 'Trần Tuấn Anh', '8888888888', 'anh.tran@hcmut.edu.vn', 'duataovaodaylamcaiquegi'),
('anh_co_khi_96', 'Anh Cơ Khí 96', '96969696969', '69.96@hcmut.edu.vn', 'Thằng em mình học bách khoa cơ khí, sinh năm 96..'),
('danh_nguyen', 'Danh Nguyễn', '919191919313131', 'danh.nguyen@hcmut.edu.vn', 'ijustdontknowwhattoputatthispoint');

-- customers
INSERT INTO CUSTOMER (Username, Address, Bank_Account) VALUES
('danh_nguyen', '350 Tô Hiến Thành, Phường 14, Quận 10, Hồ Chí Minh.', '1234567890'),
('phuc_nguyen', '268 Lý Thường Kiệt, Phường 14, Quận 10, Hồ Chí Minh.', '2345678901'),
('tinh_anh', '268 Lý Thường Kiệt, Phường 14, Quận 10, Hồ Chí Minh.', '3456789012'),
('anh_co_khi_96', '96 Võ Thị Sáu, Quận 69, TP. Hồ Chí Minh', '96966669');

-- employees
INSERT INTO EMPLOYEE (Username, Employee_Id) VALUES
('nguyen_phuong_duy', 'E001'),
('tran_tuan_anh', 'E002'),
('an_khuong', 'E003');

-- authors
INSERT INTO AUTHOR (Author_Id, Name, Dob, Biography) VALUES
(6, 'J.K. Rowling', '1965-07-31', 'Harry Potter và những người bạn :).'),
(7, 'Nguyễn Nhật Ánh', '1955-06-15', 'Famous Vietnamese author beloved by every Vietnamese young adults.'),
(10, 'Stephen King', '1947-09-21', 'American author of horror, supernatural fiction, suspense, crime, and fantasy novels.'),
(11, 'Haruki Murakami', '1949-01-12', 'Japanese novelist, short-story writer, and essayist.');

-- publishers
INSERT INTO PUBLISHER (Publisher_Id, Name, Phone_Number, Address) VALUES
(3, 'HarperCollins', '555-5678', '195 Broadway, New York, NY'),
(4, 'Nhà xuất bản Trẻ', '028-3931-8400', '161B Lý Chính Thắng, Quận 3, TP. Hồ Chí Minh'),
(7, 'Random House', '0123456789', '1745 Broadway, New York, NY 10019'),
(8, 'Nhà xuất bản Kim Đồng', '028-39331862', '55 Quang Trung, Quận Hai Bà Trưng, Hà Nội');

-- books
INSERT INTO BOOK (Book_Id, Title, Price, Author_Id, Publisher_Id) VALUES
(3, 'Harry Potter 3', 29.99, 6, 3),
(4, 'Cô Gái Đến Từ Hôm Qua', 19.99, 7, 4),
(5, 'Harry Potter 5', 39.99, 6, 3),
(6, 'Mắt Biếc', 19.99, 7, 4),
(11, 'The Shining', 35.99, 10, 7),
(12, 'Norwegian Wood', 24.99, 11, 8),
(13, 'IT', 45.99, 10, 7),
(14, 'Kafka on the Shore', 29.99, 11, 8);

-- genres
INSERT INTO GENRE (Genre_Id, Genre_Name, Description) VALUES
(3, 'Fantasy', 'A genre of speculative fiction involving magical elements.'),
(4, 'Teen Fiction', 'Books that appeal to teenagers and young adults.'),
(7, 'Horror', 'Fiction intended to scare, unsettle, or horrify the reader.'),
(8, 'Magical Realism', 'A literary genre in which magical elements appear in a realistic setting.');

-- genres
INSERT INTO BOOK_GENRE (Book_Id, Genre_Id) VALUES 
(3, 3),  -- Harry Potter 3 -> Fantasy
(4, 4),  -- Cô Gái Đến Từ Hôm Qua -> Teen Fiction
(5, 3),  -- Harry Potter 5 -> Fantasy
(6, 4),  -- Mắt Biếc -> Teen Fiction
(11, 7),  -- The Shining -> Horror
(12, 8),  -- Norwegian Wood -> Magical Realism
(13, 7),  -- IT -> Horror
(14, 8);  -- Kafka on the Shore -> Magical Realism

-- orders
INSERT INTO CUSTOMER_ORDER (Order_Id, Username) VALUES
(2, 'phuc_nguyen'),
(3, 'tinh_anh'),
(8, 'anh_co_khi_96'),
(9, 'tinh_anh'),
(10, 'phuc_nguyen');

-- orders item
INSERT INTO ORDER_BOOK (Order_Id, Book_Id, Order_Status, Order_Time, Quantity) VALUES
(2, 3,'Failed','2024-06-04 11:30:00', 1),  -- Phúc ordered 1 Harry Potter 3
(3, 4,'Success','2024-10-04 14:30:00', 2),  -- Tinh Anh ordered 2 Cô Gái Đến Từ Hôm Qua
(3, 6,'Pending','2024-10-04 14:30:00', 1),  -- Tinh Anh ordered 1 Mắt Biếc
(8, 11, 'Success', '2024-08-01 15:30:00', 1),  -- anh_co_khi_96 ordered 1 The Shining
(8, 13, 'Success', '2024-08-01 15:30:00', 2),  -- anh_co_khi_96 ordered 2 IT
(9, 12, 'Pending', '2024-09-15 10:00:00', 1),  -- Tinh Anh ordered 1 Norwegian Wood
(10, 14, 'Failed', '2024-09-20 11:45:00', 3);  -- Phúc ordered 3 Kafka on the Shore

-- publisher orders
INSERT INTO ORDER_PUBLISHER (Order_Publisher_Id, Order_Publisher_Status, Order_Publisher_Time, Username, Publisher_Id) VALUES
(1, 'Pending', '2024-01-10 1:01:01', 'nguyen_phuong_duy', 3),  -- Order to HarperCollins
(2, 'Success', '2024-01-12 1:01:01', 'nguyen_phuong_duy', 4),  -- Order to Nhà xuất bản Trẻ
(5, 'Pending', '2024-03-10 14:00:00', 'tran_tuan_anh', 7),  -- Order to Random House
(6, 'Success', '2024-03-12 16:00:00', 'an_khuong', 8);  -- Order to Nhà xuất bản Kim Đồng


-- publisher orders item
INSERT INTO ORDER_PUBLISHER_BOOK (Order_Publisher_Id, Book_Id, Quantity) VALUES
(1, 5, 10),  -- Ordered 10 Harry Potter 5
(2, 6, 15),  -- Ordered 15 Mắt Biếc
(5, 11, 30),  -- Ordered 30 The Shining
(6, 12, 25);  -- Ordered 25 Norwegian Wood



-- chọn title + author
SELECT b.Title, b.Price, a.Name AS Author
FROM BOOK b
JOIN AUTHOR a ON b.Author_Id = a.Author_Id;

-- use info
SELECT Username, Address
FROM CUSTOMER;

-- search tên xuất bản
SELECT b.Title
FROM BOOK b
JOIN PUBLISHER p ON b.Publisher_Id = p.Publisher_Id
WHERE p.Name = 'Nhà xuất bản Trẻ';

-- chọn order bởi tên customer
SELECT o.Order_Id, c.Username, c.Address
FROM CUSTOMER_ORDER o
JOIN CUSTOMER c ON o.Username = c.Username
WHERE c.Username = 'tinh_anh';

-- tính tổng sách order bởi customer
SELECT c.Username, SUM(ob.Quantity) AS TotalBooksOrdered
FROM CUSTOMER_ORDER o
JOIN CUSTOMER c ON o.Username = c.Username
JOIN ORDER_BOOK ob ON o.Order_Id = ob.Order_Id
GROUP BY c.Username;

-- đếm sách bởi mỗi author
SELECT a.Name, COUNT(b.Book_Id) AS BooksWritten
FROM AUTHOR a
JOIN BOOK b ON a.Author_Id = b.Author_Id
GROUP BY a.Name
HAVING COUNT(b.Book_Id) > 1;

-- liệt kê sách và genre của nó
SELECT b.Title, g.Genre_Name
FROM BOOK b
LEFT JOIN BOOK_GENRE bg ON b.Book_Id = bg.Book_Id
LEFT JOIN GENRE g ON bg.Genre_Id = g.Genre_Id;

-- customer chưa đặt gì
SELECT c.Username, c.Address
FROM CUSTOMER c
LEFT JOIN CUSTOMER_ORDER o ON c.Username = o.Username
WHERE o.Order_Id IS NULL;

-- tổng doanh thu từng customer
SELECT p.Name AS Publisher, SUM(ob.Quantity * b.Price) AS TotalRevenue
FROM PUBLISHER p
JOIN BOOK b ON p.Publisher_Id = b.Publisher_Id
JOIN ORDER_BOOK ob ON b.Book_Id = ob.Book_Id
GROUP BY p.Name;

-- tìm khách spend nhiều tiền nhất
SELECT c.Username, SUM(ob.Quantity * b.Price) AS TotalSpent
FROM CUSTOMER_ORDER o
JOIN CUSTOMER c ON o.Username = c.Username
JOIN ORDER_BOOK ob ON o.Order_Id = ob.Order_Id
JOIN BOOK b ON ob.Book_Id = b.Book_Id
GROUP BY c.Username
ORDER BY TotalSpent DESC
LIMIT 1;

-- các loại sách mà khách order
SELECT o.Order_Id, COUNT(DISTINCT ob.Book_Id) AS UniqueBooksOrdered
FROM CUSTOMER_ORDER o
JOIN ORDER_BOOK ob ON o.Order_Id = ob.Order_Id
GROUP BY o.Order_Id;

-- employee  đặt hàng hơn 1 nhà xuất bản
SELECT e.Username, e.Employee_Id, COUNT(DISTINCT op.Publisher_Id) AS PublishersHandled
FROM EMPLOYEE e
JOIN ORDER_PUBLISHER op ON e.Username = op.Username
GROUP BY e.Username, e.Employee_Id
HAVING COUNT(DISTINCT op.Publisher_Id) > 1;

-- tính trung bình giá sách từng genre
SELECT g.Genre_Name, AVG(b.Price) AS AveragePrice
FROM BOOK b
JOIN BOOK_GENRE bg ON b.Book_Id = bg.Book_Id
JOIN GENRE g ON bg.Genre_Id = g.Genre_Id
GROUP BY g.Genre_Name;

-- order 30 ngày trở lại
SELECT o.Order_Id, c.Username, ob.Order_Time
FROM CUSTOMER_ORDER o
JOIN CUSTOMER c ON o.Username = c.Username
JOIN ORDER_BOOK ob ON o.Order_Id = ob.Order_Id
WHERE ob.Order_Time >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

-- sách order khoảng ngày
SELECT b.Title, SUM(ob.Quantity) AS TotalOrdered
FROM BOOK b
JOIN ORDER_BOOK ob ON b.Book_Id = ob.Book_Id
JOIN CUSTOMER_ORDER o ON ob.Order_Id = o.Order_Id
WHERE ob.Order_Time BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY b.Title;

-- doanh thu từng nhà xuất bản năm nay
SELECT p.Name AS Publisher, SUM(ob.Quantity * b.Price) AS YearlyRevenue
FROM PUBLISHER p
JOIN BOOK b ON p.Publisher_Id = b.Publisher_Id
JOIN ORDER_BOOK ob ON b.Book_Id = ob.Book_Id
JOIN CUSTOMER_ORDER o ON ob.Order_Id = o.Order_Id
WHERE YEAR(ob.Order_Time) = YEAR(CURDATE())
GROUP BY p.Name;

-- tổng số order cho nhà xuất bản từng tháng
SELECT p.Name AS Publisher, SUM(ob.Quantity * b.Price) AS YearlyRevenue
FROM PUBLISHER p
JOIN BOOK b ON p.Publisher_Id = b.Publisher_Id
JOIN ORDER_BOOK ob ON b.Book_Id = ob.Book_Id
JOIN CUSTOMER_ORDER o ON ob.Order_Id = o.Order_Id
WHERE YEAR(ob.Order_Time) = YEAR(CURDATE())
GROUP BY p.Name;

-- order từ khung giờ nhất định
SELECT o.Order_Id, c.Username, ob.Order_Time
FROM CUSTOMER_ORDER o
JOIN ORDER_BOOK ob ON o.Order_Id = ob.Order_Id
JOIN CUSTOMER c ON o.Username = c.Username
WHERE TIME(ob.Order_Time) BETWEEN '09:00:00' AND '14:30:00';



-- sách chưa bao giờ được order
SELECT b.Title
FROM BOOK b
LEFT JOIN ORDER_BOOK ob ON b.Book_Id = ob.Book_Id
WHERE ob.Book_Id IS NULL;

-- khách hàng đã đặt hàng ở nhiều genre
SELECT c.Username
FROM CUSTOMER c
JOIN CUSTOMER_ORDER o ON c.Username = o.Username
JOIN ORDER_BOOK ob ON o.Order_Id = ob.Order_Id
JOIN BOOK_GENRE bg ON ob.Book_Id = bg.Book_Id
GROUP BY c.Username
HAVING COUNT(DISTINCT bg.Genre_Id) > 1;

-- cập nhật địa chỉ khách hàng
UPDATE CUSTOMER
SET Address = '789 Đường Điện Biên Phủ, Quận Bình Thạnh, TP. Hồ Chí Minh'
WHERE Username = 'tinh_anh';

-- xóa all sách của author J.K. Rowling
DELETE ob
FROM ORDER_BOOK ob
JOIN BOOK b ON ob.Book_Id = b.Book_Id
JOIN AUTHOR a ON b.Author_Id = a.Author_Id
WHERE a.Name = 'J.K. Rowling';

-- xóa all order genre fantasy
DELETE ob
FROM ORDER_BOOK ob
JOIN BOOK_GENRE bg ON ob.Book_Id = bg.Book_Id
JOIN GENRE g ON bg.Genre_Id = g.Genre_Id
WHERE g.Genre_Name = 'Fantasy';

-- tính tổng doanh thu từng nhà xuất bản trong năm hiện tại
SELECT p.Name AS Publisher, SUM(ob.Quantity * b.Price) AS YearlyRevenue
FROM PUBLISHER p
JOIN BOOK b ON p.Publisher_Id = b.Publisher_Id
JOIN ORDER_BOOK ob ON b.Book_Id = ob.Book_Id
JOIN CUSTOMER_ORDER o ON ob.Order_Id = o.Order_Id
WHERE YEAR(ob.Order_Time) = YEAR(CURDATE())
GROUP BY p.Name;

-- khách hàng nào mà chỉ đặt hàng đúng 1 lần
SELECT c.Username
FROM CUSTOMER c
JOIN CUSTOMER_ORDER o ON c.Username = o.Username
GROUP BY c.Username
HAVING COUNT(o.Order_Id) = 1;

-- kiểm tra trạng thái tồn kho dựa trên số lượng đã đặt
SELECT b.Title, 
       CASE 
           WHEN SUM(ob.Quantity) < 5 THEN 'Needs Reordering'
           ELSE 'In Stock'
       END AS StockStatus
FROM BOOK b
LEFT JOIN ORDER_PUBLISHER_BOOK ob ON b.Book_Id = ob.Book_Id
GROUP BY b.Title;

-- đếm số lượng sách đặt hàng success
SELECT COUNT(*) AS TotalSuccessfulOrders
FROM ORDER_BOOK
WHERE Order_Status = 'Success';

-- tìm customer có đơn hàng fail
SELECT c.Username, o.Order_Id, ob.Order_Status
FROM CUSTOMER_ORDER o
JOIN CUSTOMER c ON o.Username = c.Username
JOIN ORDER_BOOK ob ON o.Order_Id = ob.Order_Id
WHERE ob.Order_Status = 'Failed';

-- thống kê số lượng đơn hàng theo trạng thái
SELECT Order_Status, COUNT(*) AS TotalOrders
FROM ORDER_BOOK
GROUP BY Order_Status;

-- tổng doanh thu cho mỗi khách với đk đơn hàng success
SELECT c.Username, SUM(ob.Quantity * b.Price) AS TotalSpent
FROM CUSTOMER_ORDER o
JOIN CUSTOMER c ON o.Username = c.Username
JOIN ORDER_BOOK ob ON o.Order_Id = ob.Order_Id
JOIN BOOK b ON ob.Book_Id = b.Book_Id
WHERE ob.Order_Status = 'Success'
GROUP BY c.Username;

-- cập nhật đơn hàng fail thành pending
UPDATE ORDER_BOOK
SET Order_Status = 'Failed'
WHERE Order_Status = 'Pending'
AND DATEDIFF(CURDATE(), Order_Time) > 30;

-- tìm all đơn hàng pending
SELECT p.Name AS Publisher, op.Order_Publisher_Id, op.Order_Publisher_Status
FROM PUBLISHER p
JOIN ORDER_PUBLISHER op ON p.Publisher_Id = op.Publisher_Id
WHERE op.Order_Publisher_Status = 'Pending';

-- tính tỷ lệ đơn hàng success
SELECT 
    (COUNT(CASE WHEN Order_Status = 'Success' THEN 1 END) / COUNT(*)) * 100 AS CompletionRate
FROM ORDER_BOOK;

-- cập nhật đơn hàng thành success
UPDATE ORDER_BOOK
SET Order_Status = 'Success'
WHERE Order_Id = 1 AND Book_Id = 101;

-- sauwr địa chỉ nhà xb
UPDATE PUBLISHER
SET Address = '456 New Address Street, Hanoi, Vietnam'
WHERE Publisher_Id = 1;

-- thêm bank acc
UPDATE CUSTOMER
SET bank_account = '987654321'
WHERE Username = 'tinh_anh';

-- tăng giá sách thêm 10 %
UPDATE BOOK
SET Price = Price * 1.10  
WHERE Author_Id = (SELECT Author_Id FROM AUTHOR WHERE Name = 'J.K. Rowling');

-- xóa đơn hàng của  customer bị fail (xử lý foreign key)
DELETE FROM CUSTOMER_ORDER
WHERE Order_Id IN (
    SELECT Order_Id
    FROM ORDER_BOOK
    WHERE Order_Status = 'Failed'
);

-- xóa sách thuộc thể loại nào đó
DELETE FROM BOOK
WHERE Book_Id IN (
    SELECT Book_Id
    FROM BOOK_GENRE
    WHERE Genre_Id = (SELECT Genre_Id FROM GENRE WHERE Genre_Name = 'Science Fiction')
);

-- xóa user k đặt hàng
DELETE FROM CUSTOMER
WHERE Username NOT IN (
    SELECT DISTINCT Username
    FROM CUSTOMER_ORDER
);

-- xóa tất cả đơn hàng trước một ngày nào đó
DELETE FROM CUSTOMER_ORDER
WHERE Order_Id IN (
    SELECT Order_Id
    FROM ORDER_BOOK
    WHERE Order_Time < '2024-07-01'
);

SET FOREIGN_KEY_CHECKS = 0;


TRUNCATE TABLE ORDER_PUBLISHER_BOOK;
TRUNCATE TABLE ORDER_PUBLISHER;
TRUNCATE TABLE ORDER_BOOK;
TRUNCATE TABLE CUSTOMER_ORDER;
TRUNCATE TABLE BOOK_GENRE;
TRUNCATE TABLE GENRE;
TRUNCATE TABLE BOOK;
TRUNCATE TABLE PUBLISHER;
TRUNCATE TABLE AUTHOR;
TRUNCATE TABLE EMPLOYEE;
TRUNCATE TABLE CUSTOMER;
TRUNCATE TABLE USER;

SET FOREIGN_KEY_CHECKS = 1;
