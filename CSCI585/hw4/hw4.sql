select name,count from babynames.names_2014 
where gender = 'M' and name like '_a%' order by count desc

select * from babynames.names_2014 
where name like 'hao%'

%%bq query
SELECT wday
FROM `publicdata.samples.natality` where year = 1992 and month = 8 and  day  = 4

%%bq query --name year_count
SELECT CAST(source_year AS string) AS year, COUNT(source_year) as year_number
FROM `publicdata.samples.natality` where year <> 1992 and month = 8 and  day  = 4 
GROUP BY source_year
ORDER BY source_year

%chart pie --data year_count --fields year,year_number


#standardSQL
SELECT
DISTINCT DATE(pickup_datetime) as date_time
,
SUM(Passenger_count) as passenger_count
FROM
  `bigquery-public-data.new_york.tlc_yellow_trips_2010`
GROUP BY
  date_time
UNION ALL
SELECT
DATE(pickup_datetime) as date_time
,
SUM(Passenger_count) as passenger_count
FROM
  `bigquery-public-data.new_york.tlc_yellow_trips_2009`
GROUP BY
  date_time
UNION ALL
SELECT
DATE(pickup_datetime) as date_time
,
SUM(Passenger_count) as passenger_count
FROM
  `bigquery-public-data.new_york.tlc_yellow_trips_2011`
GROUP BY
  date_time
UNION ALL
SELECT
DATE(pickup_datetime) as date_time
,
SUM(Passenger_count)
FROM
  `bigquery-public-data.new_york.tlc_yellow_trips_2012`
GROUP BY
  date_time
UNION ALL
SELECT date_time, sum(Passenger_count) as passenger_count FROM
(SELECT date_time, Passenger_count 
FROM
( SELECT
DATE(pickup_datetime) as date_time
,
SUM(Passenger_count) as Passenger_count
FROM
  `bigquery-public-data.new_york.tlc_yellow_trips_2013`
GROUP BY
  date_time)
UNION ALL
SELECT date_time, Passenger_count 
FROM
( SELECT
DATE(pickup_datetime) as date_time
,
SUM(Passenger_count) as Passenger_count
FROM
  `bigquery-public-data.new_york.tlc_green_trips_2013`
GROUP BY
  date_time))
GROUP BY
  date_time
UNION ALL
SELECT date_time, sum(Passenger_count) as passenger_count FROM
(SELECT date_time, Passenger_count 
FROM
( SELECT
DATE(pickup_datetime) as date_time
,
SUM(Passenger_count) as Passenger_count
FROM
  `bigquery-public-data.new_york.tlc_yellow_trips_2014`
GROUP BY
  date_time)
UNION ALL
SELECT date_time, Passenger_count 
FROM
( SELECT
DATE(pickup_datetime) as date_time
,
SUM(Passenger_count) as Passenger_count
FROM
  `bigquery-public-data.new_york.tlc_green_trips_2014`
GROUP BY
  date_time))
GROUP BY
  date_time
ORDER BY
  date_time


#standardSQL
select year,total_passenger from
(
select t_1.year as year ,(t_1.total_passenger+t_2.total_passenger) as total_passenger from
(select EXTRACT( YEAR from pickup_datetime) as year, sum(passenger_count) as total_passenger
from   `bigquery-public-data.new_york.tlc_yellow_trips_2009`
Group by 
 year) as t_1,
(select EXTRACT( YEAR from pickup_datetime) as year, sum(passenger_count) as total_passenger
from   `bigquery-public-data.new_york.tlc_yellow_trips_2010`
where DATE(pickup_datetime) < '2010-1-10'
Group by 
 year) as t_2
UNION ALL
select t_3.year as year ,(t_3.total_passenger+t_4.total_passenger) as total_passenger from
(select EXTRACT( YEAR from pickup_datetime) as year, sum(passenger_count) as total_passenger
from   `bigquery-public-data.new_york.tlc_yellow_trips_2010`
Group by 
 year) as t_3,
(select EXTRACT( YEAR from pickup_datetime) as year, sum(passenger_count) as total_passenger
from   `bigquery-public-data.new_york.tlc_yellow_trips_2011`
where DATE(pickup_datetime) < '2011-1-10'
Group by 
 year) as t_4
Where t_3.year = 2010
UNION ALL
select t_7.year as year ,(t_7.total_passenger + t_10.total_passenger) as total_passenger
from
(select t_5.year as year ,(t_5.total_passenger+t_6.total_passenger) as total_passenger from
(select EXTRACT( YEAR from pickup_datetime) as year, sum(passenger_count) as total_passenger
from   `bigquery-public-data.new_york.tlc_yellow_trips_2014`
Group by 
 year) as t_5,
(select EXTRACT( YEAR from pickup_datetime) as year, sum(passenger_count) as total_passenger
from   `bigquery-public-data.new_york.tlc_green_trips_2014`
Group by 
 year) as t_6) as t_7,
(select t_8.year as year ,(t_8.total_passenger+t_9.total_passenger) as total_passenger from
(select EXTRACT( YEAR from pickup_datetime) as year, sum(passenger_count) as total_passenger
from   `bigquery-public-data.new_york.tlc_yellow_trips_2015`
where DATE(pickup_datetime) < '2015-1-10' 
Group by 
 year) as t_8,
(select EXTRACT( YEAR from pickup_datetime) as year, sum(passenger_count) as total_passenger
from   `bigquery-public-data.new_york.tlc_green_trips_2015`
where DATE(pickup_datetime) < '2015-1-10'
Group by 
 year) as t_9) as t_10
order by 
year)

