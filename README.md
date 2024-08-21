# Introduction
Uncover the landscape of lucrative careers in data analytics. This project investigates high-earning positions, key skills in demand, and the convergence of strong market needs with top-tier salaries in the field.

SQL queries? Check them out here: [project_sql folder](/project_sql/) 

# Background

Fueled by the ambition to better understand the data analyst job market, this project emerged from a passion for identifying top-paying roles and key skills in demand, making it easier not only for me but for others to discover the best career opportunities.

Data is sourced from [SQL COURSE](https://lukebarousse.com/sql). It offers valuable insights into job titles, salaries, locations, and critical skills.

### The questions I wanted to answer through my SQL queries were:

1. What are the top-paying data analyst jobs available remotely?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn (in high demand and high-paying)?

# Tools I Used

For an in-depth exploration of the data analyst job market, I leveraged several essential tools:

- **SQL:** The core of my analysis, enabling me to query the database and extract vital insights.

- **PostgreSQL:** the chosen database management system for this project, perfect for managing and analyzing job posting data.

- **Visual Studio Code**: the editor for writing and executing SQL queries, as well as managing the database.

- **Git & GitHub**: used for version control and sharing my SQL scripts and findings, ensuring collaboration and tracking throughout the project.

# The Analysis

Each query for this project aimed at investigating specific aspects of the data analyst job market. Here’s how I approached each question:

### 1. Top paying Data Analyst Jobs available remotely

To pinpoint the top-paying positions, I filtered data analyst roles based on average annual salary and location, with an emphasis on remote opportunities. This query uncovers the most lucrative jobs in the industry.

```sql
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    company_dim.name AS company_name
FROM
    job_postings_fact
    LEFT JOIN company_dim ON 
    job_postings_fact.company_id = company_dim.company_id
WHERE
    salary_year_avg IS NOT NULL AND 
    job_title_short = 'Data Analyst' AND 
    job_work_from_home= TRUE
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```
Here's a concise summary of the top-paying data analyst jobs available remotely:

- **Top Salary:** $650,000 for a "Data Analyst" at Mantys.

- **Senior Roles:** High salaries for "Director of Analytics" at Meta ($336,500)  and "Associate Director- Data Insights" at AT&T ($255,829.5).

- **Specialized Roles:** High pay for "Data Analyst, Marketing" at Pinterest ($232,423).

- **Remote/Hybrid:** All positions offer remote or hybrid options.

- **Salary Range:** $184,000 to $650,000.

- **Key Companies:** Includes major firms like Meta, AT&T, and Pinterest.





- What I Learned
- Conclusions

