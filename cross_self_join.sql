USE sakila;
#1- Get all pairs of actors that worked together.
SELECT a1.actor_id,a2.actor_id,f.title
FROM film_actor a1
join film_actor a2
on a1.film_id = a2.film_id
INNER JOIN film f
on a2.film_id = f.film_id
INNER JOIN actor d
ON a1.actor_id = d.actor_id;

#2-Get all pairs of customers that have rented the same film more than 3 times.
SELECT a1.customer_id, a2.customer_id, COUNT(*) 'num_of_rental'
FROM rental a1 
JOIN rental a2
on a1.inventory_id = a2.inventory_id and a1.customer_id < a2.customer_id #to show the same films rented by different customers
JOIN inventory i #to find the film_ids and counting them
on a2.inventory_id = i.inventory_id 
GROUP BY i.film_id, a1.customer_id, a2.customer_id
HAVING COUNT(*)>3;
#There isn't any rental being rented more than 3 times.


#3-Get all possible pairs of actors and films.
SELECT f.title, a1.actor_id, a2.actor_id
FROM film_actor a1
CROSS JOIN film_actor a2
JOIN film f
ON a2.film_id = f.film_id;