#1
SELECT name FROM world WHERE population >
(SELECT population FROM world WHERE name='Russia');

#2
select name from world where continent='Europe' and gdp/population >(select gdp/population from world where name = 'United Kingdom');

#3
select name, continent from world where continent in (select continent from world where name IN  ('Argentina', 'Australia')) order by name;

#4
select name, population from world where population >(select population from world where name='Canada') and population <(select population from world where name = 'Poland');

#5
select name, 
concat(
round(100*population/(select population from world where name='Germany')),
'%')
 from world where continent = 'Europe';

#6
select name from world where gdp> all(select gdp from world where continent = 'Europe' and gdp>0);

#7
select continent, name, area from world x where area = (select max(area) from world where continent = x.continent);

#8
select continent, name from world x where name <=all(select name from world where continent=x.continent);

#9
select name,continent, population from world x where 25000000>=(select max(population )from world where continent =x.continent and population >0);

#10
select name, continent from world x where population > 3*(select max(population) from world where continent = x.continent and name <> x.name);

