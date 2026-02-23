Retail KPI Dashboard (SQL + CSV + Power BI)

📂 Project Contents
- /data/pricing_revenue.csv → Raw dataset
- /queries/Query.sql → SQL queries
- README.txt → Project overview

📊 KPI Categories

1. Revenue Analysis
   - Code 1: Monthly discount vs revenue growth (2020–2024 comparison)
   - Code 13: Marketing ROI by month
   - Code 14: ROI + cost per unit sold
   - Code 15: Month-over-Month revenue growth
   - Code 16: Festival top category contribution %

2. Pricing Strategy
   - Code 2: Festival vs non-festival discount bands
   - Code 8: Revenue loss vs competitor pricing
   - Code 9: Price gap vs competitor pricing
   - Code 10: Price gap × units sold → revenue impact

3. Returns Dashboard
   - Code 3: Units returned per category per year

4. Logistics Dashboard
   - Code 4: Logistics cost YoY growth
   - Code 7: Festival vs non-festival logistics cost ratio

5. Marketing Efficiency
   - Code 11: CAC Festival vs Non-Festival
   - Code 12: CAC normalized for BI

6. Seasonal Performance
   - Code 5: Festival vs non-festival discount band comparison
   - Code 6: Festival vs non-festival logistics cost efficiency

📈 Power BI Visualization Suggestions
- Revenue Analysis → Line chart (MoM growth), Matrix (ROI by month), KPI cards
- Pricing Strategy → Bar chart (price gap), KPI card (revenue impact), scatter plot (discount vs growth)
- Returns Dashboard → Column chart (units returned YoY)
- Logistics Dashboard → Line chart (YoY logistics cost trend), stacked bar (category breakdown)
- Marketing Efficiency → Clustered bar (CAC comparison), KPI card (festival vs non-festival ratio)
- Seasonal Performance → Stacked bar (festival vs non-festival contribution), matrix (discount band performance)

⚙️ How to Run
1. Import `pricing_revenue.csv` into your SQL environment.
2. Run queries from `/queries` folder.
3. Connect SQL outputs to Power BI for visualization.
4. Use the README as a guide to map queries → dashboards.

📌 Recruiter Note
This project demonstrates:
- Advanced SQL (window functions, CTEs, conditional aggregation)
- Business KPI framing (Revenue, Pricing, Returns, Logistics, Marketing, Seasonal)
- Power BI-friendly normalization for dashboards
- Portfolio-ready storytelling for data analytics roles




***Project Overview***


1. This query calculates Year‑over‑Year Revenue Growth (%) by comparing each year’s total revenue against the prior year.
Recruiters and stakeholders can use this KPI to evaluate company performance trends, identify growth acceleration or slowdown, and support strategic planning.
Recruiter Note: The query leverages window functions (LAG) for efficient time‑series analysis, demonstrating advanced SQL skills beyond basic aggregation.

2.This query produces a monthly revenue dashboard by product category, enabling management to track sales trends across Home, Fashion, Electronics, Beauty, and Grocery segments.
Recruiters and stakeholders can use this KPI to identify seasonal patterns, evaluate category performance, and guide marketing or inventory decisions.
Recruiter Note: The query demonstrates conditional aggregation and clean reporting practices, with safeguards against missing data.

3.This query calculates each product category’s contribution to total revenue (%), sorted by revenue size.
Recruiters and stakeholders can use this KPI to identify dominant categories, evaluate portfolio mix, and guide resource allocation.
Recruiter Note: The query demonstrates aggregation, percentage contribution analysis, and clean reporting practices with error handling.

4.This query evaluates festival‑season product performance by category and year, combining customer satisfaction (ratings), sales volume (units sold), and product quality (return rate).
Recruiters and stakeholders can use this KPI set to identify high‑performing categories during peak seasons, optimize inventory, and improve customer experience.
Recruiter Note: The query demonstrates scalable grouping, multi‑KPI aggregation, and clean reporting practices.

