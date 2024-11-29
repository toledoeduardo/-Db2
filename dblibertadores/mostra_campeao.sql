SELECT t.name AS champion_name
FROM matches m
JOIN teams t
  ON t.id = (
    CASE 
        WHEN m.score_team1 > m.score_team2 THEN m.team1_id
        WHEN m.score_team2 > m.score_team1 THEN m.team2_id
        ELSE NULL
    END
  )
WHERE m.stage = 'Final';
