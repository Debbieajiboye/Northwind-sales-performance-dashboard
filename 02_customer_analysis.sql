USE northwind;

/*
=========================================================
NORTHWIND SALES ANALYSIS
File: 02_customer_analysis.sql

Purpose:
Analyse Northwind's customer base by location, order
activity and revenue contribution.
=========================================================
*/


/*
=========================================================
Analysis 1: Customers by Country

Business Question:
Which countries have the highest number of customers?

Objective:
Understand the geographical distribution of Northwind's
customer base.

Skills Demonstrated:
✔ COUNT()
✔ GROUP BY
✔ ORDER BY
✔ Customer Segmentation
=========================================================
*/

SELECT
    Country,
    COUNT(*) AS TotalCustomers
FROM customers
GROUP BY Country
ORDER BY TotalCustomers DESC;

/*
=========================================================
Results Summary:

- The USA has the largest customer base with 13 customers.
- Germany and France each have 11 customers.
- Brazil ranks fourth with 9 customers, while the UK has
  7 customers.
- Northwind serves customers across several international
  markets.

Business Insight:

Northwind has a broad international customer base, with the
USA representing its largest market by customer count.
However, countries with more customers do not necessarily
generate the highest revenue. Customer count should always
be analysed alongside sales performance to gain a complete
understanding of market value.

Recommendation:

Compare customer numbers with total revenue, average order
value and order frequency to identify the most profitable
markets and support strategic sales and marketing decisions.

=========================================================
*/


/*
=========================================================
Analysis 2: Top Customers by Number of Orders

Business Question:
Which customers placed the highest number of orders?

Objective:
Identify Northwind's most active customers based on order
frequency.

Skills Demonstrated:
✔ INNER JOIN
✔ COUNT()
✔ GROUP BY
✔ ORDER BY
✔ LIMIT
✔ Customer Activity Analysis
=========================================================
*/

SELECT
    c.CustomerID,
    c.CompanyName,
    c.Country,
    COUNT(o.OrderID) AS TotalOrders
FROM customers AS c
INNER JOIN orders AS o
    ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID,
    c.CompanyName,
    c.Country
ORDER BY TotalOrders DESC
LIMIT 10;

/*
=========================================================
Results Summary:

- Save-a-lot Markets placed the highest number of orders
  (31).
- Ernst Handel followed with 30 orders.
- QUICK-Stop ranked third with 28 orders.
- The remaining top customers placed between 17 and
  19 orders.

Business Insight:

The most active customers generate consistent business by
placing frequent orders. However, customers placing the
highest number of orders are not always the customers
generating the highest revenue. Analysing order frequency
alongside revenue provides a more accurate measure of
customer value.

Recommendation:

Maintain strong relationships with high-frequency customers
through excellent customer service and loyalty initiatives.
Combine order frequency with revenue analysis to identify
Northwind's most valuable customer accounts.

=========================================================
*/


/*
=========================================================
Analysis 3: Top Customers by Revenue

Business Question:
Which customers generate the highest sales revenue?

Objective:
Identify the customers contributing the highest revenue to
Northwind.

Revenue Calculation:
UnitPrice × Quantity × (1 - Discount)

Skills Demonstrated:
✔ INNER JOIN
✔ SUM()
✔ ROUND()
✔ GROUP BY
✔ ORDER BY
✔ LIMIT
✔ Revenue Analysis
=========================================================
*/

SELECT
    c.CustomerID,
    c.CompanyName,
    c.Country,
    ROUND(
        SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),
        2
    ) AS TotalRevenue
FROM customers AS c
INNER JOIN orders AS o
    ON c.CustomerID = o.CustomerID
INNER JOIN orderdetails AS od
    ON o.OrderID = od.OrderID
GROUP BY
    c.CustomerID,
    c.CompanyName,
    c.Country
ORDER BY TotalRevenue DESC
LIMIT 10;

/*
=========================================================
Results Summary:

- QUICK-Stop generated the highest total revenue
  (£110,277.30).
- Ernst Handel ranked second with £104,874.98.
- Save-a-lot Markets ranked third with £104,361.95.
- Rattlesnake Canyon Grocery and Hungry Owl All-Night
  Grocers were also among Northwind's highest revenue
  customers.

Business Insight:

The highest-revenue customers differ slightly from the
customers placing the highest number of orders. This
demonstrates that customer value should not be measured
solely by purchasing frequency. Some customers generate
greater revenue through higher-value orders despite placing
fewer orders overall.

Recommendation:

Prioritise relationship management for customers generating
the highest revenue while continuing to support customers
with high order frequency. Combining revenue, order volume
and average order value provides a more comprehensive view
of customer value and supports informed business decisions.

=========================================================
*/


