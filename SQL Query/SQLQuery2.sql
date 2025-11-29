USE SuperstoreDB;
SELECT COUNT(*) FROM Superstore_Orders;

UPDATE Superstore_Orders
SET Customer_Name = LTRIM(RTRIM(Customer_Name)),
City = LTRIM(RTRIM(City)),
State = LTRIM(RTRIM(State)),
Postal_Code = LTRIM(RTRIM(Postal_Code)),
Region = LTRIM(RTRIM(Region)),
Category = LTRIM(RTRIM(Category)),
Sub_Category = LTRIM(RTRIM(Sub_Category)),
Product_Name = LTRIM(RTRIM(Product_Name)),
Segment = LTRIM(RTRIM(Segment)),
Country = LTRIM(RTRIM(Country)),
Ship_Mode = LTRIM(RTRIM(Ship_Mode))

-- Checking the rows are trimmed or not

SELECT * FROM Superstore_Orders 
WHERE Customer_Name LIKE ' %' OR Customer_Name LIKE '% ' OR
City LIKE ' %' OR City LIKE '% ' OR
State LIKE ' %' OR State LIKE '% ' OR
Category LIKE ' %' OR Category LIKE '% ' OR
Sub_Category LIKE ' %' OR Sub_Category LIKE '% ' OR
Region LIKE ' %' OR Region LIKE '% ' OR 
Segment LIKE ' %' OR Region LIKE '% ' OR
Country LIKE ' %' OR Country LIKE '% ' OR
Ship_Mode LIKE ' %' OR Ship_Mode LIKE '% ';


-- Check for NUll values
SELECT SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS Null_Sales,
SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS Null_Profit,
SUM(CASE WHEN Discount IS NULL THEN 1 ELSE 0 END) AS Null_Discount,
SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS Null_Quantity,
SUM(CASE WHEN Postal_Code IS NULL  THEN 1 ELSE 0 END) AS Null_PostalCode
FROM Superstore_Orders;


-- We Have 1 NUll row in Profit
DELETE FROM Superstore_Orders WHERE Profit IS NULL;

-- Check it is delted 
SELECT SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS Null_Profit_After
FROM Superstore_Orders;

SELECT COUNT(*) FROM Superstore_Orders;

-- Check for duplicates
SELECT Order_ID, Product_ID, COUNT(*) AS Cnt FROM Superstore_Orders
GROUP BY Order_ID, Product_ID HAVING Count(*) > 1;

-- Delete the duplicates
WITH Duplicates AS (SELECT *, 
ROW_NUMBER() OVER( PARTITION BY Order_ID, Product_ID ORDER BY Row_ID) AS rn
FROM Superstore_Orders)
DELETE FROM Duplicates WHERE rn > 1; 

-- Verify Deletion
SELECT Order_ID, Product_ID, COUNT(*) AS Cnt FROM Superstore_Orders
GROUP BY Order_ID, Product_ID HAVING COUNT(*) > 1;

-- Final row count 9985
SELECT COUNT(*) FROM Superstore_Orders;


-- Checking for any nulll
SELECT SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) Null_Sales,
SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) Null_Profit,
SUM(CASE WHEN Discount IS NULL THEN 1 ELSE 0 END) Null_Discount,
SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) Null_Quantity
FROM Superstore_Orders;

-- Validateing the correct date ranges 
SELECT MIN(Order_Date) AS Earliest_Date,
MAX(Order_Date) AS Latest_Order,
MIN(Ship_Date) AS Earliest_Ship,
MAX(Ship_Date) AS Latest_Ship
FROM Superstore_Orders;

-- Validating Numeric rnges
SELECT Min(Sales) AS Min_Sales,
MAX(Sales) AS Max_Sales,
MIN(Profit) AS Min_Profit,
MAX(Profit) AS Max_Profit,
MIN(Discount) AS Min_Discount,
MAX(Discount) AS Max_Discount,
MIN(Quantity) AS Min_Quantity,
MAX(Quantity) AS Max_Quantity
FROM Superstore_Orders;


-- Validateing categorical columns
SELECT DISTINCT Category FROM Superstore_Orders;
SELECT DISTINCT Region FROM Superstore_Orders;
SELECT DISTINCT Segment FROM Superstore_Orders;


-- Total Sales, Profit and Orders
SELECT SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit,
COUNT(DISTINCT Order_ID) AS Total_Orders
FROM Superstore_Orders;  

-- Monthly Sales Trend SQL 
SELECT YEAR(Order_Date) AS Order_Year,
MONTH(Order_Date) AS Order_Month,
DATENAME(MONTH, Order_Date) AS Month_Name,
SUM(Sales) AS Monthly_Sales,
SUM(Profit) AS Monthly_Profit,
COUNT(DISTINCT Order_ID) AS Monthly_Orders
FROM Superstore_Orders
GROUP BY YEAR(Order_Date), MONTH(Order_Date), DATENAME(MONTH, Order_Date)
ORDER BY YEAR(Order_Date), MONTH(Order_Date);  


-- Region wise Sales, Profit And Orders
SELECT Region, SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profits, COUNT(DISTINCT Order_ID) AS Total_Orders
FROM Superstore_Orders GROUP BY Region ORDER BY Total_Sales DESC;