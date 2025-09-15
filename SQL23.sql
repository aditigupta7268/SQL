-- CTE (Common Table Expression)

use sakila;
-- join the actor table and the film_actor table to find out the actor id the first name , and the movie
-- the actor has worked but only fr those actors whose actor id is mlre than 10
select * from film;
WITH cte AS (
    SELECT 
        a.actor_id AS actor_id,   -- keep only one version
        a.first_name,
        a.last_name,
        fa.film_id
    FROM actor AS a
    JOIN film_actor AS fa ON a.actor_id = fa.actor_id
)
SELECT * FROM cte JOIN film AS f ON cte.film_id = f.film_id;
