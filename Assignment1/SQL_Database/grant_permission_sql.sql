CREATE ROLE 'Member';
CREATE ROLE 'Employee';
CREATE ROLE 'Admin';



-- Grant privileges to Member role

-- View book details, genere, author,...
GRANT SELECT ON ebookstoredb.BOOK TO 'Member';
GRANT SELECT ON ebookstoredb.GENRE TO 'Member';
GRANT SELECT ON ebookstoredb.AUTHOR TO 'Member';
GRANT SELECT ON ebookstoredb.PUBLISHER TO 'Member';

-- Manage their own profile
GRANT SELECT, INSERT, UPDATE ON ebookstoredb.CUSTOMER TO 'Member'; -- update address, bank acc,...
GRANT SELECT (username, password) ON ebookstoredb.USER TO 'Member'; -- view their username and password
GRANT SELECT, UPDATE (name, phone_number, email) ON ebookstoredb.USER TO 'Member'; -- view their profile information

GRANT SELECT, INSERT ON ebookstoredb.ORDER TO 'Member'; -- view and create new orders
GRANT SELECT, INSERT ON ebookstoredb.ORDER_BOOK  TO 'Member'; -- allow user to add books to orders.


-- GRANT privileges to Employee role
-- manage books, author, publishers,...
GRANT SELECT, INSERT, UPDATE, DELETE ON ebookstoredb.BOOK TO Employee;
GRANT SELECT, INSERT, UPDATE, DELETE ON ebookstoredb.AUTHOR TO Employee;
GRANT SELECT, INSERT, UPDATE, DELETE ON ebookstoredb.PUBLISHER TO Employee;
GRANT SELECT, INSERT, UPDATE, DELETE ON ebookstoredb.GENRE TO Employee;
GRANT SELECT, INSERT, UPDATE, DELETE ON ebookstoredb.BOOK_GENRE TO Employee;


-- view and manage customer orders, only allow to change the status of the order
GRANT SELECT ON ebookstoredb.CUSTOMER TO Employee;
GRANT SELECT ON ebookstoredb.ORDER TO Employee;
GRANT UPDATE (order_status) ON ebookstoredb.ORDER TO Employee;
GRANT SELECT ON ebookstoredb.ORDER_BOOK TO Employee;

--  Manage Publisher orders
GRANT SELECT, INSERT, UPDATE ON ebookstoredb.ORDER_PUBLISHER TO Employee;
GRANT SELECT, INSERT, UPDATE ON ebookstoredb.ORDER_PUBLISHER_BOOK TO Employee;

GRANT ALL PRIVILEGES ON ebookstoredb.* TO Admin;

