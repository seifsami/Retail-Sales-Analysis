/* First exploring the dataset. */
SELECT * 
FROM sales_data;

/* Row ID column is redundant, so will be dropping this. */
ALTER TABLE sales_data
  DROP COLUMN row_ID;

/* Next, exploring the country column. */

SELECT DISTINCT country
FROM sales_data;

/* United States is the only country, so we can drop the country column. */
ALTER TABLE sales_data
  DROP COLUMN country;

/* Now we will begin doing some analysis on this data. First we will explore the states with the most sales*/
SELECT
	state, SUM (sale)
FROM
	sales_data
GROUP BY
	state
ORDER BY
	SUM (sale) DESC
LIMIT 10;
/* I then repeated this but added a column for the percentage of the total sales*/
SELECT
	state, SUM (sale),100.0 * sum(sale) / (select sum(sale) from sales_data) AS Percent
FROM
	sales_data
GROUP BY
	state
ORDER BY
	SUM (sale) DESC
LIMIT 10;
/* I then wanted to explore the unique customers vs new customers
I began by searching for the unique customer ID's to see our total number of customers*/
SELECT COUNT(DISTINCT(customer_id)) FROM sales_data;
/*This returned 793 customer ID’s, I then queried to get only the return customers*/
SELECT 
    customer_id 
FROM   
    sales_data 
GROUP BY
     customer_id 
HAVING
     COUNT(*) > 1

/*This returned only customers with more than one purchase for a total of 787 results. 
Meaning only 6 customers have just one purchase. Let's investigate this next*/
SELECT 
    customer_name, COUNT(customer_id), sum(sale), 100.0 * sum(sale) / (select sum(sale) from sales_data) AS Percent 
FROM 
    sales_data
GROUP BY 
    customer_name
ORDER BY
	COUNT (customer_name) ASC
	limit 6;
/*Next I explored the most popular shipping method*/
SELECT 
    ship_mode, SUM(sale), 100.0 * sum(sale) / (select sum(sale) from sales_data) AS Percent 
FROM 
    sales_data
GROUP BY 
    ship_mode
ORDER BY 
    SUM(sale) DESC;

/*Finally, I explored the busiest months*/
SELECT 
    DATE_TRUNC('month',order_date) AS  order_month, COUNT(sale) AS count, SUM(sale)
FROM 
    sales_data
GROUP BY 
    DATE_TRUNC('month',order_date)
ORDER BY 
    DATE_TRUNC('month',order_date) DESC;

/*Now that we have thoroughly explored this data I will be importing it into Tableau for further analysis and visualization*/
