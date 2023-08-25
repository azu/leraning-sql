use sakila

SELECT *
FROM sakila.language

SELECT language_id, name, last_update
FROM sakila.language


SELECT 
 language_id,
 /* COMMONという文字列を language_usage という名前で表示 */
 'COMMON' language_usage
FROM sakila.language


/*markdown
列エイリアスという機能。

これは、列名を別名で表示する機能です。

```sql
SELECT 列名 AS 別名 FROM テーブル名;
```


*/

SELECT language_id,
  "COMMON" as language,
  language_id * 31 AS lang_pi_value,
  upper(name) AS name_upper
FROM sakila.language

/*markdown
重複を取り除くにはDISTINCTを使う。

```sql
SELECT DISTINCT 列名 FROM テーブル名;
```
*/

/* 重複あるパターン */
SELECT actor_id
FROM sakila.actor
ORDER BY actor_id

/* 重複なしパターン */
SELECT DISTINCT actor_id
FROM sakila.film_actor
ORDER BY actor_id

