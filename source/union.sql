/* union allでcustomerとactorを結合する */
select "CUSTOMER" type, first_name, last_name
from customer AS c
UNION ALL
select "ACTOR" type, first_name, last_name
from actor AS a

SELECT c.first_name, c.last_name
  FROM customer c
  WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%'
  UNION /* UNION ALLは重複を取り除かない。 */
  SELECT a.first_name, a.last_name
  FROM actor a
  WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%';

