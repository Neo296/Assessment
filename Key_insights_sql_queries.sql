--Total Revenue
SELECT SUM(TransactionAmount) AS TotalRevenue
FROM Transaction_Analysis;

--Average Transaction Amount
SELECT AVG(TransactionAmount) AS AvgTransactionAmount
FROM Transaction_Analysis;

--Total Transactions
SELECT COUNT(TransactionID) AS TotalTransactions
FROM Transaction_Analysis;

--Total Quantity Sold
SELECT SUM(Quantity) AS TotalQuantitySold
FROM Transaction_Analysis;

--Total Promotional Sales
SELECT SUM(TransactionAmount) AS TotalPromotionalSales
FROM Transaction_Analysis
WHERE IsPromotional = TRUE;


--Top 5 Products by Revenue
SELECT ProductName, SUM(TransactionAmount) AS TotalRevenue
FROM Transaction_Analysis
GROUP BY ProductName
ORDER BY TotalRevenue DESC
LIMIT 5;


--Customer with Highest Spending
SELECT CustomerID, CustomerAge, CustomerGender, SUM(TransactionAmount) AS TotalSpent
FROM Transaction_Analysis
GROUP BY CustomerID, CustomerAge, CustomerGender
ORDER BY TotalSpent DESC
LIMIT 1;


--Average Feedback Score
SELECT AVG(FeedbackScore) AS AvgFeedbackScore
FROM Transaction_Analysis;


--Revenue by Region
SELECT Region, SUM(TransactionAmount) AS TotalRevenue
FROM Transaction_Analysis
GROUP BY Region
ORDER BY TotalRevenue DESC;

--Revenue by Store Type
SELECT StoreType, SUM(TransactionAmount) AS TotalRevenue
FROM Transaction_Analysis
GROUP BY StoreType
ORDER BY TotalRevenue DESC;

--Monthly Revenue Trend
SELECT 
    DATE_TRUNC('month', TransactionDate) AS Month,
    SUM(TransactionAmount) AS MonthlyRevenue
FROM Transaction_Analysis
GROUP BY DATE_TRUNC('month', TransactionDate)
ORDER BY Month;

--Average Delivery Time
SELECT AVG(DeliveryTimeDays) AS AvgDeliveryTime
FROM Transaction_Analysis;

--Customers with Maximum Loyalty Points
SELECT CustomerID, CustomerAge, CustomerGender, MAX(LoyaltyPoints) AS MaxLoyaltyPoints
FROM Transaction_Analysis
GROUP BY CustomerID, CustomerAge, CustomerGender
ORDER BY MaxLoyaltyPoints DESC
LIMIT 10;


--Gender-wise Revenue Contribution
SELECT CustomerGender, SUM(TransactionAmount) AS TotalRevenue
FROM Transaction_Analysis
GROUP BY CustomerGender
ORDER BY TotalRevenue DESC;


--Most Popular Product
SELECT ProductName, SUM(Quantity) AS TotalQuantity
FROM Transaction_Analysis
GROUP BY ProductName
ORDER BY TotalQuantity DESC
LIMIT 1;


--City with Highest Sales
SELECT City, SUM(TransactionAmount) AS TotalSales
FROM Transaction_Analysis
GROUP BY City
ORDER BY TotalSales DESC
LIMIT 1;

--Discount Impact on Revenue
SELECT 
    CASE 
        WHEN DiscountPercent > 0 THEN 'With Discount'
        ELSE 'No Discount'
    END AS DiscountStatus,
    SUM(TransactionAmount) AS TotalRevenue
FROM Transaction_Analysis
GROUP BY DiscountStatus;


