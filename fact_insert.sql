INSERT INTO Fact_Transaction (
    TransactionID, CustomerID, ProductID, CityID, StoreTypeID, TransactionDate, 
    TransactionAmount, Quantity, DiscountPercent, ShippingCost, DeliveryTimeDays, 
    FeedbackScore, LoyaltyPoints, IsPromotional
)
SELECT DISTINCT ON (s.TransactionID)
    s.TransactionID,
    c.CustomerID,
    p.ProductID,
    l.CityID,
    st.StoreTypeID,
    s.TransactionDate,
    s.TransactionAmount,
    s.Quantity,
    s.DiscountPercent,
    s.ShippingCost,
    s.DeliveryTimeDays,
    s.FeedbackScore,
    s.LoyaltyPoints,
    CASE WHEN s.IsPromotional = 'Yes' THEN TRUE ELSE FALSE END AS IsPromotional
FROM transactions s
JOIN Dim_Customer c ON s.CustomerID = c.CustomerID
JOIN Dim_Product p ON s.ProductName = p.ProductName
JOIN Dim_Location l ON s.City = l.City
JOIN Dim_Store st ON s.StoreType = st.StoreType
WHERE s.CustomerID IS NOT NULL
ORDER BY s.TransactionID, s.TransactionDate;