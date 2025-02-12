-- Create dimension tables
CREATE TABLE dim_customer (
    CustomerID INT PRIMARY KEY,
    CustomerAge INT,
    CustomerGender VARCHAR(10),
    LoyaltyPoints INT
);

CREATE TABLE dim_product (
    ProductID SERIAL PRIMARY KEY,
    ProductName VARCHAR(50) UNIQUE
);

CREATE TABLE dim_location (
    CityID SERIAL PRIMARY KEY,
    City VARCHAR(50),
    Region VARCHAR(50)
);

CREATE TABLE dim_time (
    DateID SERIAL PRIMARY KEY,
    FullDate DATE UNIQUE,
    Year INT,
    Month INT,
    Day INT
);

CREATE TABLE dim_store (
    StoreTypeID SERIAL PRIMARY KEY,
    StoreType VARCHAR(50) UNIQUE
);

CREATE TABLE dim_payment (
    PaymentMethodID SERIAL PRIMARY KEY,
    PaymentMethod VARCHAR(50) UNIQUE
);

CREATE TABLE dim_promotional (
    IsPromotionalID SERIAL PRIMARY KEY,
    IsPromotional VARCHAR(3) UNIQUE
);

-- Create fact table
CREATE TABLE fact_transactions (
    TransactionID INT PRIMARY KEY,
    CustomerID INT REFERENCES dim_customer(CustomerID),
    DateID INT REFERENCES dim_time(DateID),
    TransactionAmount DECIMAL(10, 2),
    PaymentMethodID INT REFERENCES dim_payment(PaymentMethodID),
    Quantity INT,
    DiscountPercent DECIMAL(5, 2),
    CityID INT REFERENCES dim_location(CityID),
    StoreTypeID INT REFERENCES dim_store(StoreTypeID),
    ProductID INT REFERENCES dim_product(ProductID),
    Returned VARCHAR(3),
    FeedbackScore INT,
    ShippingCost DECIMAL(10, 2),
    DeliveryTimeDays INT,
    IsPromotionalID INT REFERENCES dim_promotional(IsPromotionalID)
);