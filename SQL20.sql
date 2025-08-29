-- 1.The first example shows the goal scored by a player with the last name 'Bender'. The * says to list all the columns in the table - a shorter way of saying matchid, teamid, player, gtimeModify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
SELECT matchid , player FROM goal 
WHERE teamid = 'GER';


-- 2.From the previous query you can see that Lars Bender's scored a goal in game 1012. Now we want to know what teams were playing in that match.
SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012;

-- 3.You can combine the two steps into a single query with a JOIN.
SELECT goal.player,goal.teamid , game.stadium , game.mdate
  FROM game JOIN goal ON (game.id=goal.matchid)
WHERE goal.teamid = 'GER';

-- 4.Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SELECT game.team1 , game.team2 , goal.player FROM game
JOIN goal ON game.id = goal.matchid
WHERE goal.player LIKE 'Mario%';

-- 5.The table eteam gives details of every national team including the coach. You can JOIN goal to eteam using the phrase goal JOIN eteam on teamid=id

-- 6.Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10

SELECT goal.player, goal.teamid, eteam.coach , goal.gtime
FROM goal JOIN eteam ON eteam.id = goal.teamid
WHERE gtime<=10;

-- 6.List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.

SELECT g.mdate, e.teamname
FROM game g
JOIN eteam e ON g.team1 = e.id OR g.team2 = e.id
WHERE e.coach = 'Fernando Santos' AND e.id = g.team1;

-- 7.List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'

SELECT goal.player FROM goal 
JOIN game ON goal.matchid = game.id
WHERE game.stadium = 'National Stadium, Warsaw';

-- 8.The example query shows all goals scored in the Germany-Greece quarterfinal.Instead show the name of all players who scored a goal against Germany.
SELECT DISTINCT g.player
FROM goal g
JOIN game m ON g.matchid = m.id
WHERE g.teamid <> 'GER'
  AND ('GER' IN (m.team1, m.team2));

-- 9.Show teamname and the total number of goals scored.
SELECT e.teamname, COUNT(*) AS goals
FROM eteam e
JOIN goal g ON e.id = g.teamid
GROUP BY e.teamname;

-- 10.Show the stadium and the number of goals scored in each stadium.
SELECT m.stadium , COUNT(*) AS goals
FROM game m
JOIN goal g ON g.matchid = m.id
GROUP BY m.stadium;

-- 11.For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT g.matchid, m.mdate, COUNT(*) AS goals
FROM game m 
JOIN goal g ON g.matchid = m.id 
WHERE (m.team1 = 'POL' OR m.team2 = 'POL')
GROUP BY g.matchid, m.mdate;

-- 12.For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
SELECT m.id AS matchid,m.mdate,
COUNT(g.teamid) AS goal_count
FROM game m
JOIN goal g ON m.id = g.matchid
WHERE g.teamid = 'GER'
GROUP BY m.id, m.mdate
ORDER BY m.mdate, m.id;
