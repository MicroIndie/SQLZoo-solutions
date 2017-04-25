#1
select count(id) from stops;

#2
select id from stops where name = 'Craiglockhart';

#3
select id, name from stops join route on stops.id= stop where company='LRT'and num='4';

#4
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num having count(*)=2;

#5
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 and b.stop=149;

#6
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and stopb.name='London Road';

#7
select distinct a.company,a.num from route a join route b on (a.company=b.company and a.num=b.num)
where a.stop=115 and b.stop=137;

#8
select a.company,a.num from route a join route b on(a.company=b.company and a.num=b.num)
join stops stopsa on stopsa.id=a.stop join stops stopb on stopb.id =b.stop
where stopsa.name='Craiglockhart' and stopb.name = 'Tollcross';

#9
select distinct d.name,a.company, a.num from route a join route b on(a.num=b.num and a.company=b.company) join stops c on c.id=a.stop join stops d on d.id=b.stop where c.name='Craiglockhart';

#10
select distinct a.num,a.company,stopb.name, c.num,c.company from route a join route b on(a.company=b.company and a.num=b.num) join (route c join route d on(c.company=d.company and c.num=d.num)) join stops stopa on a.stop=stopa.id join stops stopb on b.stop=stopb.id join stops stopd on d.stop=stopd.id where stopa.name = 'Craiglockhart' and stopd.name='Sighthill' and b.stop=c.stop and (b.num!=c.num or b.company!=c.company) ORDER BY LENGTH(a.num), b.num, stopb.id, LENGTH(c.num), d.num;