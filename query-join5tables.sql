SELECT customers.first_name, customers.last_name, products.product_name, products.product_id, stores.store_name, orders.shipped_date
FROM products
JOIN order_items
ON products.product_id = order_items.product_id
JOIN orders
ON orders.order_id = order_items.order_id
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN stores
ON stores.store_id = orders.store_id
WHERE products.product_id = 192
;
SHOW ERRORS;