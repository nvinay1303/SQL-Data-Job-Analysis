SELECT 
    skills_dim.skills,
    ROUND(AVG(salary_year_avg)) AS avg_salary_skill
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE 
    job_postings_fact.job_title_short = 'Data Engineer' AND
    salary_year_avg IS NOT NULL
GROUP BY skills_dim.skills
ORDER BY avg_salary_skill DESC
LIMIT 20;

/* CHATGPT Insights

Based on the provided data on top-paying skills for data engineer jobs, here are some insights summarized into three bullet points:

Demand for JavaScript and its Frameworks:

Skills like Node.js and Vue.js (along with Next.js) are among the top-paying skills. This reflects the significant demand for engineers proficient in JavaScript and its associated frameworks, likely due to the widespread use of these technologies in web development and data engineering projects.
Database Expertise Remains Valuable:

MongoDB (mongo) and Apache Cassandra are both database technologies highly valued in the market, as indicated by their relatively high average salary offerings. This suggests a continued need for professionals with expertise in NoSQL databases for handling large volumes of unstructured data efficiently.
Emerging Technologies Garnering Attention:

Skills like Solidity (for blockchain development) and Rust (for systems programming) are also among the top-paying skills. This indicates a growing demand for professionals with expertise in emerging technologies such as blockchain and modern system programming languages, possibly driven by industries exploring innovative solutions and architectures.
