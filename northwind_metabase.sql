-- Total income

WITH subquery AS (
                 SELECT *, CASE WHEN discount = 0 THEN (unit_price*quantity)
                 ELSE (quantity*(unit_price -unit_price*discount)) END AS price
                 FROM order_details
                 ORDER BY price DESC)

SELECT TO_CHAR(o.required_date, 'YYYY-MM') AS date,
SUM(sq.price) AS total_amount
FROM orders AS o
JOIN subquery AS sq
ON sq.order_id = o.order_id
GROUP BY date;

-- income by sales representatives

WITH subquery2 AS (
WITH subquery AS (
                 SELECT *, CASE WHEN discount = 0 THEN (unit_price*quantity)
                 ELSE (quantity*(unit_price -unit_price*discount)) END AS price
                 FROM order_details
                 ORDER BY price DESC)

SELECT SUM( sq.price) AS total_amount, o.employee_id
FROM orders AS o
JOIN subquery AS sq
ON sq.order_id = o.order_id
GROUP BY o.employee_id
ORDER BY total_amount DESC)

SELECT sq2.total_amount, e.first_name
FROM subquery2 AS sq2
JOIN employees AS e
ON e.employee_id=sq2.employee_id
ORDER BY total_amount DESC;

-- number of regions by sales representatives

SELECT e.first_name, COUNT(et.territory_id)
FROM employees as e
JOIN employee_territories as et
ON e.employee_id =et.employee_id
GROUP BY first_name
ORDER BY count;

-- 10 biggest orders
WITH subquery AS(
SELECT *, CASE WHEN discount = 0 THEN (unit_price*quantity)
               ELSE (quantity*(unit_price -unit_price*discount)) END AS price
FROM order_details
ORDER BY price DESC
LIMIT 10)

SELECT  o.ship_name, sq.price
FROM orders AS o
JOIN subquery AS sq
ON sq.order_id = o.order_id
ORDER BY price DESC;


-- income by sales representatives at the 20 biggest order

WITH t1 AS (
WITH subquery AS (
                               SELECT *, CASE WHEN discount = 0 THEN (unit_price*quantity)
                               ELSE (quantity*(unit_price -unit_price*discount)) END AS price
                               FROM order_details
                               ORDER BY price DESC)

             SELECT o.order_id, o.customer_id, o.ship_name, sq.price, o.employee_id
             FROM orders AS o
             JOIN subquery AS sq
             ON sq.order_id = o.order_id
             LIMIT 20)
SELECT t1.price, e.first_name
FROM employees AS e
JOIN t1
ON t1.employee_id = e.employee_id
ORDER BY price DESC;

-- The 15 biggest suppliers by total order amount

WITH subquery2 AS (
WITH subquery AS (
                 SELECT *, CASE WHEN discount = 0 THEN (unit_price*quantity)
                 ELSE (unit_price*quantity*discount) END AS price
                 FROM order_details
                 ORDER BY price DESC)

SELECT sq.price, sq.product_id,p.supplier_id
FROM products AS p
JOIN subquery AS sq
ON sq.product_id = p.product_id)

SELECT SUM(sq2.price) AS total, s.company_name
FROM subquery2 AS sq2
JOIN suppliers AS s
ON s.supplier_id=sq2.supplier_id
GROUP BY s.company_name
ORDER BY total DESC
LIMIT 15;

-- 20 most wanted products out of stock

SELECT pr.product_name, o.quantity AS quantity_in_orders, pr.unitis_in_stock, (quantity-unitis_in_stock) AS missing_quantity
FROM order_details AS o
JOIN products AS pr
ON o.product_id = pr.product_id
WHERE pr.unitis_in_stock < o.quantity
LIMIT 20;
