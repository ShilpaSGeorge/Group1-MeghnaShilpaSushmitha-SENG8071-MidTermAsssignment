## DATABASE TESTING MID-TERM GROUP PROJECT- GROUP1

### TEAM MEMBERS RESPONSIBILITIES
1. Meghana - 
2. Shilpa - Creating Author and Book Tables, performing CRUD ,queries for finding Power Writers and Transcript
3. Sushmitha - 

### REFERENCE LINKS
1. https://github.com/VasudhaAmbre/Spring-Boot-BookStore-Application/blob/main/OBS.sql


### TABLES
1.Authors


| Attribute Name  | Attribute Type|
| ------------- |:-------------:|
| Author_ID  (PK)   | INT           |
| Author_Name   | VARCHAR(20)   |
| DOB| DATE          |
| Book_Genre    | VARCHAR(20)   |


2.Books

| Attribute Name  | Attribute Type|
| ------------- |:-------------:|
| Book_ID  (PK)   | INT           |
| Book_Name   | VARCHAR(50)   |
| Book_Genre    | VARCHAR(20)   |
| Author_ID    (FK)   | INT           |
|Date_Published | DATE|
| Price| DECIMAL         |
|Stock| INT|
|Book_Type| VARCHAR(20)|

3.Customers

| Attribute Name  | Attribute Type|
| ------------- |:-------------:|
| Customer_ID  (PK)   | INT           |
| Customer_Name   | VARCHAR(50)   |
| Customer_Email    | VARCHAR(25)   |
| Customer_Address   | VARCHAR(25)     |
|Customer_phone | VARCHAR(10)|

4.Reviews

| Attribute Name  | Attribute Type|
| ------------- |:-------------:|
| Review_ID  (PK)   | INT           |
| Customer_ID (FK)   | INT   |
| Book_ID       | INT           |
| Rating_level       | INT           |
| Review_Published| DATE          |

5. Sales

| Attribute Name  | Attribute Type|
| ------------- |:-------------:|
| SALE_ID  (PK)   | INT           |
| Book_ID   | INT   |
| Book_Genre    | VARCHAR(20)   |
| Customer_ID (FK)   | INT   |
| Sale_Price     | DECIMAL           |
|Date_sold | DATE|





### SQL CODE BLOCK TO CREATE DATABASE
```
CREATE DATABASE Online BookStore Project;
```
### DDL/DML for the Tables and perform CRUD 
###### *****CREATE OPERATION*****
```
CREATE TABLE `Authors` (
  `Author_ID` INT,
  `Author_Name` VARCHAR(20),
  `DOB` DATE,
  `Book_Genre` VARCHAR(20),
  
  PRIMARY KEY (`Author_ID`)
  
);

INSERT INTO Authors VALUES(1001,'J K ROWLING','26 -06 -1997','FANTASY'),(1002,'Peter Rob','03 -01 -2013','COMPUTERS'),
(1003,'Brothers Grim','12-06-1918','FAIRY TALE'), (1004,'Carlos','03 -01 -2013','COMPUTERS');
```
###### *****READ OPERATION*****
```
SELECT * FROM Authors 
WHERE Book_Genre = 'FANTASY';
```
###### *****UPDATE OPERATION*****
```
UPDATE Authors 
SET Author_Name = 'Brothers Grimm'
WHERE Author_ID = 1003;
```

###### *****DELETE OPERATION*****
```
DELETE FROM Authors 
WHERE Author_Name = 'Carlos';
```
```
CREATE TABLE `Books` (
  `Book_ID` INT,
  `Book_Name` VARCHAR(50),
  `Book_Genre` VARCHAR(20),
  `Author_ID` INT,
  `Date_Published` DATE,
  `Price` DECIMAL,
  `Stock` INT,
  PRIMARY KEY (`Book_ID`),
  FOREIGN KEY (`Author_ID`) REFERENCES `Authors`(`Author_ID`)
);

<<<<<<< HEAD
INSERT INTO
=======
INSERT INTO Books VALUES(2001, 'Harry Potter Part 1','FANTASY',1001,'26-07-1997', 230.56, 10),(2002, 'Database Systems','COMPUTERS',1002, '12-03-1998', 330.56, 15), 
(2003, 'Snow White','FAIRY TALE',1003,'27-08-1918', 200.00, 20), (2004, 'Harry Potter Part 2','FANTASY',1001,'29-06-1998', 230.56, 12), (2006, 'The Running Grave','FANTASY',1001, '12-01-2023', 280.56, 15) ;
>>>>>>> b09c545640f8f4b9bf7a902d29cf8ea2dcdfefef
```
### SQL QUERIES FOR THE REQUIREMENTS
1.Power writers (authors) with more than X books in the same genre published within the last X years
```
SELECT A.Author_ID,
A.Author_Name

FROM Authors as A
INNER JOIN Books as B
ON A.Author_ID = B.Author_ID
WHERE A.Book_Genre = B.Book_Genre
AND EXTRACT(YEAR FROM B.Date_Published) >= (EXTRACT(YEAR FROM CURRENT_DATE) - 30)
AND B.Date_Published >= (CURRENT_DATE) - 10
GROUP BY A.Author_ID
HAVING COUNT (DISTINCT B.Book_ID)>2;

```
2.Loyal Customers who has spent more than 1000 dollars in the last year
```
SELECT Customer_ID, SUM(Sale_Price) AS Total_Spending
FROM Sales
WHERE Date_sold >= DATEADD(YEAR, -1, CURRENT_DATE)
GROUP BY Customer_ID
HAVING SUM(Sale_Price) > 1000;


```
3. Well Reviewed books that has a better user rating than average
```
SELECT B.Book_ID, B.Book_Title
FROM Books AS B
JOIN Reviews AS R ON B.Book_ID = R.Book_ID
GROUP BY B.Book_ID, B.Book_Title
HAVING AVG(R.Rating_level) > (SELECT AVG(Rating_level) FROM Reviews);


```
4. Most popular genre by sales
```
SELECT Book_Genre, SUM(Sale_Price) AS Total_Sales
FROM Sales
GROUP BY Book_Genre
ORDER BY Total_Sales DESC
LIMIT;


```
5. Well Reviewed books that has a better user rating than average
```
SELECT * from Reviews
FROM Books AS B
ORDER BY Review_Published DESC
LIMIT 10;


```
### TYPESCRIPT INTERFACE
```
interface Online BookStore Project{
  

create: 
{
  Author_ID:number;
  Author_Name:string;
  Book_ID : number;
  Book_Genre : string;
  Date_Published : number;
};

insert : 
{
  Author_ID:1003;
  Author_Name: 'Brothers Grimm';
  Book_ID = 1918;
  Book_Genre = 'Fairy Tale';
  Date_Published = '12-06-1918';
};


}
```