USE northwind;

/*
=========================================================
Analysis 1: Revenue by Country
=========================================================

Business Question:
Which countries generate the highest sales revenue?

Objective:
Identify Northwind's strongest revenue-generating markets
and compare sales performance across customer countries.

Revenue Formula:
Revenue = UnitPrice × Quantity × (1 - Discount)

=========================================================
*/

SELECT
    c.Country,
    FORMAT(
        SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),
        2
    ) AS TotalRevenue
FROM customers AS c
INNER JOIN orders AS o
    ON c.CustomerID = o.CustomerID
INNER JOIN orderdetails AS od
    ON o.OrderID = od.OrderID
GROUP BY c.Country
ORDER BY SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) DESC;

/*
=========================================================
Results Summary

• USA generated the highest revenue (245,584.61).
• Germany ranked second with revenue of 230,284.63.
• Austria (128,003.84), Brazil (106,925.78) and France (81,358.32)
  were also among the highest-performing countries.
• Denmark recorded the lowest revenue (3,266.02) among the countries
  included in the analysis.

=========================================================
Business Insight

The analysis shows that Northwind's revenue is concentrated in a small
number of high-performing markets, particularly the USA and Germany.
These countries contribute a significant proportion of total sales,
while several other markets generate considerably lower revenue.

=========================================================
Recommendation

• Continue strengthening customer relationships in the highest-
  performing markets.
• Investigate opportunities to increase sales in lower-performing
  countries through targeted marketing and customer engagement.
• Conduct further analysis of customer numbers, order frequency,
  average order value and profitability before making strategic
  business decisions.

=========================================================
*/



/*
=========================================================
Analysis 2: Monthly Revenue Trend
=========================================================

Business Question:
How has Northwind's sales revenue changed over time?

Objective:
Analyse monthly sales revenue to identify trends, periods
of growth, and fluctuations in business performance over
time.

Revenue Formula:
Revenue = UnitPrice × Quantity × (1 - Discount)

=========================================================
*/
SELECT
    DATE_FORMAT(o.OrderDate, '%Y-%m') AS OrderMonth,
    FORMAT(
        SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),
        2
    ) AS MonthlyRevenue
FROM orders AS o
INNER JOIN orderdetails AS od
    ON o.OrderID = od.OrderID
GROUP BY DATE_FORMAT(o.OrderDate, '%Y-%m')
ORDER BY DATE_FORMAT(o.OrderDate, '%Y-%m');

/*
=========================================================
Results Summary

- Monthly revenue fluctuated throughout the period.
- Revenue increased from August 1994 (£27,861.89) to
  November 1994 (£35,931.40).
- December 1994 recorded a stronger performance
  (£47,184.04).
- Revenue continued to vary during 1995, with some months
  exceeding £50,000 in sales.

Business Insight

Sales revenue does not remain constant throughout the year.
The fluctuations suggest possible seasonal demand, changes
in customer purchasing behaviour or promotional activity.

Recommendation

Investigate the reasons behind high-performing months and
determine whether successful sales strategies can be repeated.
Further analysis should compare monthly order volume,
customer numbers and product performance to understand the
drivers of revenue growth.
=========================================================
*/


/*
=========================================================
Analysis 3: Average Order Value (AOV)

Business Question:
What is the average revenue generated per order?

Objective:
Calculate the average amount spent on each order to
understand customer purchasing behaviour and support
pricing and sales strategies.

Revenue Calculation:
UnitPrice × Quantity × (1 - Discount)
=========================================================
*/

SELECT
    ROUND(
        AVG(OrderTotal),
        2
    ) AS AverageOrderValue
FROM
(
    SELECT
        o.OrderID,
        SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS OrderTotal
    FROM orders AS o
    INNER JOIN orderdetails AS od
        ON o.OrderID = od.OrderID
    GROUP BY o.OrderID
) AS OrderValues;
/*
=========================================================
Results Summary

- The average revenue generated per order was £1,525.05.
- This represents the average amount customers spent on each
  completed order in the Northwind database.

Business Insight

Customers spend an average of £1,525.05 per order, providing
a useful benchmark for measuring sales performance. Monitoring
Average Order Value helps the business evaluate customer
spending behaviour and assess the effectiveness of pricing,
bundling and promotional strategies.

Recommendation

The company should explore opportunities to increase Average
Order Value through product bundling, cross-selling,
up-selling and targeted promotions. Future analysis should
compare Average Order Value across customer segments,
countries and product categories to identify where the
greatest opportunities for growth exist.
=========================================================
*/