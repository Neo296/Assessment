INSERT INTO Dim_Customer (CustomerID, CustomerAge, CustomerGender)
SELECT DISTINCT ON (CustomerID) CustomerID, CustomerAge, CustomerGender
FROM transactions
WHERE CustomerID IS NOT NULL
;