# Walmart Sales Data Analysis

## Overview
This project analyzes Walmart sales data using SQL to derive insights into sales performance, customer behavior, and product lines. The dataset includes sales transactions, product details, customer demographics, and payment methods.

## Objectives
- Identify unique cities and product lines.
- Analyze sales performance by product line, city, branch, and time of day.
- Evaluate customer demographics and payment preferences.
- Assess revenue generation, tax contributions, and customer ratings.

## SQL Queries

### Sales Analysis
1. **How many unique cities does Walmart data have ?**
   ```SQL
   SELECT DISTINCT city FROM [dbo].[Sales];
   ```

2. **In which city each branch have?**
    ```SQL
    SELECT DISTINCT Branch, city FROM [dbo].[Sales];
      ```

3. **How many Unique product lines does the data have?**
    ```SQL
    SELECT COUNT(DISTINCT Product_line) FROM [dbo].[Sales];
     ```

4. **What is the most common payment method?**
    ```SQL
    SELECT Payment, COUNT(Payment) AS cnt 
    FROM [dbo].[Sales] 
    GROUP BY Payment 
    ORDER BY cnt DESC;
    ```

5. **What is the most selling product line?**
    ```SQL
   SELECT COUNT(Quantity) AS cnt, Product_line 
   FROM [dbo].[Sales] 
   GROUP BY Product_line 
   ORDER BY cnt DESC;
    ```

6. **what is the total revenue by month?**
    ```SQL
    SELECT SUM(Total) AS total_revenue, Month_Name 
    FROM [dbo].[Sales] 
    GROUP BY Month_Name 
    ORDER BY total_revenue DESC;
    ```

7. **What month has largest COGS?**
   ```SQL
   SELECT SUM(cogs) AS COGS, Month_Name 
   FROM [dbo].[Sales] 
   GROUP BY Month_Name 
   ORDER BY COGS DESC;
   ```

8. **Which product line has largest revenue?**
   ```SQL
   SELECT SUM(Total) AS Revenue, Product_line 
   FROM [dbo].[Sales] 
   GROUP BY Product_line 
   ORDER BY Revenue DESC;
   ```

9. **What is the city with the largest revenue?**
    ```SQL
   SELECT SUM(Total) AS Revenue, City 
   FROM [dbo].[Sales] 
   GROUP BY City 
   ORDER BY Revenue DESC;
   ```

10. **What product line has the largest VAT?**
    ```SQL
    SELECT AVG(Tax_5) AS VAT, Product_line 
    FROM [dbo].[Sales] 
    GROUP BY Product_line 
    ORDER BY VAT DESC;
    ```

11. **Fetch each product line and add a column to those product line showing good or bad. Good if it is greater than average sales?**
     ```SQL
    SELECT COUNT(DISTINCT Customer_type) 
    FROM [dbo].[Sales];
     ```

12. **Which branch sold more products than average product sold?**
     ```SQL
     SELECT Customer_type, COUNT(*) AS Cstm_cnt 
     FROM [dbo].[Sales] 
     GROUP BY Customer_type;
     ```

13. **What is the most common product line by gender?**
    ```SQL
    SELECT Gender, COUNT(*) AS Cnt 
    FROM [dbo].[Sales] 
    GROUP BY Gender;
     ```

14. **What is the average rating of each product line?**
    ```SQL
    SELECT Day, AVG(Rating) AS RTNG 
    FROM [dbo].[Sales] 
    GROUP BY Day 
    ORDER BY RTNG DESC;
    ```


## Contact Information

For inquiries, collaboration opportunities, or support, please reach out:

- **Email**: dharanikaligi0638@gmail.com
- **LinkedIn**: https://www.linkedin.com/in/dharani-kaligi-6b2338279/


    
    




