USE HR_Project;
SELECT *
FROM hr;

ALTER TABLE [dbo].[hr]
ADD age INT;

UPDATE hr
SET age = DATEDIFF(YEAR,birthdate,GETDATE());

SELECT birthdate,age FROM hr;
SELECT MIN(age) as Youngest,
		MAX(age) as oldest
FROM hr;

-- What is the gender breakdown of employees in the company?
SELECT gender,count(*) AS gender_count
FROM hr
GROUP BY gender;

-- What is the race/ethnicity breakdown of employees in the company?
SELECT race,COUNT(*) AS race_count
FROM hr
GROUP BY race
ORDER BY race_count DESC;

-- What is the age distribution of employees in the company?
SELECT
MIN(age) as Youngest,
MAX(age) as Oldest
FROM hr;

SELECT
	CASE 
		WHEN age >= 18 AND age <= 24 THEN '18-24'
		WHEN age >= 25 AND age <= 34 THEN '25-34'
		WHEN age >= 35 AND age <= 44 THEN '35-44'
		WHEN age >= 45 AND age <= 54 THEN '45-54'
		WHEN age >= 55 AND age <= 64 THEN '55-64'
		ELSE '65+'
	END AS age_group,
	gender,COUNT(*) AS age_group_count
FROM hr
GROUP BY CASE 
		WHEN age >= 18 AND age <= 24 THEN '18-24'
		WHEN age >= 25 AND age <= 34 THEN '25-34'
		WHEN age >= 35 AND age <= 44 THEN '35-44'
		WHEN age >= 45 AND age <= 54 THEN '45-54'
		WHEN age >= 55 AND age <= 64 THEN '55-64'
		ELSE '65+'
		END ,gender
ORDER BY age_group;

---How many employees work at the headquarters versus remote locations?
SELECT location,count(*) as count 
FROM hr
GROUP BY location;

--- How does the gender distribution vary across departments and job titles?
SELECT department,gender,COUNT(*) AS count
FROM hr
GROUP BY department,gender
ORDER BY department;

--- What is the distribution of job titles across the company?
SELECT jobtitle,COUNT(*) AS count
FROM hr
GROUP BY jobtitle
ORDER BY jobtitle DESC

--- What is the distribution of employees across locations by state?
SELECT location_state,COUNT(*) AS count
FROM hr
GROUP BY location_state
ORDER BY count DESC;











