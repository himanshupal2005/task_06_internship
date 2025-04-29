CREATE DATABASE online_sales;

CREATE TABLE online_sales.orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10, 2),
    product_id VARCHAR(10)
);

INSERT INTO online_sales.orders (order_id, order_date, amount, product_id) VALUES
(1, '2025-01-05', 150.00, 'P001'),
(2, '2025-01-06', 200.00, 'P002'),
(3, '2025-01-06', 50.00, 'P003'),
(4, '2025-01-07', 300.00, 'P001'),
(5, '2025-01-08', 120.00, 'P004'),
(6, '2025-01-08', 80.00, 'P003'),
(7, '2025-01-09', 500.00, 'P005'),
(8, '2025-01-10', 90.00, 'P002'),
(9, '2025-01-10', 75.00, 'P004'),
(10, '2025-01-11', 250.00, 'P001');

-- Sales Trend Analysis: Monthly Revenue and Order Volume

SELECT
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM
    online_sales.orders
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    order_year,
    order_month;
