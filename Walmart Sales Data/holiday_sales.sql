-- Calculate Holiday sales

-- Calculate holiday sales for each store and the total percentage from total sales
SELECT t1.Store, t1.Holiday_sales, t2.Total_sales, FORMAT((t1.Holiday_sales/t2.Total_sales*100),'N2') as Percentage
FROM 
(Select Store, SUM(Weekly_sales) as Holiday_Sales
FROM Walmart
WHERE Holiday_Flag = 1
Group by Store) as t1
JOIN
(Select Store, SUM(Weekly_sales) as Total_sales
FROM Walmart
Group by Store) as t2
ON t1.Store = t2.Store
Order by t1.Holiday_Sales

-- Calculate holiday sales compared with total average sales

SELECT t1.Store, t1.Holiday_sales, t2.AVG_total_sales, FORMAT((t1.Holiday_sales/t2.AVG_total_sales*100),'N2') as Percentage
FROM 
(Select Store, SUM(Weekly_sales) as Holiday_Sales
FROM Walmart
WHERE Holiday_Flag = 1
Group by Store) as t1
JOIN
(Select Store, AVG(Weekly_sales) as AVG_total_sales
FROM Walmart
Group by Store) as t2
ON t1.Store = t2.Store
Order by Percentage

-- Calculate holiday sales compared with normal weeks average sales

SELECT t1.Store, t1.Holiday_sales, t2.AVG_normal_sales, FORMAT((t1.Holiday_sales/t2.AVG_normal_sales*100),'N2') as Percentage
FROM 
(Select Store, SUM(Weekly_sales) as Holiday_Sales
FROM Walmart
WHERE Holiday_Flag = 1
Group by Store) as t1
JOIN
(Select Store, AVG(Weekly_sales) as AVG_normal_sales
FROM Walmart
Where Holiday_Flag=0
Group by Store) as t2
ON t1.Store = t2.Store
Order by Percentage

