-- Напишите запросы, которые выводят следующую информацию:
-- 1. заказы, доставленные в страны France, Germany, Spain (таблица orders, колонка ship_country)
select * from orders where ship_country = 'France' or ship_country = 'Germany' or ship_country = 'Spain'; 

-- 2. уникальные страны и города, куда отправлялись заказы, отсортировать по странам и городам (таблица orders, колонки ship_country, ship_city)
select distinct ship_country, ship_city from orders order by ship_country, ship_city;

-- 3. сколько дней в среднем уходит на доставку товара в Германию (таблица orders, колонки order_date, shipped_date, ship_country)
select shipped_date - order_date as order_time_in_days from orders where ship_country = 'Germany';

-- 4. минимальную и максимальную цену среди продуктов, не снятых с продажи (таблица products, колонки unit_price, discontinued не равно 1)
select min(unit_price) as minimal, max(unit_price) as maximum from products where not discontinued = 1;

-- 5. минимальную и максимальную цену среди продуктов, не снятых с продажи и которых имеется не меньше 20 (таблица products, колонки unit_price, units_in_stock, discontinued не равно 1)
select min(unit_price) as minimal, max(unit_price) as maximum from products where not discontinued = 1 and units_in_stock > 20;