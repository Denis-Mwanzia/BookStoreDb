-- Check for orphaned foreign keys in book table
SELECT b.bookID, b.title
FROM book b
LEFT JOIN publisher p ON b.publisherID = p.publisherID
LEFT JOIN bookLanguage l ON b.languageID = l.languageID
WHERE p.publisherID IS NULL OR l.languageID IS NULL;

-- Ensure bookAuthor entries link to existing books and authors
SELECT ba.bookID, ba.authorID
FROM bookAuthor ba
LEFT JOIN book b ON ba.bookID = b.bookID
LEFT JOIN author a ON ba.authorID = a.authorID
WHERE b.bookID IS NULL OR a.authorID IS NULL;

-- Check customerAddress integrity
SELECT ca.customerID, ca.addressID
FROM customerAddress ca
LEFT JOIN customer c ON ca.customerID = c.customerID
LEFT JOIN address a ON ca.addressID = a.addressID
WHERE c.customerID IS NULL OR a.addressID IS NULL;

-- Check valid links in customerOrder
SELECT o.orderID, o.customerID
FROM customerOrder o
LEFT JOIN customer c ON o.customerID = c.customerID
LEFT JOIN orderStatus os ON o.statusID = os.statusID
WHERE c.customerID IS NULL OR os.statusID IS NULL;
