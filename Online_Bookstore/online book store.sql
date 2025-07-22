DROP TABLE IF EXISTS books;
create table books(
	book_id	SERIAL	primary key,
	title	varchar(100)	not null,
	author	varchar(100)	not null,
	genre	varchar(100)	not null,
	published_year	INT	     not null,
	price	NUMERIC(10,2)	not null,
	stock	INT	not null
);

DROP TABLE IF EXISTS customers;
create table customers(
	customer_id	serial	primary key,
	name	varchar(50)	not null,
	email	varchar(50)	not null,
	phone	int	not null,
	city	varchar(50)	not null,
	country	varchar(50)	not null
);

DROP TABLE IF EXISTS orders;
create table orders(
	order_id serial primary key ,
	customer_id int references customers(customer_id),
	book_id int references books(book_id),
	order_date date,
	quantity int,
	total_amount numeric(10,2)

); -- customer and books table can not delete because it's reference is given in orders table

select * from books;
select * from customers;
select * from orders;

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'books';

-- Import data

COPY books(book_id,title,author,genre,published_year,price,stock )
from 'D:/SQL/SQL PROJECT/online_bookstore_books.csv'
CSV header;

COPY customers(customer_id	,name	,email	,phone	,city,	country)
from 'D:/SQL/SQL PROJECT/online_bookstore_customers.csv'
CSV header;

COPY orders(order_id,customer_id,book_id,order_date,quantity,total_amount)
from 'D:/SQL/SQL PROJECT/online_bookstore_orders.csv'
CSV header;

-- 1. retrieve all books in the 'fantacy' genre:
select * from books
where genre='Fantasy';


-- 2.find book published after year 1950
select title ,published_year from books 
where published_year>1950;

-- 3. list all customers from pakistan :
select * from customers
where country='Pakistan';

select * from customers;

-- 4. show orders placed in november 2023
select * from orders
where order_date between '2023-11-01' and  '2023-11-30';

-- 5. retrieve total stock of books avialable
select SUM(stock) as total_stock
from books;


-- 6.find details of most expensive book:
SELECT * from books order by price desc limit 1 ;

--7.show all customers who ordered more than 1 quantity of book

select * from orders;
SELECT * FROM orders
where quantity>1;

-- 8. retrieve all orders where total amount exceeds $20:
SELECT * FROM orders
where total_amount>20;

-- 9.list all genres avialble in the book table:
SELECT DISTINCT genre from books;

-- 10.find book with lowest stock:
select * from books;

select * from books order by stock asc limit 1;

-- 11. calculate total revenue generated from all orders:
SELECT * FROM orders;
SELECT sum(total_amount) as revenue from orders ;








