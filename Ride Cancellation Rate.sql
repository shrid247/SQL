DROP TABLE IF EXISTS Trips CASCADE;
CREATE TABLE Trips(
id serial,
client_id INT,
driver_id INT,
city_id INT NOT NULL,
status CHAR(50) NOT NULL,
request_at date NOT NULL
);

INSERT INTO Trips(client_id,driver_id,city_id,status,request_at)
VALUES
    (1,10,1,'completed','2023-07-12'),
    (2,11,1,'cancelled_by_driver','2023-07-12'),
    (3,12,6,'completed','2023-07-12'),
    (4,13,6,'cancelled_by_client','2023-07-12'),
    (1,10,1,'completed','2023-07-13'),
    (2,11,6,'completed','2023-07-13'),
    (3,12,6,'completed','2023-07-13'),
    (2,12,12,'completed','2023-07-14'),
    (3,10,12,'completed','2023-07-14'),
    (4,13,12,'cancelled_by_driver','2023-07-14');

DROP TABLE IF EXISTS Users;    
CREATE TABLE Users(
user_id INT,
banned CHAR(3),
ROLE CHAR(10)
);

INSERT INTO Users(user_id,banned,ROLE)
VALUES
(1,'No','client'),
(2,'Yes','client'),
(3,'No','client'),
(4,'No','client'),
(10,'No','driver'),
(11,'No','driver'),
(12,'No','driver'),
(13,'No','driver');
-- This project involves analysing the cancellation rate for ride requests, specially from users who are not banned. Given two tables, trips and users containing information on trips and users respectively. Calculate the cancellation rate for carpool requests involving users who are not banned. A ride request is considered cancelled if it is cancelled either by the customer or by the driver. The cancellation rate is calculated by dividing the number o cancelled request (involving non-banned users) by the total number of requests (with non-banned users) each day.

-- SELECT * from "public"."users";
SELECT 
    request_date,
    CASE 
        WHEN total_requests = 0 THEN 0.00
        ELSE ROUND(CAST(canceled_requests AS DECIMAL) / total_requests, 2)
    END AS cancellation_rate
FROM (
    SELECT 
        DATE(request_at) AS request_date,
        SUM(CASE WHEN status LIKE 'cancelled%' THEN 1 ELSE 0 END) AS canceled_requests,
--         Using % in the LIKE operator allows for a wildcard match. In this context, LIKE 'cancelled%' matches any string that starts with "cancelled" followed by any characters.
        COUNT(*) AS total_requests
    FROM Trips
    WHERE client_id IN (
        SELECT user_id FROM Users WHERE banned = 'No'
    )
    GROUP BY request_date
) AS cancellation_data
ORDER BY request_date;
