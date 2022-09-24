--1. Total cost, revenue and profit by both region and item type?


select Item_Type, sum(cost) as Total_cost, sum(revanue) as total_revanue, sum(profit) as total_profit
from Orders
Group by Item_type
Order by Item_type;
Select r.region, sum(o.cost) as Tota_cost_region, sum(o.revanue) as total_revanue_region, sum(o.profit) as total_profit_region
from Orders as o inner join Regions as r
on o.Country = r.Country
Group by r.region
Order by r.region;


--2. How many orders of Beverages are there in 2011?

Select concat('Total_order_beverages_order_2011_are: ',count(Order_ID)) from Orders
Where Item_Type = 'Beverages' and year(order_date)='2011';


--3. For each item type, what is the country which gains the max profit? 

Select top 1 Item_type, country, sum(profit) as TPPC 
from Orders
Where Item_type = 'Baby Food'
Group by Item_type,country
Order by TPPC desc
Select top 1 Item_type, country, sum(profit) as TPPC 
from Orders
Where Item_type = 'Beverages'
Group by Item_type,country
Order by TPPC desc
Select top 1 Item_type, country, sum(profit) as TPPC 
from Orders
Where Item_type = 'Cereal'
Group by Item_type,country
Order by TPPC desc
Select top 1 Item_type, country, sum(profit) as TPPC 
from Orders
Where Item_type = 'Clothes'
Group by Item_type,country
Order by TPPC desc
Select top 1 Item_type, country, sum(profit) as TPPC 
from Orders
Where Item_type = 'Cosmetics'
Group by Item_type,country
Order by TPPC desc
Select top 1 Item_type, country, sum(profit) as TPPC 
from Orders
Where Item_type = 'Fruits'
Group by Item_type,country
Order by TPPC desc
Select top 1 Item_type, country, sum(profit) as TPPC 
from Orders
Where Item_type = 'Household'
Group by Item_type,country
Order by TPPC desc
Select top 1 Item_type, country, sum(profit) as TPPC 
from Orders
Where Item_type = 'Meat'
Group by Item_type,country
Order by TPPC desc


--4. Which region has longest average delivery time in 2016? How long?

select top 1 r.region, avg(datediff(day,o.Order_date,o.Ship_Date)) as longest_delivery_time	
From Orders o inner join Regions r
On o.country = r.country
Where year(o.Order_date) = 2016
Group by r.region
Order by longest_delivery_time desc;


--5. Which item type contributes most profit in Jan? 

Select top 1 Item_type, sum(profit) as Top1_Profit_Jan
from Orders
Where  month(Order_date) = 1
Group by Item_type
Order by Top1_Profit_Jan desc;


--6. What is total profit of top 5 countries which are sorted by Online channel orders?

Select sum(D.top_profit) as Total_Profit_of_Top5_countries_sorted_by_Online_chanle from
(Select top 5 sum(profit) as top_profit from orders
where Sales_Channel = 'Online'
Group by country
Order by top_profit desc ) D


--7. Evaluate business situation. Illustrate your insights by chart. In your opinion, what does the company should improvise?