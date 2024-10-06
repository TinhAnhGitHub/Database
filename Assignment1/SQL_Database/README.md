# 1. EbookstoreDB SQL schema 
File: [Book store schema SQL](./BookstoreDB_SQL.sql)

1. **Bảng USER (Người dùng)**
- Lưu thông tin chung về tất cả người dùng trong hệ thống
- Gồm:
    - **username**: Tên tài khoản của người dùng. (Định danh duy nhất cho mỗi người dùng)
    - **phone_number**: Số điện thoại của người dùng.
    - **email**: Email của người dùng.
    - **name**: Tên của người dùng.
    - **password**: Mật khẩu của người dùng.

2. **Bảng CUSTOMER (Khách hàng):**

- Chứa thông tin bổ sung cho người dùng là khách hàng.
- Bao gồm: 
    - **address**: Địa chỉ của khách hàng.
    - **bank_acc**: Thông tin ngân hàng của khách hàng.

- Liên kết với bảng USER qua tên đăng nhập.


3. **Bảng EMPLOYEE (Nhân viên):**

- Lưu thông tin về nhân viên của cửa hàng.
- Chỉ có thêm mã nhân viên ngoài thông tin từ bảng USER.
- Liên kết với bảng USER qua tên đăng nhập.


4. **Bảng AUTHOR (Tác giả):**

- Chứa thông tin về các tác giả sách.
- Gồm:  
    - **author_id**: Mã định danh tác giả.
    - **author_name**: Tên của tác giả.
    - **author_dob**: Ngày sinh của tác giả.



5. **Bảng PUBLISHER (Nhà xuất bản):**

- Lưu thông tin về các nhà xuất bản.
- Bao gồm: 
    - **pu_id**: Mã định danh nhà xuất bản.
    - **pu_name**: Tên của nhà xuất bản.
    - **pu_phone_number**: Số điện thoại của nhà xuất bản.
    - **pu_address**: Địa chỉ nhà xuất bản.


6.** Bảng BOOK (Sách):**

- Chứa thông tin về các cuốn sách.
- Gồm: 
    - **book_id**: Mã định danh sách, duy nhất cho mỗi cuốn sách.
    - **title**: Tên của cuốn sách.
    - **price**: Giá của cuốn sách.
    - Liên kết đến tác giả và nhà xuất bản.


7. **Bảng GENRE (Thể loại):**

- Lưu các thể loại sách.
- Bao gồm: 
    - **gen_id**: Mã định danh thể loại sách.
    - **genre_name**: Tên thể loại sách (mã định danh).
    - **description**: Mô tả về thể loại.


8. **Bảng BOOK_GENRE (Sách-Thể loại):**

- Liên kết giữa sách(**book_id**) và thể loại(**gen_id**), cho phép một sách thuộc nhiều thể loại.


9. **Bảng ORDER (Đơn hàng):**

- Lưu thông tin về các đơn đặt hàng của khách.
- Gồm:
    - **order_id**: Mã định danh đơn hàng.
    - **time**: Thời gian đặt hàng.
    - **order_status**: Tình trạng đơn hàng.


10. **Bảng ORDER_BOOK (Chi tiết đơn hàng):**

- Chi tiết về sách trong mỗi đơn hàng.
- Bao gồm: mã đơn hàng(**order_id**), mã sách(**book_id**) và số lượng(**quantity**).


11. **Bảng ORDER_PUBLISHER (Đơn đặt hàng với nhà xuất bản):**

- Lưu thông tin đơn đặt hàng của cửa hàng với nhà xuất bản.
- Gồm:
    - **pu_order_id**: Mã định danh đơn hàng cho nhà xuất bản.
    - **pu_order_time**: Thời gian đặt hàng cho nhà xuất bản.
    - **pu_order_status**: Tình trạng đơn hàng cho nhà xuất bản.
    - **order_quantity** (trong CONTAIN giữa ORDER và BOOK): số lượng sách trong đơn hàng cho người tiêu dùng.
    - **pu_order_quantity**(trong CONTAIN giữa BOOK và ORDER_TO_PUBLISHER): số lượng sách trong đơn hàng cho nhà xuất bản



**12. Bảng ORDER_PUBLISHER_BOOK (Chi tiết đơn đặt với nhà xuất bản):**

- Chi tiết sách trong mỗi đơn đặt với nhà xuất bản.
- Bao gồm: mã sách(**book_id**), mã đơn đặt(**pu_order_id**) và số lượng(**quantity**).

# 2. Grant Permission
- file [grant permission](./grant_permission_sql.sql)

## Member Privileges
- Có thể xem thông tin về sách, thể loại, tác giả, và nhà xb.

- Có thể quản lý thông tin cá nhân của mình:

    - Cập nhật địa chỉ, tài khoản ngân hàng trong bảng CUSTOMER.
    - Xem tên đăng nhập và mật khẩu của mình.
    - Xem và cập nhật tên, số điện thoại, email trong bảng USER.


- Có thể xem và tạo đơn hàng mới:

- Xem và thêm mới vào bảng ORDER.
Thêm sách vào đơn hàng (bảng ORDER_BOOK).


## Employee Privilege


- Có quyền quản lý toàn diện thông tin về sách, tác giả, nhà xuất bản và thể loại:

- Xem, thêm, sửa, xóa thông tin trong các bảng BOOK, AUTHOR, PUBLISHER, GENRE, và BOOK_GENRE.


- Quản lý đơn hàng của khách hàng(ORDER):

    - Xem thông tin khách hàng.
    - Xem chi tiết đơn hàng.
    - Chỉ được phép thay đổi trạng thái đơn hàng.


- Xem, thêm, sửa thông tin trong bảng ORDER_PUBLISHER và ORDER_PUBLISHER_BOOK.

## Admin Privilege
- Toàn quyền


# 3. SQL examples, with privilege restriction example

## Member
```sql
SELECT * FROM BOOK;
SELECT * FROM CUSTOMER;
SELECT * FROM GENRE;
SELECT * FROM AUTHOR;
SELECT * FROM PUBLISHER;
-- Cho phép xem thông tin về sách, khách hàng, thể loại, tác giả, và nhà xuất bản
```

```sql
UPDATE CUSTOMER SET address = '124 Updated Main St, Anytown, USA' WHERE username = 'johnDoe'
-- cập nhật địa chỉ
```

```sql
INSERT INTO ORDER (order_id, order_time, order_status, username) VALUES (5, NOW(), 'Pending', 'johnDoe');
-- Đặt đơn hàng


INSERT INTO ORDER_BOOK (order_id, book_id, quantity) VALUES (5, 3, 1)
-- thêm sách vào đơn hàng
```

Truy vấn không được phép
```sql
UPDATE BOOK SET price = 100.99 WHERE title = 'The Shining';
-- Truy vấn này sẽ gây lỗi vì thành viên không có quyền cập nhật thông tin sách.
```

