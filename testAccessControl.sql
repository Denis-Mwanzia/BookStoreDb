-- Test Access Control for admin1 (should be able to SELECT, INSERT, UPDATE, DELETE)
-- Login as 'admin1' to run these

SELECT * FROM book LIMIT 5;

INSERT INTO book (bookID, title, ISBN, price, description, publishDate, publisherID, languageID, createdAt, updatedAt)
VALUES (9999, 'Test Book by Admin', '999-1-23456-789-0', 49.99, 'This is a test book by admin.', '2023-01-01', 1, 1, NOW(), NOW());

UPDATE book SET price = 59.99 WHERE bookID = 9999;

DELETE FROM book WHERE bookID = 9999;

-- Login as 'sales2'

SELECT * FROM customer LIMIT 5;

INSERT INTO customer (customerID, firstName, lastName, email, phone, createdAt, updatedAt)
VALUES (999, 'Sales', 'User', 'salesuser@test.com', '0712345678', NOW(), NOW());

UPDATE customer SET phone = '0700000000' WHERE customerID = 999;

-- DELETE should fail
-- DELETE FROM customer WHERE customerID = 999;

-- Login as 'customer1'

SELECT * FROM book LIMIT 5;

-- INSERT should fail
-- INSERT INTO book (bookID, title, ISBN, price, description, publishDate, publisherID, languageID, createdAt, updatedAt)
-- VALUES (8888, 'Customer Insert Book', '111-1-23456-789-0', 19.99, 'Customer test book.', '2023-01-01', 1, 1, NOW(), NOW());
