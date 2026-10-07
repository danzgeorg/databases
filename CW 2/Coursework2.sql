/*
Student name:  Daniel Georgiev
Student ID: 240015628
*/

/* SECTION 1 - CREATE TABLE STATEMENTS */

CREATE TABLE Tournament (
    tournament_id INTEGER PRIMARY KEY,
    prize_pool INTEGER NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);


CREATE TABLE Team (
    team_id INTEGER PRIMARY KEY,
    team_name VARCHAR(100) NOT NULL,
    captain_id INTEGER,
    tournament_id INTEGER,
    FOREIGN KEY (tournament_id) REFERENCES Tournament(tournament_id)
);

CREATE TABLE Player (
    player_id INTEGER PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    email VARCHAR(100) NOT NULL,
    join_date DATE NOT NULL,
    team_id INTEGER,
    FOREIGN KEY (team_id) REFERENCES Team(team_id) ON DELETE CASCADE
);

CREATE TABLE GameStatus (
    status_id INTEGER PRIMARY KEY,
    status_description VARCHAR(50) NOT NULL
);

CREATE TABLE Game (
    game_id INTEGER PRIMARY KEY,
    game_date DATE NOT NULL,
    tournament_id INTEGER,
    home_team_id INTEGER,
    away_team_id INTEGER,
    status_id INTEGER,
    FOREIGN KEY (tournament_id) REFERENCES Tournament(tournament_id),
    FOREIGN KEY (home_team_id) REFERENCES Team(team_id) ON DELETE CASCADE,
    FOREIGN KEY (away_team_id) REFERENCES Team(team_id) ON DELETE CASCADE,
    FOREIGN KEY (status_id) REFERENCES GameStatus(status_id)
);

CREATE TABLE GameStats (
    stats_id INTEGER PRIMARY KEY,
    kills INTEGER NOT NULL,
    deaths INTEGER NOT NULL,
    assists INTEGER NOT NULL,
    total_points INTEGER NOT NULL,
    damage_dealt INTEGER NOT NULL,
    total_headshots INTEGER NOT NULL,
    game_id INTEGER,
    player_id INTEGER,
    FOREIGN KEY (game_id) REFERENCES Game(game_id) ON DELETE CASCADE,
    FOREIGN KEY (player_id) REFERENCES Player(player_id) ON DELETE CASCADE
);

/* SECTION 2 - INSERT STATEMENTS */

INSERT INTO Tournament (tournament_id, prize_pool, start_date, end_date) VALUES 
(1, 50000, '2024-01-01', '2024-01-15'),
(2, 75000, '2024-02-01', '2024-02-20'),
(3, 60000, '2024-03-01', '2024-03-15'),
(4, 80000, '2024-04-01', '2024-04-18'),
(5, 100000, '2024-05-01', '2024-05-25'),
(6, 70000, '2024-06-01', '2024-06-15'),
(7, 85000, '2024-07-01', '2024-07-20'),
(8, 45000, '2024-08-01', '2024-08-10'),
(9, 95000, '2024-09-01', '2024-09-18'),
(10, 120000, '2024-10-01', '2024-10-25');

INSERT INTO Team (team_id, team_name, captain_id, tournament_id) VALUES 
(1, 'Team A', NULL, 1), 
(2, 'Team B', NULL, 1), 
(3, 'Team C', NULL, 2), 
(4, 'Team D', NULL, 2), 
(5, 'Team E', NULL, 3), 
(6, 'Team F', NULL, 3), 
(7, 'Team G', NULL, 4), 
(8, 'Team H', NULL, 5), 
(9, 'Team I', NULL, 6), 
(10, 'Team J', NULL, 7), 
(11, 'Team K', NULL, 8), 
(12, 'Team L', NULL, 9), 
(13, 'Team M', NULL, 10), 
(14, 'Team N', NULL, 4), 
(15, 'Team O', NULL, 5),
(16, 'Team A', NULL, 2);

INSERT INTO Player (player_id, name, email, join_date, team_id) VALUES 
(1, 'Alice', 'alice@example.com', '2023-01-01', 1),
(2, 'Bob', 'bob@example.com', '2023-01-02', 1),
(3, 'Charlie', 'charlie@example.com', '2023-01-03', 2),
(4, 'David', 'david@example.com', '2023-02-01', 3),
(5, 'Eve', 'eve@example.com', '2023-02-05', 3),
(6, 'Frank', 'frank@example.com', '2023-03-01', 4),
(7, 'Grace', 'grace@example.com', '2023-03-10', 5),
(8, 'Harry', 'harry@example.com', '2023-03-20', 6),
(9, 'Ian', 'ian@example.com', '2023-04-01', 7),
(10, 'Jack', 'jack@example.com', '2023-04-15', 8),
(11, 'Kian', 'kian@example.com', '2023-05-01', 9),
(12, 'Liam', 'liam@example.com', '2023-05-10', 10),
(13, 'Mia', 'mia@example.com', '2023-06-01', 11),
(14, 'Nadya', 'nadya@example.com', '2023-06-15', 12),
(15, 'Oscar', 'oscar@example.com', '2023-07-01', 13),
(16, 'Alice', 'alice@example.com', '2023-01-01', 2);

