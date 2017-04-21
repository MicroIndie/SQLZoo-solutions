#1
SELECT id, title FROM movie WHERE yr=1962;

#2
select yr from movie where title = 'Citizen Kane';

#3
select id,title,yr from movie where title like '%Star Trek%';

#4
select id from actor where name = 'Glenn Close';

#5
select id from movie where title = 'Casablanca';

#6
select name from actor join casting on id=actorid where movieid=11768;

#7
select name from actor join casting on id=actorid join movie on movie.id=movieid where title='Alien';

#8
select title from movie join casting on movieid=movie.id join actor on actor.id=actorid where actor.name='Harrison Ford';

#9
select title from movie join casting on movieid=movie.id join actor on actor.id=actorid where actor.name='Harrison Ford' and ord!=1;

#10
select title, name from movie join casting on movieid=movie.id join actor on actor.id=actorid where yr=1962 and ord=1;

#11
SELECT yr,COUNT(title) FROM movie JOIN casting ON movie.id=movieid JOIN actor   ON actorid=actor.id where name='John Travolta' GROUP BY yr HAVING COUNT(title)>2;

#12
select title, name from movie join casting on movie.id=movieid join actor on actor.id=actorid
where movie.id in (select movie.id from movie join casting on movie.id=movieid join actor on actor.id=actorid where name = 'Julie Andrews') and ord=1;

#13
select name from actor where id in (select actorid from casting where ord=1 group by actorid having sum(ord)>=30) order by name;

#14
select title,count(actorid) from movie join casting on movieid=id where yr=1978 group by title,yr order by count(actorid) DESC,title ;

#15
select name from actor join casting on actorid= id where movieid in (select movieid from casting join actor on actorid=id where name = 'Art Garfunkel') and name !='Art Garfunkel';