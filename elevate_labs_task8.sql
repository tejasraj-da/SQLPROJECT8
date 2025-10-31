CREATE DATABASE IF NOT EXISTS Sales;
USE Sales;

DROP TABLE IF EXISTS Products;

CREATE TABLE Products (
  ProductID INT PRIMARY KEY AUTO_INCREMENT,
  ProductName VARCHAR(100),
  Category VARCHAR(50),
  Price DECIMAL(10, 2),
  StockQuantity INT
);

INSERT INTO Products (ProductName, Category, Price, StockQuantity)
VALUES
('Laptop', 'Electronics', 1200.00, 50),
('Smartphone', 'Electronics', 800.00, 120),
('Coffee Maker', 'Appliances', 80.00, 200),
('Desk Chair', 'Furniture', 150.00, 75),
('Bluetooth Headphones', 'Electronics', 199.00, 90);

DELIMITER //

CREATE PROCEDURE GetProductsByCategory(IN category_name VARCHAR(50))
BEGIN
    SELECT *
    FROM Products
    WHERE Category = category_name;
END //

DELIMITER ;

DELIMITER //

DELIMITER //
CREATE FUNCTION CountProductsByCategory(category_name VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE product_count INT;
SELECT COUNT(*) INTO product_count
FROM Products
WHERE Category = category_name;
RETURN product_count;
END //
DELIMITER ;

CALL GetProductsByCategory('Electronics');
SELECT CountProductsByCategory('Electronics');