# Sales-Data-Analysis

Description: Using SQL and Tableau to explore,analyize and visualize a dataset regarding sales information.

About the dataset: Dataset obtained from [here](https://www.kaggle.com/datasets/rohitsahoo/sales-forecasting). Data set contains information for the retail sales of a superstore for 4 years. Specifically has the following, Row ID, Order ID, Order Date, Ship Date, Ship Mode, Customer ID,	Customer Name, Segment, Country, City,	State,	Postal Code, Region, Product ID, Category, Sub-Category, Product Name and Sales.

I began by first importing this csv into PostgreSQL, where I then cleaned and explored the data. [A direct link to the code and the full process can be found here](https://github.com/seifsami/Sales-Data-Analysis/blob/main/Sales_Data_Analysis.sql).

Example SQL Analysis
  Query:
```
  SELECT 
    DATE_TRUNC('month',order_date) AS  order_month, COUNT(sale) AS count, SUM(sale)
FROM 
    sales_data
GROUP BY 
    DATE_TRUNC('month',order_date)
ORDER BY 
    DATE_TRUNC('month',order_date) DESC;

```
  Output:
  

