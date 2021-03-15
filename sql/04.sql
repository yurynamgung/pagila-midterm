/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query SELECT query that:
 * Lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 * (You may choose to either include or exclude the movie 'AMERICAN CIRCUS' in the results.)
 */
SELECT
    f1.title
FROM film f1
JOIN film_actor fa1 ON f1.film_id = fa1.film_id
JOIN film_actor fa2 ON fa2.actor_id = fa1.actor_id
JOIN film f2 ON f2.film_id = fa2.film_id
WHERE
    f2.title = 'AMERICAN CIRCUS'
GROUP BY f1.title
HAVING
    count(*)>1
ORDER BY f1.title
