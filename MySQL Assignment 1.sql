create database employee;
use employee;

create table Departments(
department_id int primary key,
department_name varchar(100)
);

create table Location(
location_id int primary key,
location_name varchar(30)
);

create table Employees(
employee_id int Primary Key,
department_id int,
location_id int,
Employee_name varchar(50),
Gender enum('M','F'),
Age int,
Hire_date date,
Designation varchar(100),
Salary decimal(10,2),
foreign key (department_id) references Departments(department_id),
foreign key (location_id) references Location(location_id)
);
 
 -- Alter  Command
alter table employees
add column email varchar(100);

alter table employees
modify Designation varchar(200);

alter table employees
drop column age;

alter table employees
rename column Hire_date to date_of_joining;

-- 3. Table Renaming (RENAME)
rename table departments to Departments_Info;
rename table Location to Locations;

-- Table Truncation (TRUNCATE)

truncate table employees;

-- Database & Table Dropping (DROP)
drop table employees;
drop database employee;

-- Database Recreation
create database if  not exists employee;
use employee;

--  create Departments Table
create table Departments(
department_id int primary key,
department_name varchar(100) not null unique
);

create table Locations(
location_id int primary key auto_increment,
location_name varchar(30) not null unique
);

create table employees(
employee_id int primary key,
Employee_name varchar(50) not null,
Gender char(1) check(gender in ('M','F')),
Age int check(age>=18),
Hire_date date default(current_date()),
Designation varchar(100),
Salary decimal(10,2),
department_id int,
location_id int,
foreign key (department_id) references departments(department_id),
foreign key (location_id) references Locations(location_id)
);