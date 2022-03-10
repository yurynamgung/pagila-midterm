/*
 * Count the number of distinct customers who have rented a movie that 'RUSSELL BACALL' has acted in.
 *
 * NOTE:
 * You cannot hard-code Russell Bacall's actor_id.
 * You're where clause must include a condition using the "first_name" and "last_name" fields of the "actor" table.
 */

with bacall_movies as (
    select film.film_id
    from film
    join film_actor on (film.film_id = film_actor.film_id)
    join actor on (film_actor.actor_id = actor.actor_id)
    where actor.first_name = 'RUSSELL'
        and actor.last_name = 'BACALL'
 ), bacall_customers as (
    select distinct customer.customer_id
    from bacall_movies
    join inventory on (bacall_movies.film_id = inventory.film_id)
    join rental on (inventory.inventory_id = rental.inventory_id)
    join customer on (rental.customer_id = customer.customer_id)
)
select count(customer_id)
from bacall_customers;
