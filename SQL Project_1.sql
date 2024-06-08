Use restaurant_db

-- " ANALYZE MENU TABEL"-----------------

-- 1. View the Menu item table.
 SELECT *
 FROM menu_items;

-- 2.Find the No of items on the Menu
SELECT COUNT(*) FROM menu_items;
-- OR 
SELECT COUNT( item_name)
FROM menu_items;

-- 3.what are the least and most expensive item on the menu?
SELECT * FROM menu_items
ORDER BY PRICE
LIMIT 1; 

SELECT * FROM menu_items
ORDER BY PRICE DESC
LIMIT 1;

-- 4. How many italian disces are there in the menu ?
SELECT COUNT(*) FROM menu_items
WHERE category = "Italian";

-- 5. What are the least and most expensive italian dishes on the menu?
SELECT * 
 FROM menu_items
 WHERE category = "Italian"
 ORDER BY price;
 
 SELECT * 
 FROM menu_items
 WHERE category = "Italian"
 ORDER BY price DESC;
 
 -- 6. How many dishes are there in each category
 SELECT category, COUNT(ï»¿menu_item_id) AS Num_dishes
 FROM menu_items
 Group by category;
 
 -- 7. What is the advarage price of each category
 SELECT category, AVG(price) AS Adv_price
 FROM menu_items
 Group by category;
 
 -- " ANALYZE ORDER TABLE"---------
 
 -- 8. View the order details table?
 SELECT * FROM order_details;
 
 -- 9.What is the date range of the table ?
 SELECT MIN(order_date),MAX(order_date) FROM order_details;
 
 -- 10. How many orders are made within this date range ?
 SELECT COUNT(DISTINCT order_id) FROM order_details;
 
 -- 11. How many items were ordered with in this data range ?
 SELECT COUNT(*) FROM order_details;
 
 -- 12. Which orders had the most number of item ?
 SELECT order_id, COUNT(item_id) AS Num_items
 FROM order_details
 GROUP BY order_id
 ORDER BY Num_items DESC;
 
 -- 13. How many orders had more than 12 times
 SELECT COUNT(*) FROM
  (SELECT order_id, COUNT(item_id) AS Num_items
 FROM order_details
 GROUP BY order_id
 HAVING Num_items >12) AS num_orders;
 
 -- "ANALYZE CUSTOMER BEHAVIOUR"-----------------------------
 
 -- 14. Combine the menu_items and order_details table into a single table.
 SELECT * FROM menu_items;
 SELECT * FROM order_details;
 -- DESCRIBE menu_items;
 -- DESCRIBE order_details;
 
SELECT *
FROM order_details AS od
LEFT JOIN menu_items AS mi
ON od.item_id = mi.ï»¿menu_item_id


 -- 15 .What were the least and most ordered item ? what categories were they in? 

 SELECT item_name,category,COUNT(ï»¿order_details_id) AS num_purchases
FROM order_details AS od
LEFT JOIN menu_items AS mi
ON od.item_id = mi.ï»¿menu_item_id
GROUP BY item_name,category
ORDER BY num_purchases DESC;

SELECT item_name,category,COUNT(ï»¿order_details_id) AS num_purchases
FROM order_details AS od
LEFT JOIN menu_items AS mi
ON od.item_id = mi.ï»¿menu_item_id
GROUP BY item_name,category
ORDER BY num_purchases ASC;

-- 16 . What were the top 5 orders that spent the most money ?

SELECT  order_id,SUM(price) AS Total_Spend
FROM order_details AS od
LEFT JOIN menu_items AS mi
ON od.item_id = mi.ï»¿menu_item_id
GROUP BY order_id
ORDER BY Total_Spend DESC
LIMIT 5;


-- 17. View the details of the highest spend orders. what insights can you gather from the results ?

SELECT category,COUNT(item_id) AS Num_items
FROM order_details AS od
LEFT JOIN menu_items AS mi
ON od.item_id = mi.ï»¿menu_item_id
WHERE order_id = 440
GROUP BY category;

-- 18. View the details of the top 5 hight spend orders. what insights can you gathere from the Result?
SELECT order_id,category,COUNT(item_id) AS Num_items
FROM order_details AS od
LEFT JOIN menu_items AS mi
ON od.item_id = mi.ï»¿menu_item_id
WHERE order_id IN (440,2075,1957,330,2675)
GROUP BY order_id,category;












 
 
 
 
 
 
 
 
 
 
 
 









