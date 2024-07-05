create database SQL_EXERCISE_2;

use SQL_EXERCISE_2;

CREATE TABLE Departments (
  Code INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  Budget decimal NOT NULL 
);

CREATE TABLE Employees (
  SSN INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  LastName varchar(255) NOT NULL ,
  Department INTEGER NOT NULL , 
  foreign key (department) references Departments(Code) 
);

INSERT INTO Departments(Code,Name,Budget)
VALUES(14,'IT',65000),
	  (37,'Accounting',15000),
      (59,'Human Resources',240000),
      (77,'Research',55000);

INSERT INTO Employees(SSN,Name,LastName,Department)
VALUES ('123234877','Michael','Rogers',14),
       ('152934485','Anand','Manikutty',14),
       ('222364883','Carol','Smith',37),
       ('326587417','Joe','Stevens',37),
       ('332154719','Mary-Anne','Foster',14),
       ('332569843','George','ODonnell',77),
       ('546523478','John','Doe',59),
       ('631231482','David','Smith',77),
       ('654873219','Zacary','Efron',59),
       ('745685214','Eric','Goldsmith',59),
       ('845657245','Elizabeth','Doe',14),
       ('845657246','Kumar','Swamy',14);
 
/* 01 */
select lastname from employees;

/* 02 */
select distinct lastname from employees;

/* 03 */
select * from employees
where lastname = 'Smith' ;

/* 04 */
select * from employees
where lastname = 'Smith' or lastname = 'doe';

/* 05 */
select * from employees
where department = 14;

/* 06 */
select * from employees
where department = 37 or department = 77;

/* 07 */
select * from employees
where lastname like 'S%' ;

/* 08 */
select sum(budget)  from departments;

/* 09 */
select department , count(*) as number_of_employees
from employees
group by department;

/* 10 */
select e.ssn, e.name as employeename, e.lastname , d.code as deptcode, d.name as deptname , d.budget
from employees e
join  departments d ON e.department = d.code;

/* 11 */
select e.name as employeename , e.lastname , d.name as departmentname , d.budget
from employees e
join departments d 
on e.department = d.code;

/* 12 */
select e.name as employeename , e.lastname 
from employees e
join departments d
on e.department = d.code
where d.budget > 60000;

/* 13 */
select code , name , budget
from departments
where budget > (select avg(budget) from departments);

/* 14 */
select d.name as departmentname
from departments d
join (
      select department , count(*) as employeecount
      from employees
      group by department
      having count(*) > 2
      )
      as deptemployeecount
on d.code = deptemployeecount.department;

/* 15 */
select e.name, e.lastname
from employees e
join departments d on e.department = d.code
where d.budget = (
    select min(budget)
    from departments
    where budget > (
        select min(budget)
		from Departments
    )
);


/* 16 */

insert into departments (code , name , budget)
value (11, 'quality assurance', 40000);

insert into employees (ssn , name , lastname , department)
value ('847219811', 'Mary', 'Moore', 11);

/* 17 */
update departments
set budget = budget * 0.9;

/* 18 */

update employees
set department = 14
where department = 77;

/* 19 */

delete from employees
where department = 14;

/* 20 */

delete from employees
where department in 
(
   select code
   from departments
   where budget > 60000
);

/* 21 */

delete from Employees;



