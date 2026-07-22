--which cusotmers have high cltv(top 20 cusotmers)
with main as
(select 
customer_id,
cltv,
dense_rank()over(order by cltv desc) as rnk
from the-name-498307-r7.project_3.customer_ltv)

select *
from main
where rnk<20

-- finding all cusotmer segment generating high cltv


select   --customer type
customer_type,
count(cltv) as no_of_cust,
round(avg(cltv),1) as avg_cltv,
sum(cltv) as total_cltv
from the-name-498307-r7.project_3.customer_ltv
group by customer_type


select   --contract
contract,
count(cltv) as no_of_cust,
round(avg(cltv),1) as avg_cltv,
sum(cltv) as total_cltv
from the-name-498307-r7.project_3.customer_ltv
group by contract
order by avg_cltv desc


select   --payment method
payment_method,
count(cltv) as no_of_cust,
round(avg(cltv),1) as avg_cltv,
sum(cltv) as total_cltv
from the-name-498307-r7.project_3.customer_ltv
group by payment_method
order by avg_cltv desc


select internet_service,   --internet servie
count(cltv) as no_of_cust,
round(avg(cltv),1) as avg_cltv,
sum(cltv) as total_cltv
from the-name-498307-r7.project_3.customer_ltv
group by internet_service
order by avg_cltv desc



--Q.which cusotmers are likely to churn and what are there characteristics(use above and below together to make redommnedations)



--Although the average CLTV of Low CLTV customers is similar across cities, Los Angeles has the largest concentration of Low CLTV customers (105). Therefore, retention campaigns in Los Angeles could potentially impact more customers than campaigns in other cities.
select                                
city,
round(avg(cltv),2) as avg_cltv,
count(*) as no_cust
from the-name-498307-r7.project_3.customer_ltv
where cltv_type ='Low'
group by city
order by no_cust desc


--Among Low CLTV customers,most Low CLTV customers are New and Established.Loyal customers rarely fall into the Low CLTV segment.
select                       
customer_type,
round(avg(cltv),2) as avg_cltv,
count(*) as no_cust
from the-name-498307-r7.project_3.customer_ltv
where cltv_type ='Low'
group by customer_type
order by no_cust desc

--Although Fiber optic customers have the highest average CLTV overall, they also account for the largest number of customers in the Low CLTV segment. taargeted retention within the fibre optic segemtns based on customer_type and contract etc

select                       
internet_service,
round(avg(cltv),2) as avg_cltv,
count(*) as no_cust
from the-name-498307-r7.project_3.customer_ltv
where cltv_type ='Low'
group by internet_service
order by no_cust desc



--Month-to-month customers have the lowest average CLTV (4136.7) and account for approximately 73% of all low-CLTV customers.
select                       
contract,
round(avg(cltv),2) as avg_cltv,
count(*) as no_cust
from the-name-498307-r7.project_3.customer_ltv
where cltv_type ='Low'
group by contract
order by no_cust desc


--Customers using automatic payment methods (bank transfer and credit card) have the highest average CLTV.
--Customers using checks have the lowest average CLTV, with Mailed Check being the lowest.
--Electronic Check has the largest number of low-CLTV customers (890).
--Automatic payment methods have much fewer low-CLTV customers.
select                       
payment_method,
round(avg(cltv),2) as avg_cltv,
count(*) as no_cust
from the-name-498307-r7.project_3.customer_ltv
where cltv_type ='Low'
group by payment_method
order by no_cust desc



--Q.What factors drive high cltv

--Customer tenure appears to be one of the strongest drivers of Customer Lifetime Value. Loyal customers are significantly more likely to belong to the High CLTV segment, while New and Established customers are more frequently found in the Low CLTV segment
select
customer_type,
sum(case when cltv_type='High' then 1 else 0 end) as High_cltv,
sum(case when cltv_type='Low' then 1 else 0 end) as Low_cltv
from the-name-498307-r7.project_3.customer_ltv
group by customer_type


--Customers on two-year contracts are much more likely to belong to the High CLTV segment.
--Month-to-month customers are considerably more likely to belong to the Low CLTV segment than the High CLTV segment.
select
contract,
sum(case when cltv_type='High' then 1 else 0 end) as High_cltv,
sum(case when cltv_type='Low' then 1 else 0 end) as Low_cltv
from the-name-498307-r7.project_3.customer_ltv
group by contract


--Internet service does not appear to strongly differentiate High-CLTV customers from Low-CLTV customers, as the distribution of High and Low CLTV customers is similar across Fiber optic, DSL, and No Internet service.
select
internet_service,
sum(case when cltv_type='High' then 1 else 0 end) as High_cltv,
sum(case when cltv_type='Low' then 1 else 0 end) as Low_cltv
from the-name-498307-r7.project_3.customer_ltv
group by internet_service


--Customers using automatic payment methods are more likely to belong to the High CLTV segment.
--Customers paying through checks are more likely to belong to the Low CLTV segment.
--Payment method appears to be an important driver of Customer Lifetime Value. Customers using automatic payment methods are associated with a higher proportion of High CLTV customers, while customers paying through checks are more commonly found in the Low CLTV segment.
select
payment_method,
sum(case when cltv_type='High' then 1 else 0 end) as High_cltv,
sum(case when cltv_type='Low' then 1 else 0 end) as Low_cltv
from the-name-498307-r7.project_3.customer_ltv
group by payment_method

