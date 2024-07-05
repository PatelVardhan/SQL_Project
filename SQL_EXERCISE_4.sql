create database SQL_EXERCISE_4;

use SQL_EXERCISE_4;

CREATE TABLE Movies (
  Code INTEGER PRIMARY KEY,
  Title VARCHAR(255) NOT NULL,
  Rating VARCHAR(255) 
);

CREATE TABLE MovieTheaters (
  Code INTEGER PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Movie INTEGER,  
    FOREIGN KEY (Movie) REFERENCES Movies(Code)
) ENGINE=INNODB;

INSERT INTO Movies(Code,Title,Rating)
VALUES (1,'Citizen Kane','PG'),
       (2,'Singin'' in the Rain','G'),
       (3,'The Wizard of Oz','G'),
       (4,'The Quiet Man',NULL),
       (5,'North by Northwest',NULL),
	   (6,'The Last Tango in Paris','NC-17'),
       (7,'Some Like it Hot','PG-13'),
       (8,'A Night at the Opera',NULL);
 
INSERT INTO MovieTheaters(Code,Name,Movie)
VALUES (1,'Odeon',5),
       (2,'Imperial',1),
       (3,'Majestic',NULL),
       (4,'Royale',6),
       (5,'Paraiso',3),
       (6,'Nickelodeon',NULL);
       
/* 01 */
select title from movies;

/* 02 */
select distinct rating
from movies;

/* 03 */
select * from movies
where rating is null;

/* 04 */
select * from movietheaters
where movie is null;

/* 05 */
select mt.code as theatercode, mt.name as theatername , m.code as moviecode , m.title as movietitle , m.rating as movierating
from movietheaters mt
left join movies m 
on mt.movie = m.code;

/* 06 */
select m.code as moviecode , m.title as movietitle , m.rating as movierating , mt.code as theatercode , mt.name as theatername
from movies m
left join movietheaters mt
on m.code = mt.movie;

/* 07 */
select m.title
from movies m
left join movietheaters mt
on m.code = mt.movie
where mt.movie is null;

/* 08 */
insert into movies (code , title , rating)
values ((select coalesce(max(code) , 0) + 1 from movies), 'One , Two , Three' , null);

/* 09 */
update movies 
set rating = 'G'
where rating is null;

/* 10 */ 
delete from movietheaters 
where movie in(
	select code 
    from movies
    where rating = 'NC-17'
);