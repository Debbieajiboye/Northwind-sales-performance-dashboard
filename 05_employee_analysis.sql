USE northwind;

/*
=========================================================
Analysis 1: Employee Revenue Performance

Business Question:
Which employees generated the highest sales revenue?

Objective:
Evaluate employee performance by calculating the total
revenue generated from the orders handled by each employee.

Revenue Calculation:
UnitPrice × Quantity × (1 - Discount)

Skills Demonstrated:
✔ INNER JOIN
✔ GROUP BY
✔ Aggregate Functions (SUM)
✔ ORDER BY
✔ CONCAT()
✔ Business Performance Analysis
=========================================================
*/

SELECT
    CONCAT(e.FirstName, ' ', e.LastName) AS Employee,
    ROUND(
        SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),
        2
    ) AS TotalRevenue
FROM employees AS e
INNER JOIN orders AS o
    ON e.EmployeeID = o.EmployeeID
INNER JOIN orderdetails AS od
    ON o.OrderID = od.OrderID
GROUP BY
    e.EmployeeID,
    e.FirstName,
    e.LastName
ORDER BY TotalRevenue DESC;

/*
=========================================================
Analysis 1: Employee Revenue Performance

Results Summary

- Margaret Peacock generated the highest sales revenue
  (£232,390.85), making her the top-performing employee.
- Janet Leverling and Nancy Davolio ranked second and
  third respectively.
- Steven Buchanan generated the lowest revenue among the
  employees analysed.

Business Insight

Employee sales performance varies considerably across the
team. The highest-performing employees contribute a
significant proportion of total revenue, which may reflect
differences in customer portfolios, sales territories,
experience or the number of orders handled.

Recommendation

Review the strategies used by the highest-performing
employees and identify best practices that can be shared
across the team. Future analysis should compare revenue
with the number of orders handled and the average order
value to provide a more balanced assessment of employee
performance.
=========================================================
*/



/*
=========================================================
Analysis 2: Orders Processed by Employee

Business Question:
Which employees processed the highest number of orders?

Objective:
Determine employee workload by counting the number of
orders handled by each employee.

Skills Demonstrated:
✔ INNER JOIN
✔ COUNT()
✔ GROUP BY
✔ ORDER BY
✔ Business Performance Analysis
=========================================================
*/

SELECT
    CONCAT(e.FirstName, ' ', e.LastName) AS Employee,
    COUNT(o.OrderID) AS TotalOrders
FROM employees AS e
INNER JOIN orders AS o
    ON e.EmployeeID = o.EmployeeID
GROUP BY
    e.EmployeeID,
    e.FirstName,
    e.LastName
ORDER BY TotalOrders DESC;

/*
=========================================================
Analysis 2: Orders Processed by Employee

Results Summary

- Margaret Peacock processed the highest number of orders
  (156), making her the busiest employee.
- Janet Leverling (127) and Nancy Davolio (123) ranked
  second and third respectively.
- Steven Buchanan processed the fewest orders (42).

Business Insight

The number of orders handled varies significantly between
employees. A higher order count may indicate a heavier
workload, a larger customer portfolio or responsibility for
high-volume sales territories. However, processing more
orders does not necessarily mean generating more revenue,
so this metric should be considered alongside revenue and
average order value.

Recommendation

Use order count together with revenue and average order
value to evaluate employee performance fairly. Employees
handling a high number of orders may benefit from workload
reviews or additional support if demand continues to grow.
=========================================================
*/



/*
=========================================================
Analysis 3: Average Order Value by Employee

Business Question:
Which employees generate the highest average revenue per order?

Objective:
Calculate the average revenue generated from each order
handled by an employee. This provides a fair comparison of
sales performance regardless of the number of orders
processed.

Revenue Calculation:
UnitPrice × Quantity × (1 - Discount)

Skills Demonstrated:
✔ INNER JOIN
✔ SUM()
✔ COUNT()
✔ ROUND()
✔ GROUP BY
✔ ORDER BY
✔ Business Performance Analysis
=========================================================
*/

SELECT
    CONCAT(e.FirstName, ' ', e.LastName) AS Employee,
    ROUND(
        SUM(od.UnitPrice * od.Quantity * (1 - od.Discount))
        / COUNT(DISTINCT o.OrderID),
        2
    ) AS AverageOrderValue
FROM employees AS e
INNER JOIN orders AS o
    ON e.EmployeeID = o.EmployeeID
INNER JOIN orderdetails AS od
    ON o.OrderID = od.OrderID
GROUP BY
    e.EmployeeID,
    e.FirstName,
    e.LastName
ORDER BY AverageOrderValue DESC;

/*
=========================================================
Analysis 3: Average Order Value by Employee

Results Summary

- Anne Dodsworth recorded the highest Average Order Value
  (£1,797.86), indicating that, on average, her customers
  placed the highest-value orders.
- Andrew Fuller and Robert King ranked second and third
  respectively.
- Michael Suyama recorded the lowest Average Order Value
  (£1,103.18).

Business Insight

Average Order Value provides a different perspective on
employee performance. Although Margaret Peacock generated
the highest total revenue and processed the most orders,
Anne Dodsworth achieved the highest average revenue per
order. This suggests Anne handled fewer but higher-value
orders, while Margaret's strong performance was driven by
a larger number of orders.

Recommendation

Employee performance should be assessed using multiple
metrics rather than relying on a single measure. Combining
total revenue, number of orders and average order value
provides a more balanced and accurate evaluation of sales
performance.
=========================================================
*/

