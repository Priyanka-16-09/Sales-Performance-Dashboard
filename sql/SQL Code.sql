CREATE DATABASE sales_project;
use sales_project;
CREATE TABLE sales_data (
    order_id VARCHAR(50),
    order_date VARCHAR(20),
    ship_date VARCHAR(20),
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(150),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,2)
);
SELECT * FROM sales_data LIMIT 10;

select sum(sales)  as total_sales from sales_data;
select region,sum(sales)  as total_sales from sales_data
group by region;

select customer_name, sum(sales) as total_sales from sales_data
group by customer_name
order by total_sales desc
limit 10;

select category, sum(profit) as total_profit from sales_data
group by category;

select YEAR(order_date) as year, MONTH(order_date) as month , SUM(sales) as total_sales from sales_data
group by YEAR(order_date), MONTH(order_date)
order by year, month;


select product_name, sum(profit) as total_profit from sales_data
group by product_name
having total_profit<0;

select product_name, sum(profit) as total_profit from sales_data
group by product_name
order by total_profit desc
limit 5;

SET SQL_SAFE_UPDATES = 0;

UPDATE sales_data
SET order_date = STR_TO_DATE(order_date, '%d-%m-%Y');

ALTER TABLE sales_data
MODIFY order_date DATE;

SET SQL_SAFE_UPDATES = 1;

SELECT order_date FROM sales_data LIMIT 5;










