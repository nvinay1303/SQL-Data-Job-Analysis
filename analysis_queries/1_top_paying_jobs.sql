--Top paying data engineer jobs

SELECT
    job_id,
    company_dim.name AS company_name,
    job_title,
    job_title_short,
    job_location,
    job_schedule_type,
    job_country,
    job_posted_date,
    salary_year_avg
FROM job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id =  job_postings_fact.company_id
WHERE 
    job_title_short = 'Data Engineer' AND 
    job_country = 'Germany' AND
    salary_year_avg IS NOT NULL 
ORDER BY 
    salary_year_avg DESC
LIMIT 10;