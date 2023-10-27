-- SQL-команды для создания таблиц
create table customers(
customer_id varchar(10) primary key,
company_name text,
contact_name varchar(30)
);

create table employees(
employee_id serial primary key,
first_name varchar(10),
last_name varchar(10),
title varchar(30),
birth_date date,
notes text
);

create table orders(
order_id serial primary key,
customer_id varchar(10) not null,
employee_id integer not null,
order_date date,
ship_city varchar(20)
);