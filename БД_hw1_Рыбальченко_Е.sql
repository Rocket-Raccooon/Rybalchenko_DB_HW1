
-- Рыбальченко Елена Павловна
-- Системы хранения и обработки данных
-- Домашнее задание №1
-- "Создание и нормализация базы данных"

-- 1.Продумать структуру базы данных и отрисовать в редакторе.

-- ОТВЕТ:
-- Скриншот структуры прилагается.
-- (Все заданные первичные ключи считаем уникальными)
-- Скрипт:

--Table product {
--  product_id integer [primary key]
--  brand varchar
--  product_line varchar
--  product_class varchar
--  product_size varchar
--  list_price float
--  standart_cost float
--}

--Table customer  {
--  customer_id integer [primary key] 
--  first_name varchar
--  last_name varchar
--  gender varchar
--  DOB varchar
--  job_title varchar
--  job_industry_category varchar
--  wealth_segment varchar
--  deceased_indicator varchar
--  owns_car varchar
--  address varchar
--}

--Table customer_adress{
--  adress varchar [primary key]
--  postcode varchar
--  state varchar
--  country varchar
--}

--Table transaction {
--  transaction_id integer [primary key]
--  transaction_date varchar
--  product_id integer
--  customer_id integer
--  online_order bool
--  order_status varchar
--  }

--Ref: transaction.customer_id > customer.customer_id 
--Ref: transaction.product_id > product.product_id
--Ref: customer.address > customer_adress.adress

-- 2.Нормализовать базу данных(1НФ — 3НФ),
-- описав, к какой нормальной форме приводится таблица
-- и почему таблица в этой нормальной форме изначально не находилась.

-- ОТВЕТ:
-- Исходная таблица изначально находится в 1НФ, так как
-- все атрибуты в таблице простые, каждая ячейка содержит скалярное значение.
-- Посредством разделения основной таблицы на несколько подтаблиц
-- происходит приведение базы данных к 3НФ, так как соблюдаются условия 2НФ:
-- (БД в 1НФ и каждый столбец, не являющийся ключом, зависит от первичного ключа) 
-- + устраняются транзитивные зависимости.
-- (Такие колонки, как gender,job_industry_category,state,country и т.д.
-- можно бы было вынести в справочники, но в рамках этого задания не будем усложнять схему).


-- 3.Создать все таблицы в DBeaver,
-- указав первичные ключи к таблицам, 
-- правильные типы данных,
-- могут ли поля быть пустыми или нет 
-- (использовать команду CREATE TABLE).

--ОТВЕТ:
-- (Все заданные первичные ключи считаем уникальными)
-- Создание таблицы product:
create table product_hw1(
 product_id int4 not null 
,brand text
,product_line text
,product_class text
,product_size text
,list_price float4
,standart_cost float4
);
-- Создание первичного ключа:
alter table product_hw1 add primary key (product_id);

-- Создание таблицы customer:
create table customer_hw1(
customer_id int4 not null
,first_name text
,last_name text
,gender text
,DOB varchar(10)
,job_title text
,job_industry_category text
,wealth_segment text
,deceased_indicator text
,owns_car varchar(3)
,address text not null  
property_valuation int4
);
-- Создание первичного ключа:
alter table customer_hw1 add primary key (customer_id);

-- Создание таблицы customer_address:
create table customer_address_hw1(
address text not null
,postcode text
,state text
,country text
);

-- Создание первичного ключа:
alter table customer_address_hw1 add primary key (address);

-- Создание таблицы transaction:
create table transaction_hw1(
 transaction_id int4 not null
,product_id int4 not null
,customer_id int4 not null
,transaction_date varchar(10)
,online_order text
,order_status text
)
-- Создание первичного ключа:
alter table transaction_hw1 add primary key (transaction_id);

-- Импорт данных производится средствами DBeaver 
-- из заранее подготовленных csv-файлов (прилагаются),
-- скриншоты прилагаются.


--DROP TABLE transaction_hw1;
--DROP TABLE customer_hw ;
--DROP TABLE product_hw ;
--DROP TABLE customer_address_hw1 ;