5.This query calculates Inventory Turnover Ratios and converts them into Days Inventory Outstanding (DIO) across product categories and years.
Recruiters and stakeholders can use these KPIs to evaluate supply chain efficiency, identify slow‑moving categories, and optimize working capital.
Recruiter Note: The query demonstrates scalable grouping, KPI calculation, and error handling for real‑world robustness.

6.This query compares festival vs. non‑festival revenue contribution by product category, highlighting how seasonal demand drives overall sales.
Recruiters and stakeholders can use this KPI to identify categories that rely heavily on festive seasons, optimize marketing spend, and plan inventory accordingly.
Recruiter Note: The query demonstrates conditional aggregation, contribution analysis, and clean reporting practices with error handling.

7.This query compares average daily revenue during festival vs. non‑festival periods across years.
Recruiters and stakeholders can use this KPI to evaluate seasonal demand patterns, optimize marketing spend, and plan inventory allocation.
Recruiter Note: The query demonstrates conditional aggregation, daily normalization, and error handling for real‑world robustness.

8.This query analyzes monthly discount strategies vs. revenue growth trends across multiple years.
Recruiters and stakeholders can use this KPI to evaluate the effectiveness of promotions, identify seasonal growth patterns, and optimize pricing strategies.
Recruiter Note: The query demonstrates conditional aggregation, dynamic grouping, and clean reporting practices.

9.This query compares festival vs. non‑festival revenue performance across discount bands (1–10%, 11–20%, etc.).
Recruiters and stakeholders can use this KPI to evaluate promotional effectiveness, identify optimal discount ranges, and adjust pricing strategies for seasonal campaigns.
Recruiter Note: The query demonstrates conditional aggregation, comparative analysis, and error handling for real‑world robustness.

10.This query calculates units returned per product category per year, providing insights into product quality and customer satisfaction.
Recruiters and stakeholders can use this KPI to identify categories with high return rates, evaluate product performance, and guide quality improvement initiatives.
Recruiter Note: The query demonstrates KPI calculation, dynamic grouping, and clean reporting practices.

11. This query evaluates logistics cost efficiency by comparing festival vs. non‑festival seasons across years.
KPIs include average logistics cost and YoY growth %, enabling stakeholders to identify seasonal cost drivers and optimize supply chain planning.
Recruiter Note: The query demonstrates window functions, conditional aggregation, and Power BI‑friendly normalization.

12. This query calculates Marketing ROI (Revenue ÷ Marketing Spend) and Marketing Cost per Unit Sold by product category, year, and month.
Recruiters and stakeholders can use these KPIs to evaluate campaign efficiency, identify seasonal ROI patterns, and optimize marketing budgets.
Recruiter Note: The query demonstrates conditional aggregation, ROI calculation, and Power BI‑friendly normalization.

13. This query calculates Customer Acquisition Cost (CAC) for festival vs. non‑festival seasons, and compares YoY changes.
Recruiters and stakeholders can use this KPI to evaluate marketing efficiency across seasonal campaigns, identify cost spikes, and optimize acquisition strategies.
Recruiter Note: Demonstrates conditional aggregation, CAC calculation, and Power BI‑friendly normalization.

14.This query calculates the price gap vs. competitor pricing and estimates the revenue impact by multiplying the gap with units sold.
Recruiters and stakeholders can use this KPI to identify categories priced at a premium or discount relative to competitors, and quantify the potential revenue gain/loss.

15. This query calculates average monthly revenue growth % and derives Month‑over‑Month change by product category.
Recruiters and stakeholders can use this KPI to evaluate seasonality, detect growth spikes, and monitor performance trends.
Recruiter Note: Demonstrates window functions, MoM growth calculation, and BI‑friendly normalization.

16. This query identifies the top‑contributing product category per month during festival seasons and calculates its share of total festival revenue.
Recruiters and stakeholders can use this KPI to evaluate seasonal category dominance, optimize inventory allocation, and guide promotional focus.
Recruiter Note: Demonstrates ranking logic (ROW_NUMBER), contribution analysis, and BI‑friendly normalization.

 