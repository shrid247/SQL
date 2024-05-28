DROP TABLE IF EXISTS Products CASCADE;
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);

INSERT INTO Products (ProductID, ProductName, Price)
VALUES
    (1, 'Apple', 2.50),
    (2, 'Banana', 1.50),
    (3, 'Orange', 3.00),
    (4, 'Mango', 2.00);
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
    OrderID serial,
    ProductID INT,
    Quantity INT,
    Sales DECIMAL(10, 2),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Orders (OrderID, ProductID, Quantity, Sales) VALUES
(1, 1, 10, 25.00),
(2, 1, 5, 12.50),
(3, 2, 8, 12.00),
(4, 3, 12, 36.00),
(5, 4, 6, 12.00);

SELECT productname AS "ProductName", sum(sales) AS "TotalRevenue" FROM "public"."orders" AS o JOIN "public"."products" AS p ON o.productid = p.productid
GROUP BY productname
ORDER BY sum(sales) DESC;