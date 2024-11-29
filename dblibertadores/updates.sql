UPDATE tournament_statistics
SET goals_scored = 10
WHERE player_id = 525 AND team_id = 21;

UPDATE tournament_statistics
SET goals_scored = 7
WHERE player_id = 1 AND team_id = 1;

UPDATE tournament_statistics
SET goals_scored = 5
WHERE player_id = 2 AND team_id = 1;

UPDATE tournament_statistics
SET goals_scored = 5
WHERE player_id = 41 AND team_id = 2;

UPDATE players
SET name = 'Mauricio Gonzatto'
WHERE id = 519 AND name = 'Brian Rodríguez' AND position = 'Midfielder' AND team_id = 21;

UPDATE tournament_statistics
SET goals_scored = 14
WHERE player_id = 519 AND team_id = 21;

UPDATE group_stage gs
JOIN (
    SELECT 
        t.id AS team_id,
        SUM(CASE WHEN t.id = m.team1_id THEN m.score_team1 ELSE m.score_team2 END) AS total_goals_scored
    FROM 
        matches m
    JOIN 
        teams t ON t.id IN (m.team1_id, m.team2_id)
    WHERE 
        m.stage = 'Group Stage' -- Apenas partidas da fase de grupos
    GROUP BY 
        t.id
) stats ON gs.team_id = stats.team_id
SET 
    gs.goals_scored = stats.total_goals_scored;
    
    UPDATE matches m
JOIN group_stage gs1 ON m.team1_id = gs1.team_id
JOIN group_stage gs2 ON m.team2_id = gs2.team_id
SET m.group_name = gs1.group_name
WHERE m.stage = 'Group'; 






