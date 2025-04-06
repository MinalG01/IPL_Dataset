create database Ipl;
USE ipl;
select * from df_matches;
select * from df_deliveries_dataset;
SELECT id, season, winner FROM df_matches;
SELECT * FROM df_matches WHERE city LIKE 'M%';
SELECT season, COUNT(*) AS total_matches FROM df_matches GROUP BY season;
SELECT * FROM df_matches WHERE season = 2023 and city = 'Mumbai';
SELECT * FROM df_matches WHERE season = 2024 or player_of_match="V Kohli";
SELECT * FROM df_matches WHERE season = 2024 and player_of_match="V Kohli";
SELECT * FROM df_matches WHERE season = 2023;
-- --top 10 batsman with the most run
SELECT batter, SUM(total_runs) AS total_runs
FROM df_deliveries_dataset
GROUP BY batter
ORDER BY total_runs DESC
LIMIT 10;
select dismissal_kind from df_deliveries_dataset;
-- count of dismissal kind
SELECT COUNT(DISTINCT dismissal_kind) AS distinct_dismissals
FROM df_deliveries_dataset
WHERE dismissal_kind IS NOT NULL AND dismissal_kind <> '';

-- just check how many types of dismissal kind present
SELECT dismissal_kind, COUNT(*) AS occurrence_count
FROM df_deliveries_dataset
WHERE dismissal_kind IS NOT NULL AND dismissal_kind <> ''
GROUP BY dismissal_kind;

-- check the dismissal kind of 
SELECT bowler,COUNT(*) AS total_wickets 
FROM df_deliveries_dataset 
WHERE dismissal_kind IN ('bowled', 'caught', 'run out', 'lbw', 'retired hurt','stumped', 'caught and bowled', 'hit wicket','obstructing the field') 
GROUP BY bowler 
ORDER BY total_wickets DESC 
LIMIT 10;

-- Most Runs in 16 to 20 over
SELECT batter, SUM(total_runs) AS total_runs
FROM df_deliveries_dataset
WHERE 'over' BETWEEN 10 AND 15
GROUP BY batter
ORDER BY total_runs DESC;

-- Finding the Best Batter in Each Season
SELECT season, batter, SUM(total_runs) AS total_runs
FROM df_matches m
JOIN df_deliveries_dataset d ON m.id = d.match_id
GROUP BY season, batter
ORDER BY season, total_runs DESC;

 -- team won the most matches
SELECT winner, COUNT(*) AS total_wins 
FROM df_matches 
WHERE winner IS NOT NULL 
GROUP BY winner 
ORDER BY total_wins DESC;

-- venue where most matches played
SELECT venue, COUNT(*) AS matches_played 
FROM df_matches 
GROUP BY venue 
ORDER BY matches_played DESC 
LIMIT 1;

-- batting or fielding
SELECT toss_decision, COUNT(*) AS count 
FROM df_matches 
GROUP BY toss_decision;

-- team won the most tosses
SELECT toss_winner, COUNT(*) AS toss_wins 
FROM df_matches 
GROUP BY toss_winner 
ORDER BY toss_wins DESC;

-- Match Statistics
SELECT COUNT(*) AS total_matches FROM df_matches;

-- match played per season
SELECT season, COUNT(*) AS total_matches 
FROM df_matches 
GROUP BY season 
ORDER BY season;

-- select player name
SELECT DISTINCT player_of_match AS Player_Name
FROM df_matches;

-- teams wins the most finals
SELECT winner, COUNT(*) AS titles_won 
FROM df_matches 
WHERE match_type = 'Final' 
GROUP BY winner 
ORDER BY titles_won DESC;

-- cities where most matches played
SELECT city, COUNT(*) AS matches_played 
FROM df_matches 
GROUP BY city 
ORDER BY matches_played DESC 
LIMIT 10;

-- player of the match
SELECT player_of_match, COUNT(*) AS awards 
FROM df_matches 
GROUP BY player_of_match 
ORDER BY awards DESC 
LIMIT 10;

-- using case statement
select batter,
extra_runs,
case when extra_runs between 0 and 4 then 'Low'
     when extra_runs between 5 and 10 then 'Medium'
    -- when extra_runs > 10 then "High"
     else 'high'
     end as average
     from df_deliveries_dataset;
SELECT * FROM df_matches WHERE city LIKE 'w%';
SELECT result from df_matches WHERE result ='wickets';