DROP TABLE IF EXISTS BankAccount;
CREATE TABLE bankaccount(
AccountNumber INT,
AccountHolderName CHAR(50),
TransactionDate date,
TransactionType CHAR(50),
TransactionAmount DECIMAL(10,2)
);

INSERT INTO BankAccount(AccountNumber,AccountHolderName,TransactionDate,TransactionType,TransactionAmount)
VALUES
(1001,'Ravi Sharma','2023-07-01','Deposit',5000.00),
(1001,'Ravi Sharma','2023-07-05','Withdrawal',1000.00),
(1001,'Ravi Sharma','2023-07-10','Deposit',2000.00),
(1002,'Priya Gupta','2023-07-02','Deposit',3000.00),
(1002,'Priya Gupta','2023-07-08','Withdrawal',500.00),
(1003,'Vikram Patel','2023-07-04','Deposit',10000.00),
(1003,'Vikram Patel','2023-07-09','Withdrawal',2000.00);

SELECT  Accountnumber,Accountholdername,sum( CASE WHEN transactiontype = 'Deposit' THEN transactionamount ELSE - transactionamount END) AS TotalBalance FROM "public"."bankaccount"
GROUP BY accountholdername,accountnumber
ORDER BY accountnumber;