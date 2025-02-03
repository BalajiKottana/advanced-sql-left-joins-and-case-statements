
/* this query provides the solution*/

select
substring(purchase_date::varchar,0,8) as purchase_month, 
case when idk.item_name is not null then idk.item_name
     when idc.item_name is not null then idc.item_name
	 when idn.item_name is not null then idn.item_name
end as clean_item_name,
sum(case when idk.item_name is not null then purchase_qty
     when idc.item_name is not null then purchase_qty
	 when idn.item_name is not null then purchase_qty
	 else 0 end) as purchased_quantity,
sum(case when idk.item_name is not null then purchase_amount
     when idc.item_name is not null then purchase_amount
	 when idn.item_name is not null then purchase_amount
	 else 0 end) as purchased_amount,
count(distinct customer_key) as purchased_customers
from sales_fact fct
left join (select distinct item_key,item_code,item_name from item_dim) idk on fct.item_key=idk.item_key
left join (select distinct item_code,item_name from item_dim) idc on fct.item_code=idc.item_code
left join (select distinct item_code,item_name from item_dim) idn on fct.item_name=idn.item_name
group by purchase_month,clean_item_name;

/* This query provides the necessary debug for the above query.*/

select fct.purchase_date,customer_key,fct.item_key,fct.item_code,fct.item_name,
idk.item_key,idk.item_code,idk.item_name
,idc.item_code,idc.item_name
,idn.item_code,idn.item_name
,fct.purchase_qty,fct.purchase_amount
from sales_fact fct
left join (select distinct item_key,item_code,item_name from item_dim) idk on fct.item_key=idk.item_key
left join (select distinct item_code,item_name from item_dim) idc on fct.item_code=idc.item_code
left join (select distinct item_code,item_name from item_dim) idn on fct.item_name=idn.item_name;