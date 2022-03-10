/*
 * You want to watch a movie tonight.
 * But you're superstitious,
 * and don't want anything to do with the letter 'F'.
 * List the titles of all movies that:
 * 1) do not have the letter 'F' in their title,
 * 2) have no actors with the letter 'F' in their names (first or last),
 * 3) have never been rented by a customer with the letter 'F' in their names (first or last).
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 */

with f_customer_films as (
    select distinct film.film_id
    from film
    join inventory on (film.film_id = inventory.film_id)
    join rental on (inventory.inventory_id = rental.inventory_id)
    join customer on (rental.customer_id = customer.customer_id)
    where position('F' in customer.first_name) > 0
        or position('F' in customer.last_name) > 0
), f_actor_films as (
    select distinct film.film_id
    from film
    join film_actor on (film.film_id = film_actor.film_id)
    join actor on (film_actor.actor_id = actor.actor_id)
    where position('F' in actor.first_name) > 0
        or position('F' in actor.last_name) > 0
)
select distinct film.title
from film
where position('F' in film.title) = 0
    and film.film_id not in (select * from f_actor_films) 
    and film.film_id not in (select * from f_customer_films);
