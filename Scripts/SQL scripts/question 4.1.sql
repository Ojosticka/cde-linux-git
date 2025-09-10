/* Find a list of order IDs where either gloss_qty or poster_qty 
is greater than 4000. Only include the id field in the resulting table. */

select distinct id as order_id
from orders o
where o.gloss_qty > 4000 or poster_qty > 4000