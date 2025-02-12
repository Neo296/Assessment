CREATE TABLE Dim_Customer (
    CustomerID SERIAL PRIMARY KEY,
    CustomerAge INT,
    CustomerGender VARCHAR(10)
);
CREATE TABLE Dim_Product (
    ProductID SERIAL PRIMARY KEY,
    ProductName VARCHAR(255)
);
CREATE TABLE Dim_Location (
    CityID SERIAL PRIMARY KEY,
    City VARCHAR(255),
    Region VARCHAR(255)
);
CREATE TABLE Dim_Store (
    StoreTypeID SERIAL PRIMARY KEY,
    StoreType VARCHAR(50)
);
CREATE TABLE Fact_Transaction (
    TransactionID SERIAL PRIMARY KEY,
    CustomerID INT REFERENCES Dim_Customer(CustomerID),
    ProductID INT REFERENCES Dim_Product(ProductID),
    CityID INT REFERENCES Dim_Location(CityID),
    StoreTypeID INT REFERENCES Dim_Store(StoreTypeID),
    TransactionDate TIMESTAMP,
    TransactionAmount DECIMAL(10, 2),
    Quantity INT,
    DiscountPercent DECIMAL(5, 2),
    ShippingCost DECIMAL(10, 2),
    DeliveryTimeDays INT,
    FeedbackScore INT,
    LoyaltyPoints INT,
    IsPromotional BOOLEAN
);