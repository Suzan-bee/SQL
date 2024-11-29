USE sql_store;
USE sql_inventory;

/* Query 1
To select all columns from table customer which is ordered by first name
*/
							
SELECT *
FROM  customers
-- where customer_id=1
order by first_name;


/* Query 2
To select specific columns i.e first_name, last_name, and points from table customer 
and to create a new column called points_10 which adds 10 to the current points value.
*/							
SELECT last_name, first_name, points, points+10 
FROM  customers;


/* Task 1	creating a new columun called discuount factor using the equation
   discount_factor= (points+10)*100
*/
SELECT   last_name, first_name, points, (points+10 )*100 AS dicount_factor
FROM  customers ;


/* Task 2 retriecing columns name unit price from the product table and 
   creating a new columun called new_price using the equation
   new_price= unit_price*1.1
   i.e increasing the product price by 10%
*/
SELECT  name, unit_price, unit_price*1.1 AS new_price
FROM products;


/*Task 3 Retrieving all columns for customers whose 
birth_date is later than January 1, 1990. */
SELECT *
FROM customers
WHERE birth_date > '1990-01-01';




# Task 4-  Retrieving the name of the product with most amount in stock.
SELECT name,quantity_in_stock	
FROM products
ORDER BY quantity_in_stock DESC
LIMIT 1;



# Task 5  Retrieving the name of the most expensive product.
SELECT name, unit_price	
FROM products
ORDER BY unit_price DESC
LIMIT 1;


# Task 6 Retrieving the oldest customer from customers table 
SELECT first_name, last_name, address, birth_date
FROM customers
ORDER BY birth_date ASC
LIMIT 1;
