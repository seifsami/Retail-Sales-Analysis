# Retail Sales Data Analysis

Description: Using SQL and Tableau to explore,analyize and visualize a dataset regarding sales information.

About the dataset: Dataset obtained from [here](https://www.kaggle.com/datasets/rohitsahoo/sales-forecasting). Data set contains information for the retail sales of a superstore for 4 years. Specifically has the following, Row ID, Order ID, Order Date, Ship Date, Ship Mode, Customer ID,	Customer Name, Segment, Country, City,	State,	Postal Code, Region, Product ID, Category, Sub-Category, Product Name and Sales.

I began by first importing this csv into PostgreSQL, where I then cleaned and explored the data. [A direct link to the code and the full process can be found here]([https://github.com/seifsami/Sales-Data-Analysis/blob/main/Sales_Data_Analysis.sql]).

**Example SQL Analysis**
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
  
<img width="417" alt="Screen Shot 2022-09-12 at 12 41 47 PM" src="https://user-images.githubusercontent.com/97905607/189711068-ee16d44a-4ecd-43cb-9252-5b010e2a4d6b.png">

After the data had been cleaned and explored I imported it into Tableau for further analysis and visualization. Full results can be found here [Tableau link](https://public.tableau.com/shared/4DZ8KBQKM?:display_count=n&:origin=viz_share_link)
![Sales_Project_Dashboard](https://user-images.githubusercontent.com/97905607/189713733-00dc06ed-eee5-4be4-b98b-5f769206d636.png)

