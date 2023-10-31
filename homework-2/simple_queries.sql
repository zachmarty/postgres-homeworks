-- Напишите запросы, которые выводят следующую информацию:
-- 1. "имя контакта" и "город" (contact_name, city) из таблицы customers (только эти две колонки)
SELECT contact_name, city from customers

-- 2. идентификатор заказа и разницу между датами формирования (order_date) заказа и его отгрузкой (shipped_date) из таблицы orders
SELECT order_date, shipped_date from orders

-- 3. все города без повторов, в которых зарегистрированы заказчики (customers)
select ship_city from orders where customer_id is not null group by ship_city;

-- 4. количество заказов (таблица orders)
select count(*) from orders;

-- 5. количество стран, в которые отгружался товар (таблица orders, колонка ship_country)
with countrys (ship_country) as (select distinct ship_country from orders) select count(*) from countrys;
