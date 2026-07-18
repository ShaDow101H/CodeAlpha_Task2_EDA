SampleSuperstore SQL Analysis (Task 2 - EDA)

Overview

Exploratory Data Analysis on the SampleSuperstore dataset using SQL Server (9,994 orders, 4 regions, 3 categories, 17 sub-categories).



Data Cleaning Note

During import, a locale-related bug caused decimal values (Sales, Discount, Profit) to be misread — e.g. 957.5775 was imported as 9575775. Fixed by recreating the table with explicit DECIMAL(18,4) types and re-importing using BULK INSERT.

Queries

1. First look at the raw data

Preview the first 10 rows to see all columns and get a general feel for the dataset.

Screenshot: SuperStore_1.png

2. Total number of orders

Count how many total transactions exist in the dataset.

Screenshot: SuperStore_2.png

3. Overall revenue and profit

Find the total Sales and total Profit across the entire dataset.

Screenshot: SuperStore_3.png

4. Category-level performance

Break down Sales and Profit by Category to see which product categories drive the most profit.

Screenshot: SuperStore_4.png

5. Loss-making sub-categories

Find which Sub-Categories are operating at a net loss, sorted from worst to least bad.

Screenshot: SuperStore_5.png

6. Segment performance

Compare Sales and Profit across customer Segments (Consumer, Corporate, Home Office).

Screenshot: SuperStore_6.png

7. Top 5 cities by sales

Identify the 5 highest-revenue cities and check their profit alongside sales.

Screenshot: SuperStore_7.png

8. Regional profit margins

Calculate profit margin percentage by Region to see which regions operate most efficiently, not just which sell the most.

Screenshot: SuperStore_8.png

9. Table structure

Check the table's schema — column names, data types, and nullability.

Screenshot: SuperStore_9.png

10. Unique value counts per column

Count distinct values in each categorical column (Region, State, City, Category, Sub-Category, Segment, Ship Mode) to understand the dataset's diversity.

Screenshot: SuperStore_10.png

11. NULL value check

Check whether Sales, Profit, Quantity, or Discount contain any missing values.

Screenshot: SuperStore_11.png

12. Zero or negative sales check

Look for any orders with invalid (zero or negative) Sales values.

Screenshot: SuperStore_12.png

13. High discount orders (outliers)

Find all orders with a discount above 50% to check for unusual or extreme discounting.

Screenshot: SuperStore_13.png

14. Biggest losses (top 10 worst orders)

Find the 10 individual orders with the largest negative profit.

Screenshot: SuperStore_14.png

15. Duplicate record detection

Check whether any rows in the dataset are fully duplicated.

Screenshot: SuperStore_15.png

16. Discount vs profit correlation (hypothesis test)

Group orders into discount bands (No Discount, Low, Medium, High) and compare average profit per band, to test whether higher discounts lead to lower profit.

Screenshot: SuperStore_16.png

Task 2 Requirements — How This Project Meets Them

RequirementHow it was addressedAsk meaningful questions about the dataset before analysisQueries 3–8 explore revenue, profit, category, segment, city, and regional performanceExplore the data structure, including variables and data typesQueries 9–10 check schema, column types, and cardinalityIdentify trends, patterns and anomalies within the dataQueries 4–8 (performance patterns), 13–14 (outliers)Test hypotheses and validate assumptions using statisticsQuery 16 tests and confirms that higher discounts correlate with lower profitDetect potential data issues or problems to address in further analysisQueries 11 (NULLs), 12 (invalid sales), 15 (duplicates) — plus the decimal-parsing import bug found and fixed before analysis beganTools Used

SQL Server, SSMS



Repository Structure

├── README.md

├── superstore_analysis.sql

└── screenshots/

├── SuperStore_1.png

├── SuperStore_2.png

└── ... (16 total)
