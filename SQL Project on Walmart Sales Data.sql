--select * from [dbo].[Sales]

--1) How many unique cities does Walmart data have ?

Select distinct city from [dbo].[Sales]

--2) In which city each branch have?

Select distinct Branch, city from [dbo].[Sales]

--3) How many Unique product lines does the data have?

Select count ( distinct Product_line )from [dbo].[Sales]

--4) What is the most common payment method?

Select Payment,count ( Payment ) as cnt from [dbo].[Sales]
Group by Payment
order by cnt asc

--5) What is the most selling product line?

Select Count (Quantity) as cnt, Product_line  from [dbo].[Sales]
Group by  Product_line
order by cnt desc 

--6) what is the total revenue by month?

ALTER TABLE [dbo].[Sales]
ADD [time_of_date] VARCHAR(50);

UPDATE [dbo].[Sales]
SET [time_of_date] = 
    CASE
        WHEN CAST([Time] AS TIME) BETWEEN '12:00:00' AND '16:00:00' THEN 'Afternoon'
        WHEN CAST([Time] AS TIME) BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        ELSE 'Evening'
    END;

ALTER TABLE [dbo].[Sales]
ADD [Month_Name] VARCHAR(50);

UPDATE [dbo].[Sales]
SET [Month_Name] = DATENAME(MONTH, [Date]);


Select sum (Total) as total_revenue, Month_name
From [dbo].[Sales]
Group by Month_name
order by total_revenue desc

--7) What month has largest COGS?

select sum(cogs) as COGS ,Month_Name
from [dbo].[Sales]
Group by Month_Name
order by COGS desc

--8) Which product line has largest revenue?

Select sum ( Total ) as Revenue, Product_line
from [dbo].[Sales]
Group by Product_line
Order by Revenue desc


--9) What is the city with the largest revenue?

Select sum(Total) as Revenue, City
from [dbo].[Sales]
Group by City
order by Revenue desc


--10) What product line has the largest VAT?

Select avg(Tax_5) as VAT, Product_line
from [dbo].[Sales]
Group by Product_line
order by VAT desc


--11)Fetch each product line and add a column to those product line showing good or bad. Good if it is greater than average sales?

Select avg(Quantity) from  [dbo].[Sales]

Alter table [dbo].[Sales]
add [QTY] varchar (50)

Update [dbo].[Sales]
set [QTY] =
CASE
        WHEN ( Quantity > 5) THEN 'Good'
        ELSE 'Bad'
    END;


Select Product_line, QTY 
from [dbo].[Sales]

--12) Which branch sold more products than average product sold?

select Branch, sum(Quantity ) as Products
from [dbo].[Sales]
Group by Branch
Having sum (Quantity )> (select AVG(Quantity) from [dbo].[Sales])

--13) What is the most common product line by gender?

Select Gender, Product_line, Count (Gender) as total_cnt
 from [dbo].[Sales]
Group by Gender, Product_line
Order by total_cnt desc

--14) What is the average rating of each product line?

Select Product_line, Avg(Rating) as Avearge
from [dbo].[Sales]
group by Product_line


-------------------------------------------------------------------------------------------------------------__________________________________________________________________________________


----------------------------------SALES----------------------------------------------------------

--15) Number of sales made in each time of the day per weekday

Alter table [dbo].[Sales]
 add Day Varchar (50)

 Update [dbo].[Sales]
set Day = DATENAME(weekday,Date)

Select Sum(Quantity) as sales,time_of_date, Day from [dbo].[Sales]
where Day = 'Wednesday'
Group by time_of_date, Day


--16) which of the customer type brings more revenue?

Select sum(Total) as Revenue, Customer_type
from [dbo].[Sales]
group by Customer_type
order by Revenue desc

--17) Which city has the highest tax percent or VAT?

Select city, sum(Tax_5) as VAT FROM [dbo].[Sales]
Group by city
order by VAT desc

--18) Which customertype pays the most in VAT?

Select Customer_type,Sum(Tax_5) as VAT
from [dbo].[Sales]
group by Customer_type
order by VAT desc

-----------------------------------------------------CUSTOMER-----------------------------------------------------

--19) How many unique customer types does the data have?

Select count (distinct(Customer_type)) from 
[dbo].[Sales]

--20) How many unique Payment methods does the data have?

Select Count(distinct(Payment)) from [dbo].[Sales]

--21) What is most common customer type?

Select Customer_type , count(*) as Cstm_cnt
from [dbo].[Sales]
Group by Customer_type

--22) What is gender of most of the customer?

Select Gender, Count(*) as Cnt
from [dbo].[Sales]
group by Gender

--23) What is gender distribution per bracnch?

Select Gender, count(Gender) as Gender_Distribution, Branch
from [dbo].[Sales]
Group by Branch, Gender

--24) Which time of the day does customers give more ratings?

Select * from [dbo].[Sales]


Select Sum(Rating) as RTNG, Time_of_date
from [dbo].[Sales]
Group by time_of_date
order by RTNG desc

--25) Which time of the day does customers give more ratings per branch?

Select Branch, Sum(Rating) as RTNG, Time_of_date
from [dbo].[Sales]
Group by time_of_date, Branch
order by RTNG desc

--26) Which day of the week has best average ratings?

Select Day, avg(Rating) as RTNG
from [dbo].[Sales]
Group by Day
order by RTNG desc

--27) Which day of the week has best average ratings per branch?

Select Day, avg(Rating) as RTNG
from [dbo].[Sales]
where branch = 'A'
Group by Day
order by RTNG desc

Select Day, avg(Rating) as RTNG
from [dbo].[Sales]
where branch = 'B'
Group by Day
order by RTNG desc

Select Day, avg(Rating) as RTNG
from [dbo].[Sales]
where branch = 'C'
Group by Day
order by RTNG desc





















	




