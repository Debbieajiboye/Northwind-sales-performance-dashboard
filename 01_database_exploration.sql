USE northwind;

/*
=========================================================
NORTHWIND SALES ANALYSIS
File: 01_database_exploration.sql

Purpose:
Explore the structure and size of the Northwind database
before carrying out detailed customer, sales, product and
employee analysis.
=========================================================
*/


/*
=========================================================
Analysis 1: Database Tables

Business Question:
Which tables are available in the Northwind database?

Objective:
Review the database structure and identify the tables
required for the sales analysis.

Skills Demonstrated:
- SHOW TABLES
- Database exploration
- Understanding relational database structure
=========================================================
*/

SHOW TABLES;

/*
=========================================================
Results Summary:

- The Northwind database contains 13 tables.
- The key tables used in this project include customers,
  orders, orderdetails, products, categories and employees.
- Supporting tables include suppliers, shippers and
  employeeterritories.

Business Insight:

The database contains the main business areas required to
analyse customer activity, sales performance, products and
employees. The tables can be connected through common keys
such as CustomerID, OrderID, ProductID and EmployeeID.

Recommendation:

Review the columns and relationships within the key tables
before beginning detailed analysis. This helps ensure that
the correct joins and calculations are used throughout the
project.
=========================================================
*/


/*
=========================================================
Analysis 2: Total Customers

Business Question:
How many customers are recorded in the database?

Objective:
Determine the size of Northwind's customer base.

Skills Demonstrated:
- COUNT()
- Column aliases
- Customer analysis
=========================================================
*/

SELECT
    COUNT(*) AS TotalCustomers
FROM customers;

/*
=========================================================
Results Summary:

- Northwind has 91 customers recorded in the database.

Business Insight:

The customer base consists of 91 businesses that can be
analysed by location, order activity and revenue contribution.
The total customer count provides a useful baseline for the
customer analysis.

Recommendation:

Further analysis should identify which countries have the
largest customer base and determine which customers place
the most orders and generate the highest revenue.
=========================================================
*/


/*
=========================================================
Analysis 3: Total Products

Business Question:
How many products are available in the Northwind catalogue?

Objective:
Determine the size of the company's product range.

Skills Demonstrated:
- COUNT()
- Column aliases
- Product portfolio analysis
=========================================================
*/

SELECT
    COUNT(*) AS TotalProducts
FROM products;

/*
=========================================================
Results Summary:

- Northwind offers 77 products in its product catalogue.

Business Insight:

The catalogue contains a varied range of products that can
be analysed by revenue, quantity sold and product category.
However, the total product count alone does not show which
products perform well or poorly.

Recommendation:

Evaluate product performance using revenue, quantity sold
and category analysis to identify top-performing products,
underperforming products and inventory priorities.
=========================================================
*/


/*
=========================================================
Analysis 4: Total Orders

Business Question:
How many customer orders are recorded in the database?

Objective:
Measure the total volume of customer transactions available
for analysis.

Skills Demonstrated:
- COUNT()
- Column aliases
- Transaction-volume analysis
=========================================================
*/

SELECT
    COUNT(*) AS TotalOrders
FROM orders;

/*
=========================================================
Results Summary:

- The database contains 830 customer orders.

Business Insight:

The order volume provides a substantial dataset for analysing
sales trends, customer purchasing patterns and employee
performance. It also supports comparisons across time,
countries, customers and products.

Recommendation:

Analyse the orders by month, customer, country and employee
to identify sales patterns, periods of high activity and the
main drivers of transaction volume.
=========================================================
*/


/*
=========================================================
Analysis 5: Total Employees

Business Question:
How many employees are recorded in the database?

Objective:
Determine the number of employees available for performance
analysis.

Skills Demonstrated:
- COUNT()
- Column aliases
- Employee analysis
=========================================================
*/

SELECT
    COUNT(*) AS TotalEmployees
FROM employees;

/*
=========================================================
Results Summary:

- Northwind has 9 employees recorded in the database.

Business Insight:

The employee count establishes the size of the team whose
sales performance can be compared using revenue generated,
orders processed and average order value.

Recommendation:

Assess employee performance using multiple metrics rather
than relying on a single measure. This provides a more
balanced and fair evaluation of employee contribution.
=========================================================
*/