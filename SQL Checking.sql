CREATE DATABASE Online BookStore Project;

CREATE TABLE `Authors` (
  `Author_ID` INT,
  `Author_Name` VARCHAR(20),
  `DOB` DATE,
  `Book_Genre` VARCHAR(20),
  
  PRIMARY KEY (`Author_ID`)
  
);

INSERT INTO Authors VALUES(1001,'J K ROWLING','26 -06 -1976','FANTASY'),
(1002,'Peter Rob','03 -01 -1980','COMPUTERS'),
(1003,'Brothers Grim','12-06-1780','FAIRY TALE'), 
(1004,'Carlos','03 -01 -1950','COMPUTERS');

SELECT * FROM Authors 
WHERE Book_Genre = 'FANTASY';


UPDATE Authors 
SET Author_Name = 'Brothers Grimm'
WHERE Author_ID = 1003;



DELETE FROM Authors 
WHERE Author_Name = 'Carlos';

CREATE TABLE `Books` (
  `Book_ID` INT,
  `Book_Name` VARCHAR(50),
  `Book_Genre` VARCHAR(20),
  `Author_ID` INT,
  `Date_Published` DATE,
  `Price` DECIMAL,
  `Stock` INT,
  `Book_Type` VARCHAR(20),
  PRIMARY KEY (`Book_ID`),
  FOREIGN KEY (`Author_ID`) REFERENCES `Authors`(`Author_ID`)
);

INSERT INTO Books VALUES(2001, 'Harry Potter Part 1','FANTASY',1001,'26-07-1997', 230.56, 10, 'e-book'),
(2002, 'Database Systems','COMPUTERS',1002, '12-03-1998', 330.56, 15, 'physical book'), 
(2003, 'Snow White','FAIRY TALE',1003,'27-08-1918', 200.00, 20, 'audiobook'),
(2004, 'Harry Potter Part 2','FANTASY',1001,'29-06-1998', 230.56, 12, 'e-book'), 
(2006, 'The Running Grave','FANTASY',1001, '12-01-2023', 280.56, 15, 'audiobook') ;

SELECT A.Author_ID,
A.Author_Name

FROM Authors as A
INNER JOIN Books as B
ON A.Author_ID = B.Author_ID
WHERE A.Book_Genre = B.Book_Genre
AND A.Date_Published >= (YEAR(CURRENT_DATE) - 30)
GROUP BY A.Author_ID
HAVING COUNT (DISTINCT B.Book_ID)>2;

SELECT Customer_ID, SUM(Sale_Price) AS Total_Spending
FROM Sales
WHERE Date_sold >= DATEADD(YEAR, -1, CURRENT_DATE)
GROUP BY Customer_ID
HAVING SUM(Sale_Price) > 1000;

SELECT B.Book_ID, B.Book_Title
FROM Books AS B
JOIN Reviews AS R ON B.Book_ID = R.Book_ID
GROUP BY B.Book_ID, B.Book_Title
HAVING AVG(R.Rating_level) > (SELECT AVG(Rating_level) FROM Reviews);

SELECT Book_Genre, SUM(Sale_Price) AS Total_Sales
FROM Sales
GROUP BY Book_Genre
ORDER BY Total_Sales DESC
LIMIT 1;

SELECT * from Reviews
ORDER BY Review_Published DESC
LIMIT 10;

