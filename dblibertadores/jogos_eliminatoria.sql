SELECT 
    m.stage AS Fase,
    LEAST(t1.name, t2.name) AS Time1, -- Garante que a ordem dos times seja consistente
    GREATEST(t1.name, t2.name) AS Time2, -- Garante que Time1 sempre venha antes alfabeticamente
    SUM(m.score_team1) AS Gols_Time1_Total, -- Soma dos gols do Time 1 em ambos os jogos
    SUM(m.score_team2) AS Gols_Time2_Total, -- Soma dos gols do Time 2 em ambos os jogos
    SUM(m.score_team1 + m.score_team2) AS Total_Gols -- Soma total dos gols nos dois jogos
FROM 
    matches m
JOIN 
    teams t1 ON m.team1_id = t1.id
JOIN 
    teams t2 ON m.team2_id = t2.id
WHERE 
    m.stage IN ('R16', 'QF', 'SF', 'Final') -- Apenas fases eliminatórias
GROUP BY 
    m.stage, LEAST(t1.name, t2.name), GREATEST(t1.name, t2.name) -- Agrupa por confronto e fase
ORDER BY 
    FIELD(m.stage, 'R16', 'QF', 'SF', 'Final'), -- Ordena pela sequência das fases
    Total_Gols DESC; -- Ordena pelo total de gols
