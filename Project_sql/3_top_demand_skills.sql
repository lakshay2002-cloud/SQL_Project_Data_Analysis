/* Question: What are the most in-demand skills for data analysts?
- join job postings to inner join table similar to query 2 
- focus on all job postings 
- why? Retreives the top 5 skilld with the highest demand in the job market,
providing insights into the most valuable skills for job seekers. 
*/

select skills ,
       count(job_postings_fact.job_id) as demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where job_title_short = 'Data Analyst' 
group by
        Skills
order by demand_count DESC 
limit 5 