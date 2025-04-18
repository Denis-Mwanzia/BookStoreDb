-- Create author Table
CREATE TABLE author (
    authorID INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    bio TEXT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create bookLanguage Table
CREATE TABLE bookLanguage (
    languageID INT PRIMARY KEY AUTO_INCREMENT,
    languageName VARCHAR(100) NOT NULL
);

-- Create publisher Table
CREATE TABLE publisher (
    publisherID INT PRIMARY KEY AUTO_INCREMENT,
    publisherName VARCHAR(255) NOT NULL
);

-- Create book Table
CREATE TABLE book (
    bookID INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    synopsis TEXT,
    publicationDate DATE NOT NULL,
    publisherID INT NOT NULL,
    languageID INT NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (publisherID) REFERENCES publisher(publisherID),
    FOREIGN KEY (languageID) REFERENCES bookLanguage(languageID),
    CONSTRAINT chk_valid_price CHECK (price >= 0)
);

-- Create bookAuthor Table
CREATE TABLE bookAuthor (
    authorID INT,
    bookID INT,
    PRIMARY KEY (authorID, bookID),
    FOREIGN KEY (authorID) REFERENCES author(authorID),
    FOREIGN KEY (bookID) REFERENCES book(bookID)
);

-- Create customer Table
CREATE TABLE customer (
    customerID INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phoneNumber VARCHAR(20) NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create country Table
CREATE TABLE country (
    countryID INT PRIMARY KEY AUTO_INCREMENT,
    countryName VARCHAR(100) NOT NULL
);

-- Create address Table
CREATE TABLE address (
    addressID INT PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    zipCode VARCHAR(20) NOT NULL,
    countryID INT,
    FOREIGN KEY (countryID) REFERENCES country(countryID)
);

-- Create addressStatus
CREATE TABLE addressStatus (
    statusID INT PRIMARY KEY AUTO_INCREMENT,
    statusName VARCHAR(100) NOT NULL
);

-- Create customerAddress Table
CREATE TABLE customerAddress (
    customerID INT,
    addressID INT,
    statusID INT,
    PRIMARY KEY (customerID, addressID),
    FOREIGN KEY (customerID) REFERENCES customer(customerID),
    FOREIGN KEY (addressID) REFERENCES address(addressID),
    FOREIGN KEY (statusID) REFERENCES addressStatus(statusID)
);

-- Create shippingStatus Table
CREATE TABLE shippingMethod (
    methodID INT PRIMARY KEY AUTO_INCREMENT,
    methodName VARCHAR(100) NOT NULL UNIQUE,
    cost DECIMAL(10,2) NOT NULL CHECK (cost >= 0),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create orderStatus Table
CREATE TABLE orderStatus (
    statusID INT PRIMARY KEY AUTO_INCREMENT,
    statusValue VARCHAR(100) NOT NULL
);

-- Create customerOrder Table
CREATE TABLE customerOrder (
    orderID INT PRIMARY KEY AUTO_INCREMENT,
    orderDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    customerID INT NOT NULL,
    statusID INT NOT NULL,
    methodID INT NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (customerID) REFERENCES customer(customerID) ON DELETE RESTRICT,    
    FOREIGN KEY (statusID) REFERENCES orderStatus(statusID) ON UPDATE CASCADE,       
    FOREIGN KEY (methodID) REFERENCES shippingMethod(methodID) ON UPDATE CASCADE
);

-- Create orderLine Table
CREATE TABLE orderLine (
    bookID INT NOT NULL,
    orderID INT NOT NULL,
    quantity SMALLINT UNSIGNED NOT NULL CHECK (quantity > 0),
    unitPrice DECIMAL(10,2) NOT NULL CHECK (unitPrice >= 0),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (bookID, orderID),
    FOREIGN KEY (bookID) REFERENCES book(bookID) ON DELETE RESTRICT ON UPDATE CASCADE,     
    FOREIGN KEY (orderID) REFERENCES customerOrder(orderID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create orderHistory
CREATE TABLE orderHistory (
    historyID INT PRIMARY KEY AUTO_INCREMENT,
    orderID INT,
    statusID INT,
    timeStamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (orderID) REFERENCES customerOrder(orderID),
    FOREIGN KEY (statusID) REFERENCES orderStatus(statusID)
);

-- Confirm Tables in bookStoreDb
SHOW TABLES;