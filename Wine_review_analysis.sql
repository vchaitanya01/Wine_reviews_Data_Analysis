-- Calculate the average points of wines

with average as 
( select cast(avg(points) as int) Avg_points , cast(avg(price)as int) avg_price 
from Tb01)


select avg_points from average


-- Calculate the average price of wines

with average as 
( select cast(avg(points) as int) Avg_points , cast(avg(price)as int) 
avg_price from Tb01)


select avg_price from average

-- get the Winery count by country

with Count as 
(select country,count(country) country_count, count(winery) Winery_count 
from Tb01 
group by country)

select country, Winery_count from Count

-- get maximum country count and the respective country name

with Count as 
(select country,count(country) country_count, count(winery) Winery_count 
from Tb01 
group by country)


select country, country_count from count
where country_count =
(select  max(country_count) from Count)

-- get country and province and their price should be above 50

with above as 
(select * from Tb01 where price > 50)

select distinct(country), province 
from above 

-- fetch price where its percentage is greater than 10%

with price_pctg as 
(
select price,cast((price/(select max(price)  from Tb01) * 100) as int)
as price_perct from Tb01
)
select * from price_pctg 
where price_perct > 10


-- Get all total cout of region 1  with respect to country

with region as 
(
select distinct(region_1) dist_region, * from Tb01 
where not region_1 is null
)

select country,count(dist_region) count_region from region group by country

-- Get the differenec between total points and total price

with count as
(
select count(points) points_count, count(price) price_count 
from Tb01
)

select DIFFERENCE(points_count, price_count) difference from count



