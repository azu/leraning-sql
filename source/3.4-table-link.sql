/*markdown
テーブルリンク
FROM句で複数のテーブルをしてして、そのテーブルをリンクする条件を指定することができます。

```sql
SELECT
    *
FROM
    table1
    INNER JOIN table2 ON table1.id = table2.id
```
*/

SELECT customer.first_name, customer.last_name, time(rental.rental_date) AS rental_time
FROM sakila.customer
  INNER JOIN rental
  ON customer.customer_id = rental.customer_id
WHERE date(rental.rental_date) = '2005-05-25'

select * from sakila.customer LIMIT 5



select * from sakila.rental LIMIT 5

SELECT c.first_name, c.last_name,
  time(r.rental_date) rental_time
FROM customer c
  INNER JOIN rental r
  ON c.customer_id = r.customer_id
WHERE date(r.rental_date) = '2005-06-14';

SELECT c.first_name, c.last_name,
  time(r.rental_date) rental_time
FROM customer AS c
  INNER JOIN rental AS r
  ON c.customer_id = r.customer_id
WHERE date(r.rental_date) = '2005-06-14';

