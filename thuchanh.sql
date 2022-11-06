-- thuc hanh 1
use classicmodels;
ALTER TABLE customers ADD INDEX idx_customerName(customerName);
EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.';

-- thuc hanh 2
DELIMITER &&
DROP PROCEDURE IF EXISTS `findAllCustomers`&&
CREATE PROCEDURE findAllCustomers()
BEGIN
SELECT * FROM customers where customerNumber = 175;
END &&
DELIMITER &&

-- thuc hanh 3

DELIMITER &&
CREATE PROCEDURE SetCounter(
 INOUT counter INT,
 IN inc INT
)
BEGIN
 SET counter = counter + inc;
END&&
DELIMITER &&

SET @counter = 1;
CALL SetCounter(@counter,1); -- 2
CALL SetCounter(@counter,1); -- 3
CALL SetCounter(@counter,5); -- 8
SELECT @counter; -- 8

-- thuc hanh 4
CREATE VIEW customer_views AS
SELECT customerNumber, customerName, phone
FROM customers;