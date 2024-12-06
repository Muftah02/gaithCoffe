CREATE VIEW  items1view AS
SELECT items.* , categories.* FROM items 
INNER JOIN  categories on  items.items_cat = categories.categories_id
SELECT items1view.* FROM items1view 
INNER JOIN favorite on favorite.favorite_itemsid=items1view.items_id AND favorite.favorite_usersid =16

-- -------------------------------------------------------------
SELECT items1view.*,1 as favorite FROM items1view 
INNER JOIN favorite on favorite.favorite_itemsid=items1view.items_id AND favorite.favorite_usersid =16
UNION ALL
SELECT *, 0 as favorite FROM items1view
WHERE items_id NOT IN (SELECT items1view.items_id FROM items1view 
INNER JOIN favorite on favorite.favorite_itemsid=items1view.items_id AND favorite.favorite_usersid =16)

-- CREATE OR REPLACE VIEW myfavorite AS
-- SELECT favorite.* , items.* , users.users_id FROM favorite 
-- INNER JOIN users ON users.users_id  = favorite.favorite_usersid
-- INNER JOIN items ON items.items_id  = favorite.favorite_itemsid
CREATE OR REPLACE VIEW  items1view AS
SELECT items.* , categories.* FROM items 
INNER JOIN  categories on  items.items_cat = categories.categories_id ; 



CREATE OR REPLACE VIEW myfavorite AS
SELECT favorite.* , items.* , users.users_id FROM favorite 
INNER JOIN users ON users.users_id  = favorite.favorite_usersid
INNER JOIN items ON items.items_id  = favorite.favorite_itemsid


CREATE or REPLACE VIEW cartview as 
SELECT SUM(items.items_price - items.items_price * items_discount / 100) as itemsprice  , COUNT(cart.cart_itemsid) as countitems , cart.* , items.* FROM cart 
INNER JOIN items ON items.items_id = cart.cart_itemsid
WHERE cart_orders = 0 
GROUP BY cart.cart_itemsid , cart.cart_usersid , cart.cart_orders ;




CREATE  or REPLACE view ordersview AS 
SELECT orders.* , address.* FROM orders 
LEFT JOIN address ON address.address_id = orders.orders_address ; 



CREATE or REPLACE VIEW ordersdetailsview  as 
SELECT SUM(items.items_price - items.items_price * items_discount / 100) as itemsprice  , COUNT(cart.cart_itemsid) as countitems , cart.* , items.*   FROM cart 
INNER JOIN items ON items.items_id = cart.cart_itemsid 
WHERE cart_orders != 0 
GROUP BY cart.cart_itemsid , cart.cart_usersid , cart.cart_orders ;


CREATE or REPLACE VIEW itemstopselling AS 
SELECT COUNT(cart_id) as countitems , cart.* , items.*  , (items_price - (items_price * items_discount / 100 ))  as itemspricedisount  FROM cart 
INNER JOIN items ON items.items_id = cart.cart_itemsid
WHERE cart_orders != 0 
GROUP by cart_itemsid   ; 