SELECT 
    gs.group_name AS Grupo,
    t.name AS Time,
    gs.matches_played AS Partidas_Jogadas,
    gs.wins AS Vitórias,
    gs.draws AS Empates,
    gs.losses AS Derrotas,
    gs.points AS Pontos,
    gs.goals_scored AS Saldo_gols
FROM 
    group_stage gs
JOIN 
    teams t ON gs.team_id = t.id
ORDER BY 
    gs.group_name ASC,
    gs.points DESC,
    gs.goals_scored DESC; -- Ordena por pontos e, em caso de empate, pelos gols marcados
