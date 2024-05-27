DROP TABLE IF EXISTS Purchases;
CREATE TABLE Purchases (
    CustomerID INT,
    ProductID CHAR(5),
    PurchaseDate DATE,
    Quantity INT,
    Revenue DECIMAL(10, 2)
);
INSERT INTO Purchases (CustomerID, ProductID, PurchaseDate, Quantity, Revenue)
VALUES
    (1, 'A', '2023-01-01', 5, 100.00),
    (2, 'B', '2023-01-02', 3, 50.00),
    (3, 'A', '2023-01-03', 2, 30.00),
    (4, 'C', '2023-01-03', 1, 20.00),
    (1, 'B', '2023-01-04', 4, 80.00);

-- 1.	Calculate total revenue

SELECT sum(revenue) AS "TotalRevenue" FROM "public"."purchases";

-- 2.	Calculate total sales by product 

SELECT productid, sum(quantity) AS "TotalQuatity", sum(revenue) AS "TotalRevenue" FROM "public"."purchases"
GROUP BY productid
ORDER BY productid;

-- 3.	Find top customer by Revenue

SELECT customerid, sum(revenue) AS "TotalRevenue" FROM "public"."purchases"
GROUP BY customerid
ORDER BY customerid;