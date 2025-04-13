# 1. Need all the data
select * from mobile_sales_data;

# 2. Total revenue generated per brand.
select Brand, sum(Price) as price from mobile_sales_data
group by Brand
order by price desc;

# 3. Top 5 selling products by quantity.
select Brand, Product, sum('Quantity Sold') as quantity from mobile_sales_data
group by Brand, Product
order by quantity desc limit 5;

# 4. Average price of mobile phones vs laptops.
select Product, format(avg(Price),2) as price from mobile_sales_data
where Product in ('Mobile Phone', 'Laptop')
group by Product
order by price;

# 5.Which region has the highest sales volume?
select Region, sum(Price) as price from mobile_sales_data
group by Region
order by price desc;

# 6. List all products with SSD of 1TB or more.
select Brand, SSD from mobile_sales_data
where SSD like '%TB';

# 7. Which processor is most common among laptops?
select distinct(`Processor Specification`) as processor from mobile_sales_data
where Product in ('Laptop');

# 8. What is the most expensive product sold?
select Brand, sum(`Quantity Sold`) as sold from mobile_sales_data
group by Brand
order by sold desc;

# 9. Revenue contribution from each region.
select Region, sum(Price) as revenue from mobile_sales_data
group by Region
order by revenue desc;

# 10. List customers who purchased more than 3 items.
select `Customer Name`, count(`Customer Name`) as count from mobile_sales_data
group by `Customer Name`
order by count desc;
