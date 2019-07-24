SET FOREIGN_KEY_CHECKS = 0 ;
USE bikesdb;
CREATE TABLE categories (
	category_id INT AUTO_INCREMENT  PRIMARY KEY,
	category_name VARCHAR (255) NOT NULL);
CREATE TABLE brands (
	brand_id INT AUTO_INCREMENT PRIMARY KEY,
	brand_name VARCHAR (255) NOT NULL);
CREATE TABLE products (
	product_id INT AUTO_INCREMENT PRIMARY KEY,
	product_name VARCHAR (255) NOT NULL,
	brand_id INT NOT NULL,
	category_id INT NOT NULL,
	model_year SMALLINT NOT NULL,
	list_price DECIMAL (10, 2) NOT NULL);
	#FOREIGN KEY (brand_id) REFERENCES brands (brand_id) ON DELETE CASCADE ON UPDATE CASCADE,
    #FOREIGN KEY (category_id) REFERENCES categories (category_id) ON DELETE CASCADE ON UPDATE CASCADE);
CREATE TABLE stocks (
	store_id INT AUTO_INCREMENT PRIMARY KEY,
	product_id INT NOT NULL,
	stock_quantity INT,
	PRIMARY KEY (store_id, product_id));
-- 	FOREIGN KEY (product_id) REFERENCES products (product_id) ON DELETE CASCADE ON UPDATE CASCADE
-- 	FOREIGN KEY (store_id) REFERENCES sales.stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE,

CREATE TABLE customers (
	customer_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(50) NOT NULL,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    zip_code INT NOT NULL);
CREATE TABLE orders (
	orders_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_status BOOLEAN NOT NULL,
    order_date DATETIME NOT NULL,
    required_date DATE NOT NULL,
    shipped_date DATE,
    store_id INT NOT NULL,
    staff_id INT NOT NULL);
--  FOREIGN KEY (customer_id) REFERENCES customers (customer_id) ON DELETE CASCADE ON UPDATE CASCADE,
--  FOREIGN KEY (store_id) REFERENCES stores (store_id)
--  FOREIGN KEY (staff_id) REFERENCES staffs (staff-id)
CREATE TABLE staffs (
	staff_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    active BOOLEAN NOT NULL,
    store_id INT NOT NULL,
    manager_id INT REFERENCES staffs (staff_id));
--  FOREIGN KEY (store_id) REFERENCES stores (store_id)
CREATE TABLE stores (
	store_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    store_name VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(50) NOT NULL,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    zip_code INT NOT NULL);
CREATE TABLE order_items (
	order_id INT,
    item_id INT,
    product_id INT,
    quantity INT NOT NULL,
    list_price DECIMAL(10, 2) NOT NULL,
    discount DECIMAL(10,2),
    PRIMARY KEY (order_id, item_id));
    --  FOREIGN KEY (order_id) REFERENCES orders (order_id)
    
    
    
    
    
    
    



