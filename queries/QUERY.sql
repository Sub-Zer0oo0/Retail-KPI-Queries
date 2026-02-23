-- 1/
with f as 
(select 
*,
lag(total_revenue) over ( ORDER BY YEAR) AS lg
from
(select 
year,
round(sum(revenue) ,2) as Total_revenue
from pricing_revenue
group by year) t
)

select 
year,
Total_revenue,
round(((total_revenue/lg)-1) *100,2) as `Revenue_Growth%`
from f;

-- 2/
select  
Month,
round(sum(case when product_category = 'Home' then revenue end),2 )as Home,
round(sum(case when product_category = 'Fashion' then revenue end),2 )as Fashion,
round(sum(case when product_category = 'Electronics' then revenue end),2 )as Electronics,
round(sum(case when product_category = 'Beauty' then revenue end),2 )as Beauty,
round(sum(case when product_category = 'Grocery' then revenue end),2 )as Grocery
from pricing_revenue
group by month;

-- 3/
with c as 
(select 
sum(revenue) as Total_revenue
from pricing_revenue)

select product_category,
sum(revenue) as Revenue,
round((sum(revenue) / Total_revenue * 100 ) ,2) as `contribution_%`
 from pricing_revenue, c
 group by product_category , Total_revenue 
order by `contribution_%` desc;
-- 4/
select 
Year,
Product_Category,
ROUND(AVG(customer_rating),1) as Avg_Rating ,
	ROUND(sum(units_sold),1) AS Unit_Sold,
		ROUND(avg(return_rate), 2)  as `Avg_Return_rate %`
from pricing_revenue
where festival_season = 1
GROUP BY year , PRODUCT_CATEGORY
order by product_category , year
;

-- 5/
WITH T AS 
(select 
year,
Product_Category,
ROUND(	
	SUM( UNITS_SOLD )/
		AVG(INVENTORY_LEVEL),2) as Turnover
from pricing_revenue
GROUP BY year ,PRODUCT_CATEGORY
order by product_category)

SELECT
*,  
round((365/turnover),2) as DIO
FROM T
;

-- 6/
with t as
(select 
product_category,
round(sum(case when festival_season = 1 then revenue end ),2) as Festive_Seasons,
round(sum(case when festival_season = 0 then revenue end ),2) as Non_Festive_Seasons,
round(sum(revenue),2) as Total_revenue
from pricing_revenue
group by product_category)

select  
Product_Category,
	Festive_Seasons,
		concat(round((Festive_Seasons/Total_Revenue)*100,2),"%") 
		as Contribution,
	Non_Festive_Seasons,
		concat(round((Non_Festive_Seasons/Total_Revenue)*100,2),"%") 
		as Contribution,
Total_Revenue
from t;

-- 7/
with t as
(select 
year,
round(sum(case when festival_season = 1 then revenue end ),2) as Festive_Seasons,
	count(case when festival_season = 1 then revenue end ) as FS_Days,
round(sum(case when festival_season = 0 then revenue end ),2) as Non_Festive_Seasons,
	count(case when festival_season = 0 then revenue end ) as NFS_Days
from pricing_revenue
group by year)

select 
Year,
round(Festive_seasons/FS_days,2) as Festive_Daily_Revenue,
round(non_Festive_seasons/nFS_days,2) as Non_Festive_Daily_Revenue
from t;

