/* Write a query that returns a list of orders where the standard_qty
is zero and either the gloss_qty or poster_qty is over 1000. */

select *
from orders o
where o.standard_qty = 0 and 
	  (o.gloss_qty > 1000 or o.poster_qty > 1000)