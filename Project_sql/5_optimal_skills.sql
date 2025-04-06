/* what are the most optimal skills to learn (aka its in high demand and a high-paying skills)?
- identify skills in high demand and associated with high average salaries for data Analyst roles
- Concentrates on remote positions with specified salries 
- why? targets skills that offer jobs security (high demands) and financial bnenefiots (highg salries),
 offering strategic insights for career development in data analysis
*/


with skills_demand As (
    select skills_dim.skill_id,skills ,
        count(job_postings_fact.job_id) as demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    where job_title_short = 'Data Analyst' AND job_work_from_home = TRUE AND salary_year_avg IS NOT NULL
    group by
            skills_dim.skill_id
), average_salry As (
    select skills_dim.skill_id,skills, round(AVG(salary_year_avg),0) as Avg_salary
    from job_postings_fact
    inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    where salary_year_avg IS NOT NULL  AND job_title_short = 'Data Analyst' AND job_work_from_home = TRUE
    GROUP BY skills_dim.skill_id
)

select 
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    Avg_salary
from
    skills_demand
INNER JOIN average_salry on skills_demand.skill_id = average_salry.skill_id
where demand_count >10
order by 
    Avg_salary DESC,
    demand_count DESC
limit 25 