select customer_id, rental_date
from rental
WHERE rental_date <= '2005-06-16' and rental_date >= '2005-06-14'



select customer_id, rental_date
from rental
/* min and max */
WHERE rental_date BETWEEN '2005-06-14' AND '2005-06-16'

SELECT c.first_name, c.last_name, addr.address, addr.city
  FROM customer AS c
    INNER JOIN
     (SELECT a.address_id, a.address, ct.city
      FROM address AS a
        INNER JOIN city ct
        ON a.city_id = ct.city_id
      WHERE a.district = 'California'
     ) AS addr
    ON c.address_id = addr.address_id;

/* ファーストネームがJOHNで始まる俳優が出演している各映画のタイトルを返すクエリを記述してみよう */
SELECT f.title, a.first_name, a.last_name
FROM film f
  INNER JOIN film_actor fa
  ON f.film_id = fa.film_id
  INNER JOIN actor a
  ON fa.actor_id = a.actor_id
WHERE a.first_name LIKE 'JOHN%'
ORDER BY title

desc city

