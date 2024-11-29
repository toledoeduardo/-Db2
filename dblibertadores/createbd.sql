CREATE DATABASE CopaLibertadores;

USE CopaLibertadores;


CREATE TABLE teams (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL
);


CREATE TABLE players (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(50) NOT NULL,
    team_id INT NOT NULL,
    FOREIGN KEY (team_id) REFERENCES teams(id)
);


CREATE TABLE stadiums (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    capacity INT NOT NULL
);


CREATE TABLE matches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    team1_id INT NOT NULL,
    team2_id INT NOT NULL,
    stadium_id INT NOT NULL,
    match_date DATE NOT NULL,
    stage ENUM('Group', 'Round of 16', 'Quarter-finals', 'Semi-finals', 'Final') NOT NULL,
    score_team1 INT DEFAULT NULL,
    score_team2 INT DEFAULT NULL,
    FOREIGN KEY (team1_id) REFERENCES teams(id),
    FOREIGN KEY (team2_id) REFERENCES teams(id),
    FOREIGN KEY (stadium_id) REFERENCES stadiums(id)
);


CREATE TABLE group_stage (
    id INT AUTO_INCREMENT PRIMARY KEY,
    group_name CHAR(1) NOT NULL,
    team_id INT NOT NULL,
    matches_played INT DEFAULT 0,
    wins INT DEFAULT 0,
    draws INT DEFAULT 0,
    losses INT DEFAULT 0,
    points INT DEFAULT 0,
    FOREIGN KEY (team_id) REFERENCES teams(id)
);


CREATE TABLE knockout_stage (
    id INT AUTO_INCREMENT PRIMARY KEY,
    match_id INT NOT NULL,
    stage ENUM('Round of 16', 'Quarter-finals', 'Semi-finals', 'Final') NOT NULL,
    winner_team_id INT DEFAULT NULL,
    FOREIGN KEY (match_id) REFERENCES matches(id),
    FOREIGN KEY (winner_team_id) REFERENCES teams(id)
);


CREATE TABLE tournament_statistics (
    id INT AUTO_INCREMENT PRIMARY KEY,
    team_id INT,
    player_id INT,
    matches_played INT DEFAULT 0,
    wins INT DEFAULT 0,
    draws INT DEFAULT 0,
    losses INT DEFAULT 0,
    goals_scored INT DEFAULT 0,
    goals_conceded INT DEFAULT 0,
    yellow_cards INT DEFAULT 0,
    red_cards INT DEFAULT 0,
    stage ENUM('Group', 'Round of 16', 'Quarter-finals', 'Semi-finals', 'Final') DEFAULT NULL,
    FOREIGN KEY (team_id) REFERENCES teams(id),
    FOREIGN KEY (player_id) REFERENCES players(id)
);
