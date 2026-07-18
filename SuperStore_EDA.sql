/*
create database SuperStoreDB;
go
use SuperStoreDB;
go
CREATE TABLE dbo.SampleSuperstore(
    Ship_Mode NVARCHAR(50),
    Segment NVARCHAR(50),
    Country NVARCHAR(50),
    City NVARCHAR(100),
    State NVARCHAR(100),
    Postal_Code NVARCHAR(10),
    Region NVARCHAR(50),
    Category NVARCHAR(50),
    Sub_Category NVARCHAR(50),
    Sales DECIMAL(18,4),
    Quantity INT,
    Discount DECIMAL(4,2),
    Profit DECIMAL(18,4)
);
go

BULK INSERT dbo.SampleSuperstore
FROM 'C:\Users\Zohrab\Desktop\SampleSuperstore.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);
*/


--1
SELECT TOP 10
* 
FROM SampleSuperstore;


--2
SELECT 
COUNT(*) AS Total_Orders 
FROM dbo.SampleSuperstore;


--3
select 
sum(Sales) as Total_Revenue,
sum(Profit) as Total_Profit
from dbo.SampleSuperstore;



--4
SELECT 
Category, 
SUM(Sales) AS Category_Sales, 
SUM(Profit) AS Category_Profit
FROM dbo.SampleSuperstore
GROUP BY Category
ORDER BY Category_Profit DESC;


--5
select 
Sub_Category,
ROUND(SUM(Sales), 2) AS Sub_Sales, 
ROUND(SUM(Profit), 2) AS Sub_Profit
from dbo.SampleSuperstore group by Sub_Category 
having SUM(Profit) < 0 order by Sub_Profit asc;


--6
select 
Segment,
ROUND(SUM(Sales), 2) as Total_Sales,
ROUND(SUM(Profit), 2) AS Total_Profit
from dbo.SampleSuperstore group by Segment
order by Total_Profit;


--7
select top 5
City,
ROUND(SUM(Sales), 2) as Total_Sales,
ROUND(SUM(Profit), 2) AS Total_Profit
from dbo.SampleSuperstore
group by City order by Total_Sales desc;


--8
select 
Region,
ROUND(SUM(Sales), 2) as Total_Sales,
ROUND(SUM(Profit), 2) AS Total_Profit,
ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin_Percent
from dbo.SampleSuperstore group by Region 
order by Profit_Margin_Percent desc;




-- 9. 
 EXEC sp_help 'dbo.SampleSuperstore';






-- 10. 
SELECT 
COUNT(DISTINCT Region) AS Unique_Regions,
COUNT(DISTINCT State) AS Unique_States,
COUNT(DISTINCT City) AS Unique_Cities,
COUNT(DISTINCT Category) AS Unique_Categories,
COUNT(DISTINCT Sub_Category) AS Unique_SubCategories,
COUNT(DISTINCT Segment) AS Unique_Segments,
COUNT(DISTINCT Ship_Mode) AS Unique_ShipModes
FROM dbo.SampleSuperstore;




-- 11.
SELECT 
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS Null_Sales,
    SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS Null_Profit,
    SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS Null_Quantity,
    SUM(CASE WHEN Discount IS NULL THEN 1 ELSE 0 END) AS Null_Discount
FROM dbo.SampleSuperstore;



-- 12. 
SELECT *
FROM dbo.SampleSuperstore
WHERE Sales <= 0;




-- 13.
SELECT 
    Sub_Category,
    Discount,
    Sales,
    Profit
FROM dbo.SampleSuperstore
WHERE Discount > 0.5
ORDER BY Discount DESC;


-- 14.
SELECT TOP 10
    Sub_Category,
    City,
    Sales,
    Discount,
    Profit
FROM dbo.SampleSuperstore
ORDER BY Profit ASC;



-- 15. 
SELECT 
    Ship_Mode, Segment, City, State, Postal_Code, Region, 
    Category, Sub_Category, Sales, Quantity, Discount, Profit,
    COUNT(*) AS Duplicate_Count
FROM dbo.SampleSuperstore
GROUP BY Ship_Mode, Segment, City, State, Postal_Code, Region, 
         Category, Sub_Category, Sales, Quantity, Discount, Profit
HAVING COUNT(*) > 1;



-- 16. 
SELECT 
    CASE 
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount <= 0.2 THEN 'Low (0-20%)'
        WHEN Discount <= 0.5 THEN 'Medium (20-50%)'
        ELSE 'High (50%+)'
    END AS Discount_Group,
    ROUND(AVG(Profit), 2) AS Avg_Profit,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM dbo.SampleSuperstore
GROUP BY 
    CASE 
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount <= 0.2 THEN 'Low (0-20%)'
        WHEN Discount <= 0.5 THEN 'Medium (20-50%)'
        ELSE 'High (50%+)'
    END
ORDER BY Avg_Profit DESC;