-- 8/
select 
case Month
WHEN 1 THEN 'January' WHEN 2 THEN 'February' 
WHEN 3 THEN 'March' WHEN 4 THEN 'April' 
WHEN 5 THEN 'May' WHEN 6 THEN 'June' 
WHEN 7 THEN 'July' WHEN 8 THEN 'August' 
WHEN 9 THEN 'September' WHEN 10 THEN 'October' 
WHEN 11 THEN 'November' WHEN 12 THEN 'December' end as Month,
round(avg(case when year = 2020 then discount_percent end ),2) as '2020',
round(avg(case when year = 2020 then revenue_growth_percent end ),2) as `Rev_Grth(%)`,
round(avg(case when year = 2021 then discount_percent end ),2) as '2021',
round(avg(case when year = 2021 then revenue_growth_percent end ),2) as `Rev_Grth(%)`,
round(avg(case when year = 2022 then discount_percent end ),2) as '2022',
round(avg(case when year = 2022 then revenue_growth_percent end ),2) as `Rev_Grth(%)`,
round(avg(case when year = 2023 then discount_percent end ),2) as '2023',
round(avg(case when year = 2023 then revenue_growth_percent end ),2) as `Rev_Grth(%)`,
round(avg(case when year = 2024 then discount_percent end ),2) as '2024',
round(avg(case when year = 2024 then revenue_growth_percent end ),2) as `Rev_Grth(%)`

 from pricing_revenue
 group by month;
 
 -- 9/
with t as
(select  
product_category,
round(avg(case when discount_percent between 1 and 10 then revenue end),2 )as 'F_1%-10%',
round(avg(case when discount_percent between 11 and 20 then revenue end),2 )as 'F_11%-20%',
round(avg(case when discount_percent between 21 and 30 then revenue end),2 )as 'F_21%-30%',
round(avg(case when discount_percent between 31 and 40 then revenue end),2 )as 'F_31%-40%',
round(avg(case when discount_percent between 41 and 50 then revenue end),2 )as 'F_41%-50%',
round(avg(case when discount_percent between 51 and 60 then revenue end),2 )as 'F_51%-60%'
from pricing_revenue
where festival_season = 1
group by product_category)
,
f as
(select  
product_category,
round(avg(case when discount_percent between 1 and 10 then revenue end),2 )as 'NF_1%-10%',
round(avg(case when discount_percent between 11 and 20 then revenue end),2 )as 'NF_11%-20%',
round(avg(case when discount_percent between 21 and 30 then revenue end),2 )as 'NF_21%-30%',
round(avg(case when discount_percent between 31 and 40 then revenue end),2 )as 'NF_31%-40%',
round(avg(case when discount_percent between 41 and 50 then revenue end),2 )as 'NF_41%-50%',
round(avg(case when discount_percent between 51 and 60 then revenue end),2 )as 'NF_51%-60%'
from pricing_revenue
where festival_season = 0
group by product_category)
 
 select f.product_category,
t.`F_1%-10%`, f.`NF_1%-10%`, round(t.`F_1%-10%`/f.`NF_1%-10%`,2)as Ratio,
t.`F_11%-20%`, f.`NF_11%-20%`, round(t.`F_11%-20%`/f.`NF_11%-20%`,2)as Ratio,
 t.`F_21%-30%`, f.`NF_21%-30%`, round(t.`F_21%-30%`/f.`NF_21%-30%`,2)as Ratio,
 t.`F_31%-40%`, f.`NF_31%-40%`,round(t.`F_31%-40%`/f.`NF_31%-40%`,2)as Ratio,
 t.`F_41%-50%`, f.`NF_41%-50%`,round(t.`F_41%-50%`/f.`NF_41%-50%`,2)as Ratio,
 t.`F_51%-60%`, f.`NF_51%-60%` , round(t.`F_51%-60%`/f.`NF_51%-60%`,2)as Ratio from f
 JOIN T ON f.product_category = t.product_category;
 
--  10/
select Product_Category,
SUM(case when year = 2020 then return_unit end ) as '2020',
SUM(case when year = 2021 then return_unit end ) as '2021',
SUM(case when year = 2022 then return_unit end ) as '2022',
SUM(case when year = 2023 then return_unit end ) as '2023',
SUM(case when year = 2024 then return_unit end ) as '2024'
from
(select 
year,
product_category,
units_sold,
return_rate,
round(units_sold*(return_rate/100),0) as return_unit
 from pricing_revenue) t
