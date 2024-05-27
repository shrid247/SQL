DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers(
id serial PRIMARY KEY,
NAME CHAR(25)
);
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders(
id INT,
customerid INT,
FOREIGN KEY (customerid) REFERENCES Customers(id)
);
INSERT INTO Customers( NAME)
VALUES
('Joe'),
('Henry'),
('Sam'),
('Max');

INSERT INTO Orders(id,customerid)
VALUES
(2,1),
(1,3);

SELECT NAME AS Customers FROM "public"."customers" AS c
LEFT JOIN "public"."orders" AS o ON c.id =o.customerid
WHERE Customerid IS NULL;

