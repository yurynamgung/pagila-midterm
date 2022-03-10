/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch similar movies.
 * You've already watched all other movies with the same actors,
 * so now you need a new strategy for finding similar movies.
 * You decide that two movies X and Y are similar if they have been rented by the same customer,
 * and you further quantify this similarity by defining the "similarity score" to be the number of distinct customers that have rented both X and Y.
 *
 * Write a SQL SELECT query that:
 * computes the "similarity score" for all movies with 'AMERICAN CIRCUS'
 * and orders the results from highest to lowest.
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 *
 * NOTE:
 * You do not have to include movies with similarity score 0 in your results (but you may if you like).
 */
with ac_customers as (
    select distinct customer.customer_id 
    from film
    join inventory on (film.film_id = inventory.film_id)
    join rental on (inventory.inventory_id = rental.inventory_id)
    join customer on (rental.customer_id = customer.customer_id)
    where film.title = 'AMERICAN CIRCUS'
), similar_movies as ( -- keep # of customers in list for each movie
    select distinct film.title, ac_customers.customer_id
    from film
    join inventory on (film.film_id = inventory.film_id)
    join rental on (inventory.inventory_id = rental.inventory_id)
    join ac_customers on (rental.customer_id = ac_customers.customer_id)
)
select distinct title, 
    count(customer_id) as similarity_score
from similar_movies
group by title
order by similarity_score desc;

