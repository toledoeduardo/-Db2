SELECT 
    p.name AS player_name,
    t.name AS team_name,
    SUM(ts.goals_scored) AS total_goals
FROM tournament_statistics ts
JOIN players p ON ts.player_id = p.id
JOIN teams t ON ts.team_id = t.id
GROUP BY p.id, t.name
ORDER BY total_goals DESC
LIMIT 5;

