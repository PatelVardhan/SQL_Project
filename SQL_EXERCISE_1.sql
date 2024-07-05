create database SQL_EXERCISE_1;

use SQL_EXERCISE_1;

CREATE TABLE Manufacturers (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL,
  PRIMARY KEY (Code)   
);

CREATE TABLE Products (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL ,
  Price DECIMAL NOT NULL ,
  Manufacturer INTEGER NOT NULL,
  PRIMARY KEY (Code), 
  FOREIGN KEY (Manufacturer) REFERENCES Manufacturers(Code)
) ENGINE=INNODB;

INSERT INTO Manufacturers(Code,Name)
VALUES(1,'Sony'),
      (2,'Creative Labs'),
      (3,'Hewlett-Packard'),
      (4,'Iomega'),
      (5,'Fujitsu'),
      (6,'Winchester');

INSERT INTO Products(Code,Name,Price,Manufacturer)
VALUES(1,'Hard drive',240,5),
      (2,'Memory',120,6),
      (3,'ZIP drive',150,4),
      (4,'Floppy disk',5,6),
      (5,'Monitor',240,1),
      (6,'DVD drive',180,2),
      (7,'CD drive',90,2),
      (8,'Printer',270,3),
      (9,'Toner cartridge',66,3),
      (10,'DVD burner',180,2);

/* 01 */
select * from products;

/* 02 */
select name , price from products;

/* 03 */
select name, price from products
where price <= 200;

/* 04 */
select * from products 
where price between 60 and 120;

/* 05 */
SELECT Name, Price * 100 AS PriceInCents
FROM Products;

/* 06 */
SELECT AVG(Price) AS AVGG
FROM Products;

/* 07 */
select avg(price) as AVg
from products
where manufacturer = 2;

/* 08 */
SELECT COUNT(*) AS NOP
FROM Products
WHERE Price >= 180;

/* 09 */
select name , price 
from products
where price >= 180
order by price desc , name asc; 

/* 10 */
SELECT p.*, m.*
FROM Products p
INNER JOIN Manufacturers m ON p.Manufacturer = m.Code;

/* 11 */
select products.name , price , manufacturer
from products inner join manufacturers
on products.manufacturer = manufacturers.code;

/* 12 */
select manufacturer , avg(price) as AVg
from products
group by manufacturer;

/* 13 */
SELECT m.Name AS MName, AVG(p.Price) AS AveragePrice
FROM Products p
INNER JOIN Manufacturers m ON p.Manufacturer = m.Code
GROUP BY m.Name;

/* 14 */
select m.name from manufacturers m
join products p 
on m.code = p.Manufacturer
group by m.code, m.name 
having avg(p.price) >=150;

/* 15 */
select name , price
from products
order by price limit 1;

/* 16 */
select m.name as manufacturer_name , p.name as product_name , p.price as product_price
from manufacturers m
join products p
on m.Code = p.Manufacturer
where p.price = 
(
     select max(price)
     from products
     where manufacturer = m.code
);

/* 17 */
INSERT INTO Products(Code,Name,Price,Manufacturer)
values (11 ,'Loudspeakers', 70, 2);

/* 18 */
update products
set name = 'Laser Printer'
where code = 8;

/* 19 */
update products
set price = price * 0.9;
    
/* 20 */
update products
set price = price & 0.9
where price >= 120;








