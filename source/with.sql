/*markdown
MySQL 8.0で新たに追加された共通テーブル式（common table expression：CTE）は、他のデータベースサーバーでは少し前からサポートされていた機能です。CTEは名前付きのサブクエリであり、with句を使ってクエリの前に配置します
*/

WITH actors_with_last_name_starts_with_s AS 
(
  SELECT actor_id, first_name, last_name
  FROM sakila.actor
  WHERE last_name LIKE 'S%'
)
/* actorとfilm_actor x fileをjoinして、そのfileのratingがPGのものを取得する */
WITH actors_with_film_rating_is_pg AS
(
  SELECT a.actor_id, a.first_name, a.last_name, f.title, f.rating
  FROM sakila.actor a
    INNER JOIN sakila.film_actor fa
    ON a.actor_id = fa.actor_id
    INNER JOIN sakila.film f
    ON fa.film_id = f.film_id
  WHERE f.rating = 'PG'
)
/*  ppaymentテーブルと結合し、それらの映画のレンタル時に支払われた金額を取得します*/
WITH actors_s_pg_revenue AS
(SELECT spg.first_name, spg.last_name, p.amount
 FROM actors_with_film_rating_is_pg spg
   INNER JOIN inventory i
   ON i.film_id = spg.film_id
   INNER JOIN rental r
   ON i.inventory_id = r.inventory_id
   INNER JOIN payment p
   ON r.rental_id = p.rental_id
)
select actors_s_pg_rev
from actors_s_pg_revenue as actors_s_pg_rev
GROUP BY actors_s_pg_rev.first_name, actors_s_pg_rev.last_name
ORDER BY actors_s_pg_rev.first_name, actors_s_pg_rev.last_name

