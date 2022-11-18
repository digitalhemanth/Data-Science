

We can put the set-returning function unnest() into the SELECT list like Raphaël suggests. This used to exhibit corner case problems before Postgres 10. See:

What is the expected behaviour for multiple set-returning functions in SELECT clause?
Since Postgres 9.3 we can also use a LATERAL join for this. It is the cleaner, standard-compliant way to put set-returning functions into the FROM list, not into the SELECT list:

SELECT name, value
FROM   tbl, unnest(values) value;  -- implicit CROSS JOIN LATERAL
One subtle difference: this drops rows with empty / NULL values from the result since unnest() returns no row, while the same is converted to a NULL value in the FROM list and returned anyway. The 100 % equivalent query is:

SELECT t.name, v.value
FROM   tbl t
LEFT   JOIN unnest(t.values) v(value) ON true;



 figured it out, guys

if I have a table books enter image description here

I can easily write a query




SELECT 
   id, 
   data::json->'name' as name
FROM books;
And it will result in

enter image description here

I can also try to get non-existent column

SELECT 
   id, 
   data::json->'non_existant' as non_existant
FROM books;
And it this case I will get empty result

enter image description here

Share







