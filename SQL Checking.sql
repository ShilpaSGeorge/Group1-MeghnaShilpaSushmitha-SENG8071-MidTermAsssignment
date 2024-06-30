CREATE DATABASE Online BookStore Project;

CREATE TABLE `Authors` (
  `Author_ID` INT,
  `Author_Name` VARCHAR(20),
  `Book_ID` INT,
  `Book_Genre` VARCHAR(20),
  `Date_Published` DATE,
  PRIMARY KEY (`Author_ID`),
  FOREIGN KEY (`Book_ID`) REFERENCES `Books`(`Book_ID`)
);

INSERT INTO Authors VALUES(1001,'J K ROWLING',2001,'FANTASY',26 -06 -1997),(1002,'Peter Rob',2002,'COMPUTERS',03 -01 -2013),
(1003,'Brothers Grimm',1918,'FAIRY TALE',12 -06 -1918),(1001,'J K ROWLING',2004,'FANTASY',02 -07 -1998), (1002,'Carlos',2005,'COMPUTERS',03 -01 -2013),
(1001,'J K ROWLING',2006,'FICTION',26 -09 -2023) ;


SELECT * FROM Authors 
WHERE Book_Genre = 'FANTASY';


UPDATE Authors 
SET Book_ID = 2003
WHERE Author_ID = 1003;



DELETE FROM Authors 
WHERE Author_Name = 'Carlos';

CREATE TABLE `Books` (
  `Book_ID` INT,
  `Book_Name` VARCHAR(50),
  `Book_Genre` VARCHAR(20),
  `Author_ID` INT,
  `Price` DECIMAL,
  `Stock` INT,
  PRIMARY KEY (`Book_ID`),
  FOREIGN KEY (`Author_ID`) REFERENCES `Authors`(`Author_ID`)
);

INSERT INTO Books VALUES(2001, 'Harry Potter Part 1','FANTASY',1001, 230.56, 10),(2002, 'Database Systems','COMPUTERS',1002, 330.56, 15), 
(2003, 'Snow White','FAIRY TALE',1003, 200.00, 20), (2004, 'Harry Potter Part 2','FANTASY',1001, 230.56, 12), (2006, 'The Running Grave','FANTASY',1001, 280.56, 15) ;

SELECT A.Author_ID,
A.Author_Name

FROM Authors as A
INNER JOIN Books as B
ON A.Author_ID = B.Author_ID
WHERE A.Book_Genre = B.Book_Genre
AND A.Date_Published >= (YEAR(CURRENT_DATE) - 30)
GROUP BY A.Author_ID
HAVING COUNT (DISTINCT B.Book_ID)>2;

