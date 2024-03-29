-- Skills requirede for top paying roles

/*SELECT
    job_postings_fact.job_id,
    company_dim.name AS company_name,
    job_title,
    job_title_short,
    job_location,
    job_country,
    salary_year_avg,
    skills_job_dim.skill_id,
    skills_dim.skills
FROM job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id =  job_postings_fact.company_id
LEFT JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id

WHERE 
    job_title_short = 'Data Analyst' AND 
    job_country = 'United States' AND
    salary_year_avg IS NOT NULL 
ORDER BY 
    salary_year_avg DESC;
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        job_title_short,
        job_location,
        job_schedule_type,
        job_country,
        salary_year_avg
    FROM job_postings_fact
    LEFT JOIN company_dim ON company_dim.company_id =  job_postings_fact.company_id
    WHERE 
        job_title_short = 'Data Engineer' AND 
        job_country = 'Germany' AND
        salary_year_avg IS NOT NULL 
    ORDER BY 
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills_dim.skills
    
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY salary_year_avg DESC
;
