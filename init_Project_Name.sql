CREATE DATABASE IF NOT EXISTS restaurant;
USE restaurant;

CREATE TABLE IF NOT EXISTS servers (
	server_id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(35) NOT NULL,
	last_name VARCHAR(35) NOT NULL,
	availability VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS menu_items (
	item_id INT AUTO_INCREMENT PRIMARY KEY,
	item_name VARCHAR(16) NOT NULL,
	price DECIMAL(5,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS tables (
	table_id INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS food_orders (
	order_id INT AUTO_INCREMENT PRIMARY KEY,
	server_id INT,
	table_id INT,
	date DATE NOT NULL,
	time_ordered TIME NOT NULL,
	time_completed TIME NULL,
	status VARCHAR(10) NOT NULL,
	special_instructions VARCHAR(100) NULL,
	CONSTRAINT fk_server_id
        	FOREIGN KEY (server_id)
        	REFERENCES servers(server_id),
	CONSTRAINT fk_table_id
        	FOREIGN KEY (table_id)
        	REFERENCES tables(table_id)
);

ALTER TABLE restaurant.tables 
	ADD COLUMN order_id INT,
	ADD COLUMN server_id INT,
	ADD CONSTRAINT fk_tables_order_id
		FOREIGN KEY (order_id) 
		REFERENCES food_orders(order_id), 
	ADD CONSTRAINT fk_tables_server_id
		FOREIGN KEY (server_id) 
		REFERENCES servers(server_id);

CREATE TABLE IF NOT EXISTS order_details (
	order_details_id INT AUTO_INCREMENT PRIMARY KEY,
	order_id INT,
	item_id INT,
	name VARCHAR(16) NOT NULL,
	quantity TINYINT NOT NULL,
	total_price DECIMAL(6,2) NOT NULL,
	CONSTRAINT fk_order_id
        	FOREIGN KEY (order_id)
        	REFERENCES food_orders(order_id),
	CONSTRAINT fk_item_id
        	FOREIGN KEY (item_id)
        	REFERENCES menu_items(item_id)
);
