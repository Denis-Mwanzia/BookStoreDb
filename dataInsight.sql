-- Top 5 most expensive books
SELECT title, price 
FROM book 
ORDER BY price DESC 
LIMIT 5;

-- Number of books per publisher
SELECT p.name AS publisherName, COUNT(*) AS totalBooks
FROM book b
JOIN publisher p ON b.publisherID = p.publisherID
GROUP BY p.publisherID
ORDER BY totalBooks DESC;

-- Customer orders summary
SELECT c.firstName, c.lastName, COUNT(o.orderID) AS ordersCount
FROM customer c
LEFT JOIN customerOrder o ON c.customerID = o.customerID
GROUP BY c.customerID
ORDER BY ordersCount DESC;