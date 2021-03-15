/*
 * Write a SQL query SELECT query that:
 * computes the country with the most customers in it. 
 */

SELECT
    country
FROM (
    SELECT 
        country,
        count(*) as count
    FROM country
    JOIN city USING (country_id)
    JOIN address USING (city_id)
    JOIN customer USING (address_id)
    GROUP BY country
)t
ORDER BY count DESC
LIMIT 1;
