-- Create Roles
CREATE ROLE 'admin';
CREATE ROLE 'sales';
CREATE ROLE 'customer';

-- Grant Privileges to Roles

-- Admin gets full access
GRANT ALL PRIVILEGES ON BookStoreDB.* TO 'admin';

-- Sales can read, insert, and update
GRANT SELECT, INSERT, UPDATE ON BookStoreDB.* TO 'sales';

-- Customer can only read
GRANT SELECT ON BookStoreDB.* TO 'customer';


-- Creating users and assigning role

-- Create users
CREATE USER 'admin1'@'localhost' IDENTIFIED BY 'admin@pass1';
CREATE USER 'admin2'@'localhost' IDENTIFIED BY 'admin@pass2';
CREATE USER 'sales1'@'localhost' IDENTIFIED BY 'sales@pass1';
CREATE USER 'sales2'@'localhost' IDENTIFIED BY 'sales@pass2';
CREATE USER 'customer1'@'localhost' IDENTIFIED BY 'customer@pass1';
CREATE USER 'customer2'@'localhost' IDENTIFIED BY 'customer@pass2';

-- Assign roles
GRANT 'admin' TO 'admin1'@'localhost';
GRANT 'admin' TO 'admin2'@'localhost';
GRANT 'sales' TO 'sales1'@'localhost';
GRANT 'sales' TO 'sales2'@'localhost';
GRANT 'customer' TO 'customer1'@'localhost';
GRANT 'customer' TO 'customer2'@'localhost';


