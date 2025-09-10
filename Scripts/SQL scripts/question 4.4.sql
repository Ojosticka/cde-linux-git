/* Provide a table that shows the region for each sales rep along
with their associated accounts. Your final table should include 
three columns: the region name, the sales rep name, and the account name.
Sort the accounts alphabetically (A-Z) by account name. */

select r.name as region_name, 
	   s.name as sales_rep_name,
	   a.name as account_name
from accounts a	   
join sales_reps s on a.sales_rep_id = s.id
join region r on s.region_id = r.id
order by account_name

