SELECT * 
FROM food_orders
WHERE (time_completed = NULL);

SELECT special_instructions
FROM food_orders;

SELECT *
FROM order_details LEFT JOIN menu_items
ON order_details.item_id = menu_items.item_id;

SELECT *
FROM order_details
WHERE (total_price < 100);

SELECT first_name,last_name
FROM servers
WHERE (availability = 'Yes');
