INSERT INTO Dim_Product (ProductName)
SELECT DISTINCT ProductName
FROM transactions;

INSERT INTO Dim_Location (City, Region)
SELECT DISTINCT City, Region
FROM transactions;

INSERT INTO Dim_Store (StoreType)
SELECT DISTINCT StoreType
FROM transactions;