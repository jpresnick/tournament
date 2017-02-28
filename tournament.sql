-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.
DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;
\c tournament

CREATE TABLE players (id SERIAL PRIMARY KEY,
					name TEXT);

CREATE TABLE matches (id SERIAL PRIMARY KEY,
					winner INTEGER REFERENCES players(id),
					loser INTEGER REFERENCES players(id));

CREATE VIEW wins AS SELECT winner, count(*) as wins FROM matches GROUP BY winner;

CREATE VIEW with_wins AS SELECT players.id, players.name, wins.wins 
	FROM players LEFT JOIN wins 
	ON players.id = wins.winner 
	GROUP BY wins.wins, players.id;

CREATE VIEW total_matches AS SELECT players.id, count(matches) AS matches 
	FROM players LEFT JOIN matches 
	ON players.id = winner OR players.id = loser 
	GROUP BY players.id;

CREATE VIEW with_matches AS SELECT with_wins.id, with_wins.name, coalesce(with_wins.wins,0), total_matches.matches
	from total_matches LEFT JOIN with_wins
	ON with_wins.id = total_matches.id  order by with_wins.wins desc;