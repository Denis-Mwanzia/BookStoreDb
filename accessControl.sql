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



