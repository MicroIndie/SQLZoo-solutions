#1
select matchid, player from goal where teamid='GER';

#2
SELECT id,stadium,team1,team2 FROM game where id=1012;

#3
SELECT player,teamid,stadium,mdate FROM game JOIN goal ON (id=matchid) where goal.teamid='GER';

#4
select team1,team2,player from game JOIN goal ON(id=matchid) where player like 'Mario%';

#5
SELECT player, teamid, coach,gtime FROM goal JOIN eteam on teamid=id WHERE gtime<=10;

#6
select mdate, teamname from game JOIN eteam on team1=eteam.id where coach='Fernando Santos';

#7
select player from goal join game on id=matchid where stadium='National Stadium, Warsaw';

#8
select distinct(player) from goal join game on matchid=id where (team1='GER' or team2='GER') and teamid!='GER';

#9
SELECT teamname, count(gtime) FROM eteam JOIN goal ON id=teamid group by teamname ORDER BY teamname;

#10
select stadium, count(gtime) from game join goal on id=matchid group by stadium;

#11
SELECT id,mdate, count(gtime) FROM game JOIN goal ON matchid = id WHERE (team1 = 'POL' OR team2 = 'POL') group by id,mdate;

#12
select id, mdate, count(gtime) from game join goal on id=matchid where teamid='GER' group by id, mdate;

#13
SELECT mdate, team1, sum(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1, team2, sum(case when teamid=team2 then 1 else 0 end) score2 FROM game left JOIN goal ON matchid = id group by mdate,matchid,team1,team2;
