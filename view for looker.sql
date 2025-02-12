CREATE VIEW Transaction_Analysis AS
SELECT 
    f.TransactionID,
    c.CustomerID,
    c.CustomerAge,
    c.CustomerGender,
    p.ProductName,
    l.City,
    l.Region,
    s.StoreType,
    f.TransactionDate,
    f.TransactionAmount,
    f.Quantity,
    f.DiscountPercent,
    f.ShippingCost,
    f.DeliveryTimeDays,
    f.FeedbackScore,
    f.LoyaltyPoints,
    f.IsPromotional
FROM Fact_Transaction f
JOIN Dim_Customer c ON f.CustomerID = c.CustomerID
JOIN Dim_Product p ON f.ProductID = p.ProductID
JOIN Dim_Location l ON f.CityID = l.CityID
JOIN Dim_Store s ON f.StoreTypeID = s.StoreTypeID;