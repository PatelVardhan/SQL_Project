create database SQL_EXERCISE_5;

use SQL_EXERCISE_5;

CREATE TABLE Pieces (
 Code INTEGER PRIMARY KEY NOT NULL,
 Name TEXT NOT NULL
 );
 
CREATE TABLE Providers (
 Code VARCHAR(40) 
 PRIMARY KEY NOT NULL,  
 Name TEXT NOT NULL 
 );
 
CREATE TABLE Provides (
 Piece INTEGER, 
 FOREIGN KEY (Piece) REFERENCES Pieces(Code),
 Provider VARCHAR(40), 
 FOREIGN KEY (Provider) REFERENCES Providers(Code),  
 Price INTEGER NOT NULL,
 PRIMARY KEY(Piece, Provider) 
 );
 
-- alternative one for SQLite
  /* 
 CREATE TABLE Provides (
 Piece INTEGER,
 Provider VARCHAR(40),  
 Price INTEGER NOT NULL,
 PRIMARY KEY(Piece, Provider) 
 );
 */
 
 
INSERT INTO Providers(Code, Name)
VALUES ('HAL','Clarke Enterprises'),
       ('RBT','Susan Calvin Corp.'),
       ('TNBC','Skellington Supplies');

INSERT INTO Pieces(Code, Name)
VALUES (1,'Sprocket'),
       (2,'Screw'),
       (3,'Nut'),
       (4,'Bolt');

INSERT INTO Provides(Piece, Provider, Price)
VALUES (1,'HAL',10),
       (1,'RBT',15),
       (2,'HAL',20),
       (2,'RBT',15),
       (2,'TNBC',14),
       (3,'RBT',50),
       (3,'TNBC',45),
       (4,'HAL',5),
       (4,'RBT',7);
       
/* 01 */
select name from pieces;

/* 02 */
select * from provides;

/* 03 */
select piece , avg(price) as averaegprice
from provides
group by piece;

/* 04 */
select p.name 
from providers p
join provides pr
on p.code = pr.provider
where pr.piece = 1;

/* 05 */
select pc.name as piecename
from pieces pc 
join provides pr 
on pc.code = pr.piece
where pr.provider = 'HAL';

/* 06 */
select pc.name as piecename , p.name as providername , pr.price
from provides pr
join pieces pc 
on pr.piece = pc.code
join providers p 
on pr.provider = p.code
where (pr.piece , pr.price) in 
(
	select piece , max(price)
    from provides
    group by piece
    );
    
/* 07 */
insert into provides (piece , provider , price)
values (1 , 'TNBC' , 7);

/* 08 */
update provides
set price = price + 1;

/* 09 */
delete from provides
where piece = 4 and provider = 'RBT';

/* 10 */
delete from provides 
where provider = 'RBT';