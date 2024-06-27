## DATABASE TESTING MID-TERM GROUP PROJECT- GROUP1

### TEAM MEMBERS RESPONSIBILITIES
1. Meghna - 
2. Shilpa - Creating Author and Book Review Tables and queries for finding Power Writers
3. Sushmitha - 

### REFERENCE LINKS
1. https://github.com/VasudhaAmbre/Spring-Boot-BookStore-Application/blob/main/OBS.sql


### TABLES
1.Authors


| Attribute Name  | Attribute Type|
| ------------- |:-------------:|
| Author_ID  (PK)   | INT           |
| Author_Name   | VARCHAR(20)   |
| Book_ID    (FK)   | INT           |
| Book_Genre    | VARCHAR(20)   |
| Date_Published| DATE          |

2.Books

| Attribute Name  | Attribute Type|
| ------------- |:-------------:|
| Book_ID  (PK)   | INT           |
| Book_Name   | VARCHAR(20)   |
| Book_Genre    | VARCHAR(20)   |
| Author_ID    (FK)   | INT           |
| Price| DECIMAL         |
|Stock| INT|





### SQL CODE BLOCK

CREATE TABLE `Authors` (
  `Author_ID` INT,
  `Author_Name` VARCHAR(20),
  `Book_ID` INT,
  `Book_Genre` VARCHAR(20),
  `Date_Published` DATE,
  PRIMARY KEY (`Author_ID`),
  FOREIGN KEY (`Book_ID`) REFERENCES `Books`(`Book_ID`)
);

CREATE TABLE `Book` (
  `Book_ID` INT,
  `Book_Name` VARCHAR(20),
  `Book_Genre` VARCHAR(20),
  `Author_ID` INT,
  `Price` DECIMAL,
  `Stock` INT,
  PRIMARY KEY (`Book_ID`),
  FOREIGN KEY (`Author_ID`) REFERENCES `Authors`(`Author_ID`)
);