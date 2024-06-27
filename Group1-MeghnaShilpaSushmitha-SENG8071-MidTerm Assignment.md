## DATABASE TESTING MID-TERM GROUP PROJECT- GROUP1

### TEAM MEMBERS RESPONSIBILITIES
1. Meghna - 
2. Shilpa - Creating Author and Book Review Tables, performing CRUD and queries for finding Power Writers
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

3.Customers
4.Ratings



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
  `Book_ID` INT,
  `Book_Genre` VARCHAR(20),
  `Date_Published` DATE,
  PRIMARY KEY (`Author_ID`),
  FOREIGN KEY (`Book_ID`) REFERENCES `Books`(`Book_ID`)
);

INSERT INTO Authors VALUES(1001,'J K ROWLING',2001,'FANTASY',26 -06 -1997),(1002,'Peter Rob',2002,'COMPUTERS',03 -01 -2013),
(1003,'Brothers Grimm',1918,'FAIRY TALE',12 -06 -1918),(1001,'J K ROWLING',2004,'FANTASY',02 -07 -1998), (1002,'Carlos',2002,'COMPUTERS',03 -01 -2013) ;
```
###### *****READ OPERATION*****
```
SELECT * FROM Authors 
WHERE Book_Genre = 'FANTASY';
```
###### *****UPDATE OPERATION*****
```
UPDATE Authors 
SET Book_ID = 2003
WHERE Author_ID = 1003;
```

###### *****DELETE OPERATION*****
```
DELETE FROM Authors 
WHERE Author_Name = 'Carlos';
```
```
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

INSERT INTO 
```
### SQL QUERIES FOR THE REQUIREMENTS

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