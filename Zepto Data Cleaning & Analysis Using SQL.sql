-- Data exploration

-- no.of rows
select count(*) from zepto_v2;

-- selecting sample data
select * from zepto_v2 limit 5;

-- finding null values
select * from zepto_v2 where 
Category is null
or name is null
or mrp is null
or discountPercent is null
or availableQuantity is null
or discountedSellingPrice is null
or weightInGms is null
or outOfStock is null
or quantity is null;

-- finding max mrp, product name
select name, max(mrp) from zepto_v2 group by name order by max(mrp) desc;

-- finding min mrp, product name
select name, min(mrp) from zepto_v2 group by name order by min(mrp);

-- serial_no column addition 
ALTER TABLE zepto_v2
ADD COLUMN serial_no INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;

-- selecting unique categories
select distinct Category from zepto_v2 order by category;

-- products in stock vs out of stock
select outOfStock, count(serial_no) from zepto_v2 group by outOfStock ;

-- product names present multiple times
SELECT name, COUNT(serial_no) AS "Number of SKUs"
FROM zepto_v2 GROUP BY name HAVING count(serial_no) > 1
ORDER BY count(serial_no) DESC;

-- Data cleaning 

-- products with price <= 0
select * from zepto_v2 where mrp <=0 or discountedSellingPrice <=0;
 
 -- found it, deleted the row wrt serial_no
delete from zepto_v2 where serial_no =3574;

-- error found converted paise to rupees 
update zepto_v2 set mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

select mrp,discountedSellingPrice from zepto_v2;


--data analysis

-- Q1. Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT name, mrp, discountPercent FROM zepto_v2 ORDER BY discountPercent DESC LIMIT 10;

-- Q2.What are the Products with High MRP but Out of Stock

SELECT DISTINCT name,mrp FROM zepto_v2
WHERE outOfStock = TRUE and mrp > 300 ORDER BY mrp DESC;

-- Q3.Calculate Estimated Revenue for each category
SELECT category, SUM(discountedSellingPrice * availableQuantity) AS total_revenue FROM zepto_v2 
GROUP BY category 
ORDER BY total_revenue;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT DISTINCT name, mrp, discountPercent FROM zepto_v2
WHERE mrp > 500 AND discountPercent < 10 
ORDER BY mrp DESC, discountPercent DESC;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT category,
ROUND(AVG(discountPercent),2) AS avg_discount FROM zepto_v2
GROUP BY category
ORDER BY avg_discount DESC LIMIT 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram FROM zepto_v2
WHERE weightInGms >= 100
ORDER BY price_per_gram;

-- Q7.Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto_v2;

-- Q8.What is the Total Inventory Weight Per Category 
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight FROM zepto_v2
GROUP BY category
ORDER BY total_weight;


