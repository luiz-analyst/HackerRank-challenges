SELECT 
CASE
    WHEN G.grade < 8 THEN 'NULL'
    ELSE S.name
    END as name, 
G.Grade,
S.Marks
FROM Students AS S
JOIN Grades AS G ON S.Marks >= G.Min_Mark AND S.Marks <= G.Max_Mark
ORDER BY  G.grade DESC, S.name