INSERT INTO GameStatus (status_id, status_description) VALUES 
(1, 'Scheduled'), 
(2, 'Completed');

INSERT INTO Game (game_id, game_date, tournament_id, home_team_id, away_team_id, status_id) VALUES 
(1, '2024-01-05', 1, 1, 2, 1),
(2, '2024-01-10', 1, 1, 3, 2),
(3, '2024-02-05', 2, 4, 5, 1),
(4, '2024-03-10', 3, 6, 7, 2),
(5, '2024-04-15', 4, 8, 9, 1),
(6, '2024-05-20', 5, 10, 11, 2),
(7, '2024-06-12', 6, 12, 13, 1),
(8, '2024-07-18', 7, 14, 15, 2),
(9, '2024-08-08', 8, 1, 8, 1),
(10, '2024-09-16', 9, 2, 9, 2),
(11, '2024-10-20', 10, 3, 10, 1),
(12, '2024-10-25', 10, 4, 12, 1);

INSERT INTO GameStats (stats_id, kills, deaths, assists, total_points, damage_dealt, total_headshots, game_id, player_id) VALUES
(1, 10, 3, 5, 30, 1500, 2, 1, 1),
(2, 15, 4, 8, 45, 2000, 4, 2, 2),
(3, 8, 2, 6, 25, 1200, 3, 3, 3),
(4, 5, 2, 3, 10, 1000, 5, 1, 2),
(5, 12, 3, 7, 35, 1700, 5, 5, 5),
(6, 18, 6, 12, 55, 2300, 8, 6, 6),
(7, 14, 4, 9, 40, 1900, 6, 7, 7),
(8, 16, 3, 11, 50, 2200, 7, 8, 8),
(9, 9, 2, 5, 28, 1400, 3, 9, 9),
(10, 13, 3, 8, 38, 1800, 4, 10, 10),
(11, 11, 4, 6, 33, 1600, 3, 11, 11),
(12, 17, 5, 9, 48, 2100, 7, 12, 12);

/* SECTION 3 - UPDATE STATEMENTS */

UPDATE Team 
SET captain_id = (SELECT player_id FROM Player WHERE name = 'Alice' and player_id = 1) 
WHERE team_id = 1;

UPDATE Team 
SET tournament_id = 10 
WHERE team_id = 13;


/* SECTION 4 - SELECT STATEMENTS */

/* 1) Who is the captain of each team? */
SELECT Team.team_name, Player.name AS captain_name
FROM Team
LEFT JOIN Player ON Team.captain_id = Player.player_id
WHERE Player.player_id IS NOT NULL;

/* 2) Which players joined more than 1 team? */
SELECT Player.name, COUNT(DISTINCT Player.team_id) AS teams_joined
FROM Player
GROUP BY Player.name
HAVING COUNT(DISTINCT Player.team_id) > 1;

/* 3) What is the total prize pool of every tournament held? */
SELECT SUM(Tournament.prize_pool) AS total_prize_pool
FROM Tournament
WHERE Tournament.prize_pool > 0;

/* 4) How many headshots were recorded by each player in a specific match? */
SELECT Player.name, GameStats.total_headshots
FROM GameStats
INNER JOIN Player ON GameStats.player_id = Player.player_id
WHERE GameStats.game_id = 1;

/* 5) How many matches are scheduled or ongoing in a specific tournament? */
SELECT COUNT(Game.game_id) AS scheduled_or_ongoing_games
FROM Game
WHERE Game.tournament_id = 1 AND Game.status_id = 1;

/* 6) How many matches took place between given start & end dates of a tournament? */
SELECT COUNT(Game.game_id) AS matches_within_dates
FROM Game
WHERE Game.game_date BETWEEN '2024-01-01' AND '2024-01-15';

/* 7) Which team had the highest prize pool and which team won it? */
SELECT t.team_name, t.tournament_id, MAX(tr.prize_pool) AS highest_prize_pool
FROM Team t
INNER JOIN Tournament tr ON t.tournament_id = tr.tournament_id
WHERE t.tournament_id IS NOT NULL
GROUP BY t.team_name, t.tournament_id;

/* 8) How many teams have participated in more than 1 tournament? */
SELECT Team.team_name, COUNT(DISTINCT Team.tournament_id) AS tournaments_participated
FROM Team
GROUP BY Team.team_name
HAVING COUNT(DISTINCT Team.tournament_id) > 1;



/* SECTION 5 - DELETE ROWS */

DELETE FROM Player WHERE player_id = 3;
DELETE FROM Team
WHERE team_id NOT IN (
    SELECT DISTINCT team_id
    FROM Player);

/* SECTION 6 - DROP TABLES */

DROP TABLE IF EXISTS GameStats;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS GameStatus;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Team;
DROP TABLE IF EXISTS Tournament;

SHOW TABLES;