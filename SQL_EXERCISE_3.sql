create database SQL_EXERCISE_3;

use SQL_EXERCISE_3;

CREATE TABLE Warehouses (
   Code INTEGER NOT NULL,
   Location VARCHAR(255) NOT NULL ,
   Capacity INTEGER NOT NULL,
   PRIMARY KEY (Code)
 );
CREATE TABLE Boxes (
    Code CHAR(4) NOT NULL,
    Contents VARCHAR(255) NOT NULL ,
    Value REAL NOT NULL ,
    Warehouse INTEGER NOT NULL,
    PRIMARY KEY (Code),
    FOREIGN KEY (Warehouse) REFERENCES Warehouses(Code)
 ) ENGINE=INNODB;
 
 INSERT INTO Warehouses(Code,Location,Capacity) 
 VALUES (1,'Chicago',3),
        (2,'Chicago',4),
        (3,'New York',7),
		(4,'Los Angeles',2),
        (5,'San Francisco',8);
 
 INSERT INTO Boxes(Code,Contents,Value,Warehouse)
 VALUES ('0MN7','Rocks',180,3),
 ('4H8P','Rocks',250,1),
 ('4RT3','Scissors',190,4),
 ('7G3H','Rocks',200,1),
 ('8JN6','Papers',75,1),
 ('8Y6U','Papers',50,3),
 ('9J6F','Papers',175,2),
 ('LL08','Rocks',140,4),
 ('P0H6','Scissors',125,1),
 ('P2T6','Scissors',150,2),
 ('TU55','Papers',90,5);
 
 /* 01 */
 select * from warehouses;
 
 /* 02 */
 select * from boxes
 where value > 150;
 
 /* 03 */
 select distinct contents
 from boxes;
 
 /* 04 */
 select avg(value) as averagevalue
 from boxes;
 
 /* 05 */
 select warehouse , avg(value) as averagevalue
 from boxes
 group by warehouse;
 
 /* 06 */
 select warehouse , avg(value) as averagevalue
 from boxes
 group by warehouse
 having avg(value) > 150;
 
 /* 07 */
 select b.code , w.location
 from boxes b 
 join warehouses w 
 on b.warehouse = w.code;
 
 /* 08 */
 select w.code as warehousecode , count(b.code) as numofboxes
 from warehouses w 
 left join boxes b
 on w.code = b.warehouse
 group by w.code;
 
 /* 09 */
 select w.code
 from warehouses w
 join (
       select warehouse , count(*) as boxcount
       from boxes
       group by warehouse
) 
as box_counts
on w.code = box_counts.warehouse
where box_counts.boxcount > w.capacity;

 /* 10 */
 select b.code
 from boxes b
 join warehouses w 
 on b.warehouse = w.code
 where w.location = 'Chicago';
 
 /* 11 */
 insert into warehouses (code , location , capacity)
 values ((select coalesce(max(code) , 0) + 1 from warehouses) , 'New York' , 3);
 
 /* 12 */
 insert into boxes(code , contents , value , warehouse)
 values ('H5RT', 'papers', 200, 2);
 
 /* 13 */
 update	boxes
 set value = value * 0.85;
 
 /* 14 */
 delete from boxes
 where value < 100;
 
 /* 15 */
 delete from boxes
 where warehouse in (
      select w.code
      from warehouses w 
      join(
           select warehouse , count(*) as boxcount
           from boxes
           group by warehouse
      ) as box_counts
      on w.code = box_counts.warehouse
      where box_counts.boxcount > w.capacity
);
 
 /* 16 */
 create index idx_warehouse on boxes(warehouse);
 
 /* 17 */
 show index from boxes;
 
 /* 18 */
 drop index idx_warehouse on boxes;
