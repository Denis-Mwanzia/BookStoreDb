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