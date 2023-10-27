"""Скрипт для заполнения данными таблиц в БД Postgres."""
import psycopg2
import csv

conn = psycopg2.connect(
    host = 'localhost',
    user = 'postgres',
    password = '1',
    database = 'north_data'
)
cur = conn.cursor()

customers_data = []
with open('homework-1/north_data/customers_data.csv', 'r', encoding='utf-8') as f:
    reader = csv.reader(f, delimiter=',')
    customers_data = [row for row in reader]
employees_data = []
with open('homework-1/north_data/employees_data.csv', 'r', encoding='utf-8') as f:
    reader = csv.reader(f, delimiter=',')
    employees_data = [row for row in reader]
orders_data = []
with open('homework-1/north_data/orders_data.csv', 'r', encoding='utf-8') as f:
    reader = csv.reader(f, delimiter=',')
    orders_data = [row for row in reader]

for i in range(1, len(customers_data)):
    cur.execute('insert into customers values(%s, %s, %s)', (
        customers_data[i][0], 
        customers_data[i][1], 
        customers_data[i][2]
    ))

for i in range(1, len(employees_data)):
    cur.execute('insert into employees values(%s, %s, %s, %s, %s, %s)', (
        employees_data[i][0], 
        employees_data[i][1], 
        employees_data[i][2], 
        employees_data[i][3], 
        employees_data[i][4], 
        employees_data[i][5]
    ))

for i in range(1, len(orders_data)):
    cur.execute('insert into orders values(%s, %s, %s, %s, %s)', (
        orders_data[i][0],
        orders_data[i][1],
        orders_data[i][2],
        orders_data[i][3],
        orders_data[i][4],
    ))
conn.commit()

cur.close()
conn.close()
