--Sales Analysis by Store and Date

--Calculate total weekly sales for each store.

SELECT Store, SUM(Weekly_sales) as Total_Sales
FROM Walmart
Group by Store
Order by Total_Sales;

--Find the store with the highest and lowest sales.
--Identify the week with the highest and lowest sales.

SELECT t1.Store, t1.Date, t1.Weekly_Sales as Highest_sale
FROM walmart t1
WHERE t1.Weekly_Sales = (
    SELECT MAX(t2.Weekly_Sales)
    FROM walmart t2
    WHERE t2.Store = t1.Store
)
Order by Highest_sale Desc


SELECT t1.Store, t1.Date, t1.Weekly_Sales as Lowest_Sale
FROM walmart t1
WHERE t1.Weekly_Sales = (
    SELECT MIN(t2.Weekly_Sales)
    FROM walmart t2
    WHERE t2.Store = t1.Store
)
Order by Lowest_Sale

--Calculate average weekly sales for each store

SELECT Store, AVG(Weekly_sales) as Avg_sales
FROM walmart
Group by Store
Order by Avg_sales