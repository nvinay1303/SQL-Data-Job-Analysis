# SQL Project: Data Job Analysis

## Table of Contents
- [Introduction](#introduction)
- [Dataset Description](#dataset-description)
- [Project Methodology](#project-methodology)
- [Tools Used](#tools-used)
- [Requirements](#requirements)
- [Analysis](#analysis)
- [Results](#results)
- [Conclusion](#conclusion)
- [Contributing](#contributing) 

## Introduction
The project aims to analyze job data by extracting insights from a real-life dataset related to job postings. The goal of this project is to perform exploratory data analysis on a large job-related data using SQL. 

By analyzing the dataset, we aim to uncover trends, patterns, and insights that can provide valuable information primarily for job seekers such as top-paying skills, in-demand skills, high-demand jobs with a focus on Germany.

SQL queries used can be found here - [analysis_queries](/analysis_queries/)

## Dataset Description

The dataset represents  is sourced directly from the repository of  YouTuber [Luke Barousse](https://drive.google.com/drive/folders/1moeWYoUtUklJO6NJdWo9OV8zWjRn0rjN). A version of the dataset focussed on the US market can be found on [Kaggle]. 

For context, the data was collected from Google search results for job postings by country with s focus on data roles. The collection involved connecting via python to an API in order to extract the data into a database.(https://www.kaggle.com/datasets/lukebarousse/data-analyst-job-postings-google-search/data).

The dataset used in this project comprises of 4 csv files (or tables) covering the following details -
1. job_postings_fact - The fact table containing the core data to be utilized for the analysis including job titles, salaries, locations
2. company_dim - Dimension table containing company details; it is tied the job_postings_fact file with the job_id primary key
3. skills_job_dim - Dimension table containing the skill ids associated with each job id, linked by the job_id primary key
4. skills_dim - Dimension table containing corresponding skills associated with every skill_id.


## Tools Used

The following tools are utilized for the analysis - 
- Visual Studio Code - The IDE used for querying the dataset, performing intellgent analysis and pushing the code changes to Github
- SQL - The programming language used for interacting with a relational database
- PostgreSQL - The tables from the dataset are loaded onto the postgresql relational database management system
- Git - Version control system utilized for tracking changes in the code
- Github - The remote repository used for sharing the code, analyses and visualization


## Project Methodology

1. **Download data**: the CSV data files used for analysis was downloaded from Google Drive.
2. **Load Data**: The downloaded CSV files are loaded onto a PostegreSQL database from vscode. First, we create the database, followed by the table structure and then load the data into the database.   
3. **Queries**: Deep dive into understanding the database by asking key questions and query the database using SQL to generate insights.
4. **Push to Github**: Generate key output files and push the code onto Github 
5. **README.md**: Create Markdown file to describe the project and 

## Requirements
- SQL database management system (e.g., MySQL, PostgreSQL)
- SQL client or command-line interface


## Queries
The project includes several SQL queries designed to extract insights from the dataset. These queries cover various aspects such as:
- Job distribution by location
- Salary analysis
- Top job titles
- Company rankings
- Skill requirements analysis
- And more

## Analysis

In order to narrow the analysis, I focused on data engineer roles in Germany.

### 1. In-Demand Skills

To find the most demanded skills in the German market, I write an SQL query to get the count of skills by Data Engineer positions in Germany and sort by the skills count in descending order.

```sql
SELECT 
    skills_dim.skills,
    COUNT(job_postings_fact.job_id) AS skill_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE 
    job_postings_fact.job_title_short = 'Data Engineer' AND
    job_postings_fact.job_location = 'Germany'
GROUP BY skills_dim.skills 
ORDER BY skill_count DESC
LIMIT 5;
```
The results obtained can be clearly visualized in the image below. It is important to note here that, apart from programming languages like python and sql, expertise in cloud technologies is what the market demands in data engineering. In tune with market, the top two cloud providers in demand are Azure and AWS. It is interesting to find that, in contrast to global trends where AWS is preferred, Azure stacks up in Germany.

![In-Demand Data Engineer Skills](<assets/In-Demand_Skills _Data_Engineer.png>)
*Bar chart visualizing the most required data engineer skills in Germany*


The results obtained from the SQL queries provide valuable insights into the job market, including:
- Geographic distribution of job opportunities
- Salary trends across different industries and locations
- Most in-demand job titles and skills
- Top companies hiring in the market
- And other relevant findings

## Conclusion
Through this project, we have gained valuable insights into the job market landscape based on the analysis of the provided dataset. These insights can be utilized by job seekers, employers, recruiters, and policymakers to make informed decisions regarding job search, recruitment, and workforce planning.

## Contributing
Contributions to this project are welcome. If you have any suggestions, improvements, or additional analyses to propose, feel free to submit a pull request. 

