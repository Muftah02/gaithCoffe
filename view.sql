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

