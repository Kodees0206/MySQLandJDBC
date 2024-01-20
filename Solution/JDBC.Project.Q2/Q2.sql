create database GL;
use GL;

-- create an employee table
create table employee (
	id int primary key,
    name varchar(50) not null,
    email_id varchar(50) not null,
    phone_number varchar(10) not null );
    
select * from employee;