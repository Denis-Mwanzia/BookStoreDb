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