/* Find all the company names that start with a 'C' or 'W', and 
where the primary contact contains 'ana' or 'Ana', but does not
contain 'eana'. */

select *
from accounts a
where (a.name like 'C%' or a.name like 'W%') and 
	  (a.primary_poc like '%ana%' or a.primary_poc like '%Ana%') and
	  (a.primary_poc not like '%eana%')