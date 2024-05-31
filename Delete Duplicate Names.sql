DROP TABLE IF EXISTS Emails;
CREATE  TABLE Emails(
    id serial,
    NAME CHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(10)
);

INSERT INTO Emails(NAME, Email, Phone)
VALUES
('Rahul','rahul@exmple.com','9839473902'),
('Rohit','rohit@example.com','9883782971'),
('Suresh','rahul@exmple.com','7654321098'),
('Manish','manish@example.com','8927394619'),
('Amit','amit@example.com','9399303840'),
('Rahul','rahul@exmple.com','9737466147');

-- SELECT min(id) as id,email from "public"."emails"
-- GROUP by email
-- order by id;

SELECT id, NAME, email, phone FROM (
SELECT id, NAME, email, phone, ROW_NUMBER() OVER(PARTITION BY email ORDER BY id) AS row_num
FROM "public"."emails"
)
WHERE row_num = 1
ORDER BY id;
