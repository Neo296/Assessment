-- Insert data into dimension tables

INSERT INTO dim_product (ProductName)
SELECT DISTINCT ProductName FROM transactions;

INSERT INTO dim_location (City, Region)
SELECT DISTINCT City, Region FROM transactions;

INSERT INTO dim_time (FullDate, Year, Month, Day)
SELECT DISTINCT 
    DATE(TransactionDate) AS FullDate,
    EXTRACT(YEAR FROM TransactionDate) AS Year,
    EXTRACT(MONTH FROM TransactionDate) AS Month,
    EXTRACT(DAY FROM TransactionDate) AS Day
FROM transactions;

INSERT INTO dim_store (StoreType)
SELECT DISTINCT StoreType FROM transactions;

INSERT INTO dim_payment (PaymentMethod)
SELECT DISTINCT PaymentMethod FROM transactions;

INSERT INTO dim_promotional (IsPromotional)
SELECT DISTINCT IsPromotional FROM transactions;

-- Insert data into fact table
INSERT INTO fact_transactions (
    TransactionID,
    CustomerID,
    DateID,
    TransactionAmount,
    PaymentMethodID,
    Quantity,
    DiscountPercent,
    CityID,
    StoreTypeID,
    ProductID,
    Returned,
    FeedbackScore,
    ShippingCost,
    DeliveryTimeDays,
    IsPromotionalID
)
SELECT 
    t.TransactionID,
    c.CustomerID,
    ti.DateID,
    t.TransactionAmount,
    p.PaymentMethodID,
    t.Quantity,
    t.DiscountPercent,
    l.CityID,
    s.StoreTypeID,
    pr.ProductID,
    t.Returned,
    t.FeedbackScore,
    t.ShippingCost,
    t.DeliveryTimeDays,
    pm.IsPromotionalID
FROM transactions t
JOIN dim_customer c ON t.CustomerID = c.CustomerID
JOIN dim_time ti ON DATE(t.TransactionDate) = ti.FullDate
JOIN dim_product pr ON t.ProductName = pr.ProductName
JOIN dim_location l ON t.City = l.City AND t.Region = l.Region
JOIN dim_store s ON t.StoreType = s.StoreType
JOIN dim_payment p ON t.PaymentMethod = p.PaymentMethod
JOIN dim_promotional pm ON t.IsPromotional = pm.IsPromotional;