SELECT * FROM ecomsales.order_details;
-- left join table order and order detail:
SELECT o.`Order ID`,de.`Order ID`,o.`Order Date`,o.CustomerName,o.State,City,de.Amount,de.Profit,de.Quantity,de.Category,de.`Sub-Category`
FROM ecomsales.orders AS o
LEFT JOIN ecomsales.order_details AS de
ON de.`Order ID`=o.`Order ID`;

-- 1.  select data sales on 2018

SELECT *
FROM ecomsales.orders AS o
LEFT JOIN ecomsales.order_details AS de
ON de.`Order ID`=o.`Order ID`
WHERE o.`Order Date`LIKE '%2018%';

-- total sale 2018: 1,310,271 - 963 orders
SELECT COUNT(*), SUM(quantity*amount) AS total_2018sales
FROM ecomsales.orders AS o
LEFT JOIN ecomsales.order_details AS de
ON de.`Order ID`=o.`Order ID`
WHERE o.`Order Date`LIKE '%2018%';

-- monthly sales and category sale. Have to change Order date to month then group by order date and category 
SELECT
de.Category,
SUM(Quantity*Amount) AS actual_sales,
MONTH(STR_TO_DATE(`Order Date`, '%d-%m-%y')) AS order_month
FROM ecomsales.orders AS o
LEFT JOIN ecomsales.order_details AS de
ON de.`Order ID`=o.`Order ID`
WHERE o.`Order Date`LIKE '%2018%'
GROUP BY de.Category, MONTH(STR_TO_DATE(`Order Date`, '%d-%m-%y'));

-- LARGEST CUSTOMER 
SELECT CustomerName,State, SUM(Quantity*Amount) as sale_per_person
FROM ecomsales.orders AS o
LEFT JOIN ecomsales.order_details AS de
ON de.`Order ID`=o.`Order ID`
WHERE o.`Order Date`LIKE '%2018%' 
GROUP BY CustomerName, State
ORDER BY SUM(Quantity*Amount) DESC;

-- => Customer Shishu in Andhra pradesh brings the most sales. 
-- Which state has the most sales: => Magarahstra
SELECT State, SUM(Quantity * Amount) as state_sales
FROM ecomsales.orders AS o
LEFT JOIN ecomsales.order_details AS de
ON de.`Order ID`=o.`Order ID`
WHERE o.`Order Date`LIKE '%2018%'
GROUP BY State
ORDER BY SUM(Quantity * Amount) DESC;

-- Monthly sales compare target
-- monthly sales and category sale. Have to change Order date to month then group by order date and category 
SELECT
de.Category,
SUM(Quantity*Amount) AS actual_sales,
MONTH(STR_TO_DATE(`Order Date`, '%d-%m-%y')) AS order_month
FROM ecomsales.orders AS o
LEFT JOIN ecomsales.order_details AS de
ON de.`Order ID`=o.`Order ID`
WHERE o.`Order Date`LIKE '%2018%'
GROUP BY de.Category, MONTH(STR_TO_DATE(`Order Date`, '%d-%m-%y'));


SELECT * 
FROM ecomsales.sales_target
WHERE `Month of Order Date` LIKE '%18%';

