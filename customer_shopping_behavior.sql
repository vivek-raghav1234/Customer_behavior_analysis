-- total revenue genrated by the male vs female 

 select gender, SUM(purchase_amount) as Revenue
 from customer
 group by gender

 -- customer pays more after discount applied

 select customer_id, purchase_amount 
 from customer
 where discount_applied = 'Yes' and purchase_amount >=(select AVG(purchase_amount) from customer)

-- top 5 product with highest avg review ratings

select item_purchased, ROUND(AVG(review_rating :: NUMERIC),2) as "Average review rating"
from customer 
group by item_purchased
order by AVG(review_rating) desc
limit 5 	

-- Compare average purchase amount betwenn standard and express shipping 

select shipping_type,
Round(AVG(purchase_amount),2)
from customer
where shipping_type in ('Standard','Express')
group by shipping_type

-- compare average sprend and total revenue btw subs and non-subs

select subscription_status,
COUNT(customer_id) as total_customers,
ROUND(AVG(purchase_amount),2) as avg_spend,
ROUND(SUM(purchase_amount),2) as total_revenue
from customer
group by subscription_status
order by total_revenue, avg_spend desc;

-- which 5 	order have the higher percentage of purchase with discount applied 
select item_purchased,
ROUND (100 * SUM(CASE WHEN discount_applied = 'Yes' then 1 else 0 END)/COUNT(*),2) as discount_rate
from customer 
group by item_purchased
order by discount_rate desc
limit 5;

-- segment customer into new returning, loyal based on ther number of previous purchse

with customer_type as 
(
  select customer_id, previous_purchases,
  CASE WHEN	previous_purchases = 1 THEN 'New'
  WHEN previous_purchases BETWEEN 2 AND 10 then 'Returning'
  ELSE 'loyal'
  END AS 	customer_segment
  from customer
)
 
select customer_segment, COUNT(*) as "Number of custome" 
from customer_type
group by customer_segment


-- what are 3 most purchased product in each category

with item_counts as (

select item_purchased, category
COUNT customer_id as total_orders

)

-- Are customers who are repeat buyers also likely to subscribe ?
select subscription_status,
count (customer_id) as repeat_buyers
from customer
where previous_purchases > 5 
group by subscription_status

-- what is the revenue contribution of each age group

select age_group,
SUM(purchase_amount) as total_revenue
from customer
group by age_group
order by total_revenue desc;

select * from customer
