-- Create author Table
CREATE TABLE author (
    authorID INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(100),
    lastName VARCHAR(100),
    bio TEXT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create bookLanguage Table
CREATE TABLE bookLanguage (
    languageID INT PRIMARY KEY AUTO_INCREMENT,
    languageName VARCHAR(100)
);

-- Create publisher Table
CREATE TABLE publisher (
    publisherID INT PRIMARY KEY AUTO_INCREMENT,
    publisherName VARCHAR(255)
);