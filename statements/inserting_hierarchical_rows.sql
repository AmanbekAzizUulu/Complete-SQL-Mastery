-- Select the sql_store database for use
use sql_store;

/*
-- Insert a new row into the orders table
insert into
    orders (
        customer_id, -- The ID of the customer who placed the order
        order_date,  -- The date the order was placed
        order_status -- The status of the order
    )
values (
    1,              -- Customer ID: 1
    '2019-01-02',   -- Order date: January 2, 2019
    1               -- Order status: 1 (e.g., active)
);
*/


-- Store the ID of the last inserted row into the @last_inserted_order_id variable
set @last_inserted_order_id = (select LAST_INSERT_ID());

-- Insert rows into the order_items table using the ID of the last inserted order
insert into
    order_items (
        order_id,   -- The ID of the order, linking the row to the orders table
        product_id, -- The ID of the product associated with the order
        quantity,   -- The quantity of the product in the order
        unit_price  -- The price per unit of the product
    )
values 
(
    @last_inserted_order_id, -- Use the ID of the last inserted order
    1,                       -- Product ID: 1
    10,                      -- Quantity of product: 10
    3.95                     -- Price per unit: $3.95
),
(
    @last_inserted_order_id, -- Use the ID of the last inserted order
    2,                       -- Product ID: 2
    10,                      -- Quantity of product: 10
    2.95                     -- Price per unit: $2.95
);
