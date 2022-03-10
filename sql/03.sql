/*
 * List the titles of all films in the 'Children' category that have a rating of 'R' or 'NC-17'.
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 */

select distinct film.title
from film
join film_category on (film.film_id = film_category.film_id)
join category on (film_category.category_id = category.category_id)
where category.name = 'Children'
    and (film.rating = 'R' or film.rating = 'NC-17');
