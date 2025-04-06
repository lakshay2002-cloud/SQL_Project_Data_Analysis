/* What are the top skills based on salary?
- Look at thje average salary associated with each skill for data Analyst position 
- Focuses on roles with specified salaries , regardless of location 
- why? It reveals how different skills impact salary levels for data analyst and 
helps identify the most financially rewarding skills to acquire or improve  
*/

select skills, round(AVG(salary_year_avg),0) as Avg_salary
from job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where salary_year_avg IS NOT NULL  AND job_title_short = 'Data Analyst'
GROUP BY skills
order by Avg_salary DESC
limit 25 