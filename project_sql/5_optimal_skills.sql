/*
Question: what are the most optimal skills to learn (aka it's in high demand and a high-paying skill)?
- Indentify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? targets skills that offer job security (high demand) and financial benefits (high salaries),
offering strategic insights for career development in data analysis
*/ 

WITH top_demanded_skills AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT (skills_job_dim.job_id) AS demand_count
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
        skills_dim.skill_id
),
top_paying_skills AS (
    SELECT
        skills_dim.skill_id,
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
        skills_dim.skill_id
)

SELECT
    top_demanded_skills.skill_id,
    top_demanded_skills.skills,
    top_demanded_skills.demand_count,
    top_paying_skills.avg_salary_skill
FROM
    top_demanded_skills
    INNER JOIN top_paying_skills ON
    top_demanded_skills.skill_id = top_paying_skills.skill_id
WHERE
    top_demanded_skills.demand_count > 10
ORDER BY
    top_paying_skills.avg_salary_skill DESC,
    top_demanded_skills.demand_count DESC
LIMIT 25;

-- Rewriting this same query more concisely

SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT (skills_job_dim.job_id) AS demand_count,
    ROUND (AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
    INNER JOIN skills_job_dim ON
    job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON
    skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_work_from_home = TRUE AND 
    salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT (skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;


/*
Key insights based on this queries:

High Demand but Moderate Pay: Skills like Python and Tableau are in high demand but offer moderate salaries (~$101k).

Specialized Skills Offer Higher Pay: Less common skills like Go, Confluence, 
and Hadoop command higher salaries (up to $115k), despite lower demand.

Cloud and Big Data: Technologies like Snowflake, Azure, and AWS are crucial, 
offering strong salaries ($99k-$113k) and are vital in modern data analysis.

[
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "27",
    "avg_salary": "115320"
  },
  {
    "skill_id": 234,
    "skills": "confluence",
    "demand_count": "11",
    "avg_salary": "114210"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "22",
    "avg_salary": "113193"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "37",
    "avg_salary": "112948"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "34",
    "avg_salary": "111225"
  },
  {
    "skill_id": 77,
    "skills": "bigquery",
    "demand_count": "13",
    "avg_salary": "109654"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "32",
    "avg_salary": "108317"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "17",
    "avg_salary": "106906"
  },
  {
    "skill_id": 194,
    "skills": "ssis",
    "demand_count": "12",
    "avg_salary": "106683"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demand_count": "20",
    "avg_salary": "104918"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "37",
    "avg_salary": "104534"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "49",
    "avg_salary": "103795"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demand_count": "13",
    "avg_salary": "101414"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "236",
    "avg_salary": "101397"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "148",
    "avg_salary": "100499"
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "demand_count": "16",
    "avg_salary": "99936"
  },
  {
    "skill_id": 187,
    "skills": "qlik",
    "demand_count": "13",
    "avg_salary": "99631"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "230",
    "avg_salary": "99288"
  },
  {
    "skill_id": 197,
    "skills": "ssrs",
    "demand_count": "14",
    "avg_salary": "99171"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "13",
    "avg_salary": "99077"
  },
  {
    "skill_id": 13,
    "skills": "c++",
    "demand_count": "11",
    "avg_salary": "98958"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "demand_count": "35",
    "avg_salary": "97786"
  },
  {
    "skill_id": 9,
    "skills": "javascript",
    "demand_count": "20",
    "avg_salary": "97587"
  }
]
*/
    
