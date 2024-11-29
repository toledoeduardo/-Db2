DELIMITER $$


CREATE TRIGGER update_tournament_statistics AFTER INSERT ON matches
FOR EACH ROW
BEGIN
   
    UPDATE tournament_statistics
    SET 
        matches_played = matches_played + 1,
        wins = wins + IF(NEW.score_team1 > NEW.score_team2, 1, 0),
        draws = draws + IF(NEW.score_team1 = NEW.score_team2, 1, 0),
        losses = losses + IF(NEW.score_team1 < NEW.score_team2, 1, 0),
        goals_scored = goals_scored + NEW.score_team1,
        goals_conceded = goals_conceded + NEW.score_team2
    WHERE team_id = NEW.team1_id;

   
    UPDATE tournament_statistics
    SET 
        matches_played = matches_played + 1,
        wins = wins + IF(NEW.score_team2 > NEW.score_team1, 1, 0),
        draws = draws + IF(NEW.score_team2 = NEW.score_team1, 1, 0),
        losses = losses + IF(NEW.score_team2 < NEW.score_team1, 1, 0),
        goals_scored = goals_scored + NEW.score_team2,
        goals_conceded = goals_conceded + NEW.score_team1
    WHERE team_id = NEW.team2_id;
END$$

DELIMITER ;
