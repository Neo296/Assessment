
SET datestyle TO 'SQL, MDY';


CREATE TABLE transactions (
    TransactionID INT,
    CustomerID FLOAT,
    TransactionDate TIMESTAMP,          -- Changed from DATETIME to TIMESTAMP
    TransactionAmount FLOAT,
    PaymentMethod VARCHAR(50),
    Quantity INT,
    DiscountPercent FLOAT,
    City VARCHAR(50),
    StoreType VARCHAR(50),
    CustomerAge INT,
    CustomerGender VARCHAR(10),
    LoyaltyPoints INT,
    ProductName VARCHAR(50),
    Region VARCHAR(50),
    Returned VARCHAR(3),
    FeedbackScore INT,
    ShippingCost FLOAT,
    DeliveryTimeDays INT,
    IsPromotional VARCHAR(3)
);

COPY transactions
FROM 'C:\Users\Public\data.csv'
DELIMITER ','
CSV HEADER;
