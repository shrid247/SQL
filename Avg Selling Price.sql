DROP TABLE IF EXISTS Products;
CREATE TABLE Products (
  product_id INT,
  product_name VARCHAR(50),
  selling_price DECIMAL(10,2)
);

INSERT INTO products(product_id,product_name,selling_price)
VALUES
(1, 'product A', 100.00),
(2, 'product B', 150.00),
(1, 'product A', 120.00),
(3, 'product C', 200.00),
(2, 'product B', 180.00),
(1, 'product A', 90.00),
(3, 'product C', 210.00);

SELECT product_name,avg(selling_price) AS Average_Selling_Price FROM "public"."products"
GROUP BY product_name,product_id
ORDER BY product_id;
