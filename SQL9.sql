use sakila;
-- 1.)
SELECT film.title , language.name FROM film
JOIN language ON film.language_id = language.language_id;

-- 2.)
SELECT CONCAT(staff.first_name ,' ',staff.last_name) AS Full_name , store.store_id AS store_id FROM staff
JOIN store ON staff.store_id = store.store_id;

-- 3.)
SELECT LOWER(f.title) , COUNT(i.inventory_id) AS total_inventory FROM inventory i
JOIN film f ON f.film_id = i.film_id
GROUP BY f.title; 
 
-- 4.)
SELECT address.address , city.city FROM address
JOIN city ON city.city_id = address.city_id;

-- 5.)
SELECT film.title , film_actor.actor_id , language.name FROM film
JOIN language ON film.language_id = language.language_id
JOIN film_actor ON film_actor.film_id = film.film_id; 

-- 6.)
SELECT address.address , city.city , country.country from address
JOIN store ON store.address_id = address.address_id
JOIN city ON city.city_id = address.city_id
JOIN country ON country.country_id = city.country_id;

SELECT a.first_name , l.name
FROM actor a
CROSS JOIN language l
GROUP BY l.name , a.first_name;
