use superstores;
select * from cust_dimen;


/* 1. Write a query to display the Customer_Name and Customer Segment using alias 
name “Customer Name", "Customer Segment" from table Cust_dimen. */ 

SELECT 
    customer_name as 'Customer Name',
    customer_segment as 'Customer Segment'
FROM
    cust_dimen;

/* 2. Write a query to find all the details of the customer from the table cust_dimen 
order by desc. */

SELECT 
    *
FROM
    cust_dimen
ORDER BY customer_name DESC;

/* 3. Write a query to get the Order ID, Order date from table orders_dimen where 
‘Order Priority’ is high. */

SELECT 
    order_ID
FROM
    orders_dimen
WHERE
    Order_priority = 'High';

/*
4. Find the total and the average sales (display total_sales and avg_sales) */ 

SELECT 
    SUM(sales) AS toatal_sales, AVG(sales) AS avg_sales
FROM
    market_fact;

/* 5. Write a query to get the maximum and minimum sales from maket_fact table. */

SELECT 
    MAX(sales) AS Maximum_Sales, MIN(sales) AS Minimum_Sales
FROM
    market_fact;

/* 6. Display the number of customers in each region in decreasing order of  
no_of_customers. The result should contain columns Region, no_of_customers. */

SELECT 
    Region, COUNT(Cust_id) AS 'No. of Customers'
FROM
    cust_dimen
GROUP BY Region
ORDER BY COUNT(Cust_id);

/* 7. Find the region having maximum customers (display the region name and 
max(no_of_customers) */

SELECT 
    Region, COUNT(Cust_id) AS 'No. of Customers'
FROM
    cust_dimen
GROUP BY Region
ORDER BY COUNT(Cust_id) DESC
LIMIT 1;

/* 8. Find all the customers from Atlantic region who have ever purchased ‘TABLES’ 
and the number of tables purchased (display the customer name, no_of_tables 
purchased) */

SELECT 
    c.Region AS 'Region',
    c.Customer_Name AS 'Customer Name',
    p.Product_Sub_Category AS 'Product Sub Category',
    SUM(m.Order_Quantity) AS 'Order Quantity'
FROM
    market_fact m
        JOIN
    cust_dimen c ON m.Cust_id = c.Cust_id
        JOIN
    prod_dimen p ON m.Prod_id = p.Prod_id
WHERE
    c.Region = 'ATLANTIC'
        AND p.Product_Sub_Category = 'TABLES'
GROUP BY c.Customer_Name
ORDER BY SUM(m.Order_Quantity) DESC;


/* 9. Find all the customers from Ontario province who own Small Business. (display 
the customer name, no of small business owners) */


/* 10. Find the number and id of products sold in decreasing order of products sold 
(display product id, no_of_products sold) */

SELECT 
    Prod_id, SUM(Order_Quantity) AS 'no_of_products sold'
FROM
    market_fact
GROUP BY Prod_id;

/* 11. Display product Id and product sub category whose produt category belongs to 
Furniture and Technlogy. The result should contain columns product id, product 
sub category. */

SELECT 
    product_ID,
    p.Product_Category AS 'Product Category',
    p.Product_Sub_Category AS 'Product Sub Category'
FROM
    prod_dimen p
        JOIN
    prod_dimen p ON m.Prod_id = p.Prod_id
GROUP BY p.Product_Sub_Category
ORDER BY p.Product_Category;

/* 12. Display the product categories in descending order of profits (display the product 
category wise profits i.e. product_category, profits)? */

SELECT 
    p.Product_Category AS 'Product Category',
    ROUND(SUM(m.Profit), 2) AS 'Profits'
FROM
    market_fact m
        JOIN
    prod_dimen p ON m.Prod_id = p.Prod_id
GROUP BY p.Product_Category
ORDER BY SUM(m.Profit) DESC;

/* 13. Display the product category, product sub-category and the profit within each 
subcategory in three columns. */

SELECT 
    p.Product_Category AS 'Product Category',
    p.Product_Sub_Category AS 'Product Sub Category',
    ROUND(SUM(m.Profit), 2) AS 'Total Profits'
FROM
    market_fact m
        JOIN
    prod_dimen p ON m.Prod_id = p.Prod_id
GROUP BY p.Product_Sub_Category
ORDER BY p.Product_Category;

/* 14. Display the order date, order quantity and the sales for the order. */



/* 15. Display the names of the customers whose name contains the 
 i) Second letter as ‘R’
 ii) Fourth letter as ‘D’ */
 
 
/* 16. Write a SQL query to to make a list with Cust_Id, Sales, Customer Name and 
their region where sales are between 1000 and 5000. */

/* 17. Write a SQL query to find the 3rd highest sales. */

/* 18. Where is the least profitable product subcategory shipped the most? For the least 
profitable product sub-category, display the region-wise no_of_shipments and the 
profit made in each region in decreasing order of profits (i.e. region, 
no_of_shipments, profit_in_each_region) 

 → Note: You can hardcode the name of the least profitable product subcategory */