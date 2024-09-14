CREATE DATABASE IF NOT EXISTS restaurant_orders;
CREATE TABLE IF NOT EXISTS servers (
    server_id    INTEGER    NOT NULL    AUTO_INCREMENT    COMMENT 'ID of Server',
    first_name    NVARCHAR(35)    NOT NULL    COMMENT 'First Name of Server',
    last_name    NVARCHAR(35)    NOT NULL    COMMENT 'Last Name of Server',
    availability    VARCHAR(10)    NOT NULL    COMMENT 'Server  availability',

    PRIMARY KEY (server_id)
)
COMMENT 'Server Table'
;
CREATE TABLE IF NOT EXISTS tables (
    table_id    INTEGER    NOT NULL    AUTO_INCREMENT	COMMENT 'ID of Table',
    server_id    INTEGER    NOT NULL    AUTO_INCREMENT	COMMENT 'ID of Server',
    order_id    INTEGER    NOT NULL    AUTO_INCREMENT	COMMENT 'ID of Order',

    PRIMARY KEY (table_id)
)
COMMENT 'Tables Table'
;
ALTER TABLE tables
    ADD CONSTRAINT    tables_server_id_fk
    FOREIGN KEY    (server_id)
    REFERENCES    servers (server_id);

CREATE TABLE IF NOT EXISTS food_orders (
    order_id    INTEGER    NOT NULL    AUTO_INCREMENT    COMMENT 'ID of Order',
    server_id    INTEGER    NOT NULL    AUTO_INCREMENT    COMMENT 'ID of Server',
    table_id    INTEGER    NOT NULL    AUTO_INCREMENT    COMMENT 'ID of Table',
    date    DATE    NOT NULL    COMMENT 'Date of Food Order',
    time_ordered    TIME    NOT NULL    COMMENT 'Time of Order Placement',
    time_completed    TIME    NULL    COMMENT 'Time of Order Completion',
    status    VARCHAR(10)    NOT NULL    COMMENT 'Status of the Order',
    special_instructions    VARCHAR(100)    NULL    COMMENT 'Special changes to Order',

    PRIMARY KEY (order_id)
)
COMMENT 'Food Orders Table'

ALTER TABLE tables
    ADD CONSTRAINT    tables_order_id_fk
    FOREIGN KEY    (order_id)
    REFERENCES    food_orders (order_id);

ALTER TABLE food_orders
    ADD CONSTRAINT    food_orders_server_id_fk
    FOREIGN KEY    (server_id)
    REFERENCES    servers (server_id);

ALTER TABLE food_orders
    ADD CONSTRAINT    food_orders_table_id_fk
    FOREIGN KEY    (table_id)
    REFERENCES    tables (table_id);

CREATE TABLE IF NOT EXISTS menu_items (
    item_id    INT    NOT NULL    AUTO_INCREMENT    COMMENT 'ID of Menu Item',
    item_name    VARCHAR(16)    NOT NULL    COMMENT 'Name of Menu Item',
    price    DECIMAL(5,2)    NOT NULL    COMMENT 'Price of Menut Item',

    PRIMARY KEY (item_id)
)

CREATE TABLE IF NOT EXISTS order_details (
    order_details_id    INT    NOT NULL    AUTO_INCREMENT    COMMENT 'ID number of order details',
    order_id    INTEGER    NOT NULL    AUTO_INCREMENT    COMMENT 'ID of Order',
    item_id    INT    NOT NULL    AUTO_INCREMENT    COMMENT 'ID of Menu Item',
    name    VARCHAR(16)    NOT NULL    COMMENT 'Name of order'
    quantity    TINYINT    NOT NULL    COMMENT 'Number of item'
    total_price    DECIMAL(6,2)    NOT NULL    COMMENT 'Total price of order. price x quantity'
    
    PRIMARY KEY (order_details_id)
)
ALTER TABLE order_details
    ADD CONSTRAINT    order_details_order_id_fk
    FOREIGN KEY    (order_id)
    REFERENCES    food_orders (order_id);

ALTER TABLE order_details
    ADD CONSTRAINT    order_details_item_id_fk
    FOREIGN KEY    (item_id)
    REFERENCES    menu_items  (item_id);


