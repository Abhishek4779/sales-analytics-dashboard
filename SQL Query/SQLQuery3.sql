USE SuperstoreDB;
SELECT * FROM Superstore_Orders;

-- Category wise performance
SELECT Category, SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profit, COUNT(DISTINCT Order_ID) AS Total_Orders 
FROM Superstore_Orders GROUP BY Category ORDER BY Total_Sales DESC;

-- Sun Category wise perfomance
SELECT Category, Sub_Category, SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profit, COUNT(DISTINCT Order_ID) AS Total_Orders
FROM Superstore_Orders GROUP BY Category, Sub_Category ORDER BY Category, Total_Sales DESC; 


-- Top 10 products by sales
SELECT TOP 10 Product_Name, Sub_Category, SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profit, COUNT(DISTINCT Order_ID) AS Total_Orders
FROM Superstore_Orders GROUP BY Product_Name, Sub_Category ORDER BY Total_Sales DESC;

-- Top 10 Products by Profit
SELECT TOP 10 Product_Name, Sub_Category, SUM(Profit) AS Total_Profit, SUM(Sales) AS Total_Sales, COUNT(DISTINCT Order_ID) AS Total_Orders
FROM Superstore_Orders GROUP BY Product_Name, Sub_Category ORDER BY Total_Profit DESC;

-- Top 10 products by loss makers (profit)
SELECT TOP 10 Product_Name, Sub_Category, SUM(Profit) AS Total_Profit, SUM(Sales) AS Total_Sales, COUNT(DISTINCT Order_ID) AS Total_Orders
FROM Superstore_Orders GROUP BY Product_Name, Sub_Category ORDER BY Total_Profit ASC;  

-- Discount Business Analysis 
SELECT Discount, ROUND(SUM(Sales), 2) AS Total_Sales, ROUND(SUM(Profit), 2) Total_Profit, COUNT(*) AS Total_Transactions
FROM Superstore_Orders GROUP BY Discount ORDER BY Discount;


SELECT 
    CASE
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount > 0 AND Discount <= 0.2 THEN '0-20%'
        WHEN Discount > 0.2 AND Discount <= 0.4 THEN '20-40%'
        WHEN Discount > 0.4 AND Discount <= 0.6 THEN '40-60%'
        WHEN Discount > 0.6 AND Discount <= 0.8 THEN '60-80%'
        ELSE '80%+'
    END AS Discount_Range,
    
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(*) AS Total_Transactions

FROM Superstore_Orders

GROUP BY 
    CASE
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount > 0 AND Discount <= 0.2 THEN '0-20%'
        WHEN Discount > 0.2 AND Discount <= 0.4 THEN '20-40%'
        WHEN Discount > 0.4 AND Discount <= 0.6 THEN '40-60%'
        WHEN Discount > 0.6 AND Discount <= 0.8 THEN '60-80%'
        ELSE '80%+'
    END

ORDER BY Discount_Range;
