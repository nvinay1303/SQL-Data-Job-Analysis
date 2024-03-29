
/*
WITH most_demanded_skills AS (
    SELECT
        COUNT(job_postings_fact.job_id) AS skill_count,
        skills_job_dim.skill_id
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim
    ON skills_job_dim.job_id = job_postings_fact.job_id
    WHERE 
        job_title_short = 'Data Engineer'
        --job_location = 'Anywhere'
    GROUP BY skill_id
    ORDER BY skill_count DESC
)

SELECT 
    most_demanded_skills.skill_id,
    skills_dim.skills, 
    most_demanded_skills.skill_count,
    skills_dim.type
FROM most_demanded_skills
INNER JOIN skills_dim
ON  skills_dim.skill_id = most_demanded_skills.skill_id
ORDER BY most_demanded_skills.skill_count DESC;
*/

SELECT 
    skills_dim.skills,
    COUNT(job_postings_fact.job_id) AS skill_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE 
    job_postings_fact.job_title_short = 'Data Engineer'
   -- job_postings_fact.job_location = 'Germany'
GROUP BY skills_dim.skills 
ORDER BY skill_count DESC
LIMIT 5;