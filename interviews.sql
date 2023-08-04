SELECT 
c.contest_id,
c.hacker_id,
c.name,
SUM(s.total_submissions),
SUM(s.total_accepted_submissions),
SUM(v.total_views),
SUM(v.total_unique_views)
FROM contests as c
LEFT JOIN colleges as co
ON c.contest_id = co.contest_id
LEFT JOIN challenges as ch
ON ch.college_id = co.college_id
LEFT JOIN 
(SELECT challenge_id,
 SUM(total_views)as total_views,
 SUM(total_unique_views) as total_unique_views
 FROM view_stats 
 GROUP BY challenge_id) as v
ON ch.challenge_id = v.challenge_id
LEFT JOIN 
(SELECT challenge_id,
 SUM(total_submissions) as total_submissions,
 SUM(total_accepted_submissions) as total_accepted_submissions
 FROM submission_stats 
 GROUP BY challenge_id) as s
ON ch.challenge_id = s.challenge_id
GROUP BY c.contest_id, c.hacker_id, c.name
HAVING SUM(s.total_submissions)+ SUM(s.total_accepted_submissions) + SUM(v.total_views) + SUM(v.total_unique_views) > 0
ORDER BY c.contest_id
;