group by product_category;

-- 11/
with c as
(SELECT 
Year,
	product_category,
	round(avg(case when festival_season = 1 then logistics_cost end),2 ) as Festival,
	round(avg(case when festival_season = 0 then logistics_cost end),2 ) as Non_Festival
 FROM pricing_revenue
 group by year , product_category
 order by product_category)
 
 select  
 year , product_category, 
Festival,
	round(( (festival /  lag(festival) over (partition by product_category order by year) ) -1) *100 ,2)
	as `YoY(%)`,
 Non_Festival,
	round(( (Non_festival /  lag(Non_festival) over (partition by product_category order by year) ) -1) *100 ,2)
	as `YoY(%)`,
 round(Festival / Non_Festival,2) as Logistics_Cost_Ratio
 from c;

    
 -- 12/ 
 select  
Product_category, Year,month,
		round( sum(revenue) / nullif( sum(marketing_spend ),0),2) as `Marketing_ROI`,
				round( sum(marketing_spend) / sum(units_sold ),2) as ` Mkt_Cost/Unit_Sold`
from pricing_revenue
group by YEAR , product_category , month
ORDER BY product_category, year, month ;
 
 -- 13/
-- CAC = Customer_Acquisition_Cost
with c as 
(select 
product_category, Year,
	ROUND(AVG(CASE WHEN festival_season = 1
		THEN marketing_spend/(website_traffic * (conversion_rate/ 100)) END),2) AS `Festive_CAC`,
	ROUND(AVG(CASE WHEN festival_season = 0
		THEN marketing_spend/(website_traffic * (conversion_rate/ 100)) END),2) AS `Non-Festive_CAC`
 from pricing_revenue
 GROUP BY product_category, YEAR
 order by product_category, YEAR)

 select *,
round(Festive_CAC/`Non-Festive_CAC`,2)  as Efficiency_Ratio
 from c ;
 
 -- 14/
with c as 
	(SELECT 
	Year, Product_Category,
	round(avg(competitor_price_index),3 ) as  Avg_Competitor_Price_Index ,
		avg(final_price) as avg_Price,
        round(avg(UNITS_SOLD ) ,2) AS Avg_unit_sold
	FROM 
    pricing_revenue 
    group by year,  product_category
	order by product_category)
    
select 
Year, Product_Category , Avg_Competitor_Price_Index , Avg_unit_sold,
round(avg_price - (Avg_Competitor_Price_Index * avg_price),2) as `Price_Discount/Premium`,
round((avg_price - (Avg_Competitor_Price_Index * avg_price)) * Avg_unit_sold,2)  as `Avg_Revenue_Impact`
 from c; 
 
 -- 15/
 with t as
(select 
product_category ,
  Month,
	round(avg(revenue_growth_percent),2 ) as Avg_revenue_growth
 from pricing_revenue
 group by  product_category , month
 order by product_category
 )

select *,
	round(((Avg_revenue_growth - lag(Avg_revenue_growth) over(partition by product_category)) /  
			lag(Avg_revenue_growth) over(partition by product_category) ) * 100 ,2) as `MoM_Growth_pct`
 from t;
 
 -- 16/
 
 WITH c AS (
    SELECT 
        year,
        month,
        product_category,
        ROUND(SUM(revenue),2) AS total_revenue,
        ROW_NUMBER() OVER(PARTITION BY year, month ORDER BY SUM(revenue) DESC) AS rn
    FROM pricing_revenue 
    WHERE festival_season = 1
    GROUP BY year, month, product_category
)
,
t as (
select year , month,round(sum(revenue),2) as Total
from pricing_revenue 
group by year , Month
)

SELECT c.Year, c.Month, c.Product_category , c.Total_Revenue 
,round((Total_Revenue / Total )*100,2) as Contribution
FROM c 
join t on c.year = t.year AND T.MONTH =  c.MONTH
where rn = 1
;