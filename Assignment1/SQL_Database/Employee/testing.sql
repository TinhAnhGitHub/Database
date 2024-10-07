USE ebookstoredb;
SELECT * FROM BOOK;
/*
   employee role privileges
   - Có quyền cao hơn member nhưng thấp hơn admin. Employee được phép:
    - Quản lý sách, thể loại, tác giả, và nhà xuất bản.
        - Được thêm, sửa, và xóa sách.
        - Được thêm và sửa thông tin tác giả, thể loại, và nhà xuất bản, nhưng không được xóa.
    - Được truy cập và thay đổi thông tin trong danh sách USER, nhưng bị hạn chế:
        - Được xem toàn bộ thông tin của customer, nhưng không được chỉnh sửa hay xóa.
        - Được cập nhật thông tin của chính mình (name, phone_number, email) và thông tin ngân hàng (bank_acc).
        - Không được thay đổi vai trò của user hoặc thông tin cá nhân của admin.
    - Quản lý đơn hàng (orders).
        - Được thêm, sửa, và xóa orders của customers.
        - Được thay đổi trạng thái đơn hàng, và thêm sách vào đơn hàng.
    - Không được thực hiện các thao tác liên quan đến sao lưu, phục hồi, hoặc cập nhật cơ sở dữ liệu.
    
    Nói chung, employee có quyền quản lý một phần thông tin trong hệ thống, nhưng không được thay đổi vai trò user hoặc thực hiện thao tác ảnh hưởng đến cấu trúc hệ thống.
*/

SET SQL_SAFE_UPDATES = 0; -- để safe update = 0 mở khóa an toàn update

INSERT INTO BOOK (book_id, title, price, author_id, pu_id) 
VALUES (5, 'Harry Potter', 24.99, 1, 1);
UPDATE BOOK SET price = 25.99 WHERE book_id = 5;
SELECT * FROM BOOK;
DELETE FROM BOOK WHERE book_id = 5;


SELECT * FROM ORDER_PUBLISHER;
INSERT INTO ORDER_PUBLISHER (pu_order_id, pu_order_status, pu_order_time, username, pu_id)
VALUES (3, 'Pending', CURDATE(), 'employee1', 3);

-- Some queries that are not allowed to execute due to privilege restriction
SELECT * FROM `ORDER`;
DELETE FROM `ORDER` WHERE order_id = 1;  -- cannot delete order, only admin can
UPDATE `ORDER` SET order_status = 'Processing' WHERE order_id = 2;
-- This will raise 
-- 16:46:08	DELETE FROM `ORDER` WHERE order_id = 1	Error Code: 1142. DELETE command denied to user 'employee1'@'localhost' for table 'order'	0.000 sec


