/*
QUestion: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries and remote job
- Why? It reveals how different skills impact salary levels for Data Analysts
and helps indentify the most financially rewarding skills to acquire or improve
*/

SELECT
    skills_dim.skills,
    ROUND (AVG (job_postings_fact.salary_year_avg), 0) AS avg_salary_skill
FROM
    job_postings_fact
    INNER JOIN skills_job_dim ON
    job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON
    skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    salary_year_avg IS NOT NULL AND
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE
GROUP BY
    skills_dim.skills
ORDER BY
    avg_salary_skill DESC
LIMIT 25;
    
/* 
Here is a breakdown of the results for top paying skills for Data Analysts:
- Big Data and Cloud Computing: Skills like PySpark and Databricks are highly paid, 
reflecting the need for expertise in big data and cloud analytics.
- Automation and DevOps: High salaries for Bitbucket, GitLab, Jenkins, and Kubernetes 
indicate a strong demand for automated and efficient data workflows.
- Programming and Specialized Tools: Proficiency in Python, Pandas, Numpy, 
and specialized tools like Couchbase and DataRobot command high salaries, 
highlighting the value of diverse technical skills.

[
  {
    "skills": "pyspark",
    "avg_salary_skill": "208172"
  },
  {
    "skills": "bitbucket",
    "avg_salary_skill": "189155"
  },
  {
    "skills": "couchbase",
    "avg_salary_skill": "160515"
  },
  {
    "skills": "watson",
    "avg_salary_skill": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary_skill": "155486"
  },
  {
    "skills": "gitlab",
    "avg_salary_skill": "154500"
  },
  {
    "skills": "swift",
    "avg_salary_skill": "153750"
  },
  {
    "skills": "jupyter",
    "avg_salary_skill": "152777"
  },
  {
    "skills": "pandas",
    "avg_salary_skill": "151821"
  },
  {
    "skills": "elasticsearch",
    "avg_salary_skill": "145000"
  },
  {
    "skills": "golang",
    "avg_salary_skill": "145000"
  },
  {
    "skills": "numpy",
    "avg_salary_skill": "143513"
  },
  {
    "skills": "databricks",
    "avg_salary_skill": "141907"
  },
  {
    "skills": "linux",
    "avg_salary_skill": "136508"
  },
  {
    "skills": "kubernetes",
    "avg_salary_skill": "132500"
  },
  {
    "skills": "atlassian",
    "avg_salary_skill": "131162"
  },
  {
    "skills": "twilio",
    "avg_salary_skill": "127000"
  },
  {
    "skills": "airflow",
    "avg_salary_skill": "126103"
  },
  {
    "skills": "scikit-learn",
    "avg_salary_skill": "125781"
  },
  {
    "skills": "jenkins",
    "avg_salary_skill": "125436"
  },
  {
    "skills": "notion",
    "avg_salary_skill": "125000"
  },
  {
    "skills": "scala",
    "avg_salary_skill": "124903"
  },
  {
    "skills": "postgresql",
    "avg_salary_skill": "123879"
  },
  {
    "skills": "gcp",
    "avg_salary_skill": "122500"
  },
  {
    "skills": "microstrategy",
    "avg_salary_skill": "121619"
  }
]
*/