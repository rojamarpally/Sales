create database company;
SELECT *
FROM sales
WHERE Ship_Mode = 'economy' AND Total_Amount > 25000;
SELECT *
FROM Sales
WHERE Category = 'technology'
  AND Country = 'ireland'
  AND Order_Date > '2020-01-01';
  -----------------------------------------------------------------------
  -- List the top 10 most profitable sales transactions in descending order?
select * 
From Sales
order by Unit_Profit Desc
limit 10;                       -- top 10 transactions

select * 
From Sales
order by Unit_Profit Desc
limit 10,20 ;                       -- skip 10 records, showing next 20 records
------------------------------------------------------------------------------------

-- 4.	Find all customers whose name starts with ‘J’ and ends with ‘n’ ?
Select Customer_Name,Order_ID 
from sales
where Customer_Name Like 'J%N';
------------------------------------------------------------------------------------

-- 5.	Retrieve all the product names that contain ‘acco’ anywhere in the name?
select Order_ID, Product_Name 
From sales
where Product_Name Like "%Acco%";
------------------------------------------------------------------------------------

-- 6.	 Get the top 5 citites with the highest total sales amount ?
SELECT City, SUM(Total_Amount) AS Total_Sales
FROM Sales
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 5;
---------------------------------------------------------------------------------------
-- 7.	Display the second set of 10 records for customer _name And total amount in decreasing order.
Select Customer_Name,Total_Amount From sales
Order by Total_Amount DESC
Limit 10,10;
----------------------------------------------------------------------------------------
-- 8.	Find the total revenue, Average unit cost and total number of orders?
Select sum(Total_Amount) As `Total Revenue`,
           avg(Unit_Cost) As `average unit cost`,
           count(Order_ID) as `total number of orders`
from sales;
-------------------------------------------------------------------------------------------
-- 9.	Count unique number of region
Select count(distinct(Region)) as Unique_reg
from sales;
---------------------------------------------------------------------------------------------
-- 10.	Find the number of orders placed by each customer ?
Select Customer_Name,count(Order_ID) as Order_Count
from sales
Group by Customer_Name
order by Order_Count desc;
---------------------------------------------------------------------------------------------
-- 11.	 Rank 5 products based on total sales using Rank().
select Product_Name,sum(Total_Amount) as Total_Sales,
       Rank() over(order By sum(Total_Amount)DESC) AS Sales_Rank
from Sales
group by Product_Name
limit 5;