create table property
(
property_id varchar(50),
property_name varchar(50),
property_type varchar(50),
city varchar(50),
state varchar(50),
listed_date date,
price int,
area_sqft int,
bedrooms int,
bathrooms int,
agent_id varchar(50)
);

select * from property

create table agent
(
agent_id varchar(50) primary key,
agent_name varchar(50),
contact_number bigint,
agency_name varchar(50),
experience_years int,
booking_id varchar(50)
);

drop table agent

select * from agent

create table sales
(
sale_id varchar(50) primary key,
property_id varchar(50),
sale_date date,
sale_price int,
buyer_name varchar(50),
payment_method varchar(50)
);

drop table sales

select * from sales

create table customer
(
customer_id varchar(50),
customer_name varchar(50),
city varchar(50),
budget_min int,
budget_max int,
preferred_property_type varchar(50)
);

select * from customer

create table booking
(
customer_id varchar(50),
booking_id varchar(50),
booking_type varchar(50),
property_type varchar(50),
property_img text,
agent_id varchar(50),
sale_id varchar(50)
);

select * from booking

select city, property_type, avg(price) as avg_price
from property
group by property_type,city;

select p.city,count(s.sale_id) as total_sale
from sales s
join property p on s.property_id=p.property_id
group by city
order by total_sale desc
limit 5;

select a.agent_name, count(s.sale_id) as total_sale
from sales s
join property p on s.property_id=p.property_id
join agent a on p.agent_id=a.agent_id
group by a.agent_name
order by total_sale desc;

select to_char(sale_date, 'YYYY-MM') as month,
avg(sale_price) as avg_price
from sales
group by month
order by month;

select preferred_property_type, count(*) as total_customer
from customer
group by preferred_property_type;

select p.property_id,p.property_name
from property p
left join sales s on p.property_id=s.property_id
where s.property_id is null;

select p.property_type, sum(s.sale_price) as total_price
from sales s
join property p on p.property_id=s.property_id
group by property_type;

select property_type,avg(area_sqft) as avg_area_sqft
from property
group by property_type;

select payment_method, count(*) total_payment
from sales
group by payment_method;

select city, sum(s.sale_price) as total_revenue
from sales s
join property p on p.property_id=s.property_id
group by p.city
order by total_revenue desc;

select p.property_name, s.sale_price as total_price
from sales s
join property p on p.property_id=s.property_id
order by s.sale_price desc
limit 5;

