USE northwind;

/*
=========================================================
Analysis 1: Top Products by Revenue

Business Question:
Which products generate the highest revenue?

Objective:
Identify the products contributing the most revenue to the
business. This helps understand customer demand and supports
inventory, marketing and sales decisions.

Revenue Calculation:
UnitPrice × Quantity × (1 - Discount)
=========================================================
*/

SELECT
    p.ProductName,
    ROUND(
        SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),
        2
    ) AS TotalRevenue
FROM products AS p
INNER JOIN orderdetails AS od
    ON p.ProductID = od.ProductID
GROUP BY
    p.ProductID,
    p.ProductName
ORDER BY TotalRevenue DESC
LIMIT 10;

/*
=========================================================
Results Summary

- Côte de Blaye generated the highest revenue (£141,396.73),
  making it Northwind's top-performing product.
- Thüringer Rostbratwurst and Raclette Courdavault ranked
  second and third respectively.
- The top 10 products generated substantially more revenue
  than many other products in the catalogue.

Business Insight

A relatively small group of products contributes a significant
proportion of total revenue. These products are likely to be
key drivers of business performance and should be carefully
managed to ensure consistent availability and customer
satisfaction.

Recommendation

Maintain adequate inventory levels for the highest-performing
products and consider featuring them in marketing campaigns.
Further analysis should examine whether their strong revenue
is driven by high sales volume, premium pricing or both.
=========================================================
*/


/*
=========================================================
Analysis 2: Top Products by Quantity Sold

Business Question:
Which products sold the highest number of units?

Objective:
Identify the products with the highest sales volume to
understand customer demand and support inventory planning.

Quantity Calculation:
Total Quantity Sold
=========================================================

Skills Demonstrated:
✔ INNER JOIN
✔ GROUP BY
✔ Aggregate Functions (SUM)
✔ ORDER BY
✔ LIMIT
✔ Inventory & Sales Analysis
=========================================================
*/

SELECT
    p.ProductName,
    SUM(od.Quantity) AS TotalUnitsSold
FROM products AS p
INNER JOIN orderdetails AS od
    ON p.ProductID = od.ProductID
GROUP BY
    p.ProductID,
    p.ProductName
ORDER BY TotalUnitsSold DESC
LIMIT 10;

/*
=========================================================
Results Summary

- Camembert Pierrot sold the highest number of units
  (1,577 units), making it the best-selling product by
  sales volume.
- Raclette Courdavault and Gorgonzola Telino ranked
  second and third respectively.
- Several products exceeded 1,000 units sold, indicating
  consistently strong customer demand.

Business Insight

Products with high sales volume are likely to be customer
favourites and play an important role in maintaining
steady sales. High sales volume does not necessarily mean
high revenue, so this analysis should be compared with the
Top Products by Revenue report.

Recommendation

Ensure adequate stock levels for high-demand products to
avoid stock shortages. Compare sales volume with revenue
and profit margins to identify products that deliver both
strong customer demand and high business value.
=========================================================
*/




/*
=========================================================
Analysis 3: Revenue by Product Category

Business Question:
Which product categories generate the highest revenue?

Objective:
Identify the product categories that contribute the most
to overall sales revenue. This information can help the
business prioritise inventory, marketing and investment.

Revenue Calculation:
UnitPrice × Quantity × (1 - Discount)

Skills Demonstrated:
✔ Multiple INNER JOINs
✔ Aggregate Functions (SUM)
✔ GROUP BY
✔ ORDER BY
✔ Business Performance Analysis
=========================================================
*/

SELECT
    c.CategoryName,
    ROUND(
        SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),
        2
    ) AS TotalRevenue
FROM categories AS c
INNER JOIN products AS p
    ON c.CategoryID = p.CategoryID
INNER JOIN orderdetails AS od
    ON p.ProductID = od.ProductID
GROUP BY
    c.CategoryID,
    c.CategoryName
ORDER BY TotalRevenue DESC;

/*
=========================================================
Analysis 3: Revenue by Product Category

Results Summary

- Beverages generated the highest revenue (£267,868.18),
  making it the best-performing product category.
- Dairy Products ranked second (£234,507.28), followed by
  Confections (£167,357.22).
- Grains/Cereals generated the lowest revenue (£95,744.59)
  among the categories analysed.

Business Insight

Revenue varies considerably across product categories.
Beverages and Dairy Products are the strongest contributors
to overall sales revenue, suggesting these categories are
major drivers of business performance. Lower-performing
categories may require further investigation to understand
whether lower revenue is due to fewer sales, lower prices or
reduced customer demand.

Recommendation

Continue investing in high-performing categories through
effective stock management and targeted marketing. Analyse
the lower-performing categories to identify opportunities
for growth, such as promotional campaigns, pricing reviews
or product range optimisation.

=========================================================
*/



/*
=========================================================
Analysis 4: Lowest Performing Products by Revenue

Business Question:
Which products generate the lowest revenue?

Objective:
Identify products contributing the least revenue to help
evaluate inventory performance, pricing strategies and
potential opportunities for improvement.

Revenue Calculation:
UnitPrice × Quantity × (1 - Discount)

Skills Demonstrated:
✔ INNER JOIN
✔ GROUP BY
✔ Aggregate Functions (SUM)
✔ ORDER BY
✔ LIMIT
✔ Business Performance Analysis
=========================================================
*/

SELECT
    p.ProductName,
    ROUND(
        SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),
        2
    ) AS TotalRevenue
FROM products AS p
INNER JOIN orderdetails AS od
    ON p.ProductID = od.ProductID
GROUP BY
    p.ProductID,
    p.ProductName
ORDER BY TotalRevenue ASC
LIMIT 10;

/*
=========================================================
Analysis 4: Lowest Performing Products by Revenue

Results Summary

- Chocolade generated the lowest revenue (£1,368.71),
  making it the weakest-performing product.
- Geitost and Genen Shouyu also generated relatively
  low revenue compared with the rest of the product range.
- The bottom ten products all generated less than
  £3,500 in revenue.

Business Insight

These products contribute only a small proportion of the
company's overall revenue. Low revenue may be caused by
low customer demand, limited availability, niche market
appeal or infrequent purchasing.

Recommendation

Review the performance of these products before making
business decisions. Investigate sales volume, profit
margins, customer demand and inventory costs to determine
whether these products should be promoted, retained or
replaced. A low-revenue product may still be valuable if
it has a high profit margin or supports a specialised
customer segment.
=========================================================
*/