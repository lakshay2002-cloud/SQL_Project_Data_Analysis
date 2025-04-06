"Question 1 what are the top-paying data analyst jobs?
 - Identifying the top 10 highest-paying Data Analyst roles that are available remotely
 - Focuses on job postings with specified salaries (remove nulls)
 - why ? Highlights the top_paying opportunities for data anallysis,offering insights into "

 select 
       job_id, 
       job_title,
       job_location,
       job_schedule_type,
       salary_year_avg,
       job_posted_date,
       name AS company_name
From 
       job_postings_fact
LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
where
       job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL AND job_location = 'Anywhere'
order by salary_year_avg DESC
LIMIT 10;      