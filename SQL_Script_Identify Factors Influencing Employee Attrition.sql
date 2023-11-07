-- Checking for any data discrepancies in Gender Column and Position Column
SELECT Gender 
from hr_data 
group by Gender;

SELECT Position 
from hr_data 
group by Position;

-- Checking for data type of the columns
describe hr_data;

-- For the purpose of more detailed analysis, the Age and Salary columns were categorized into different groups.
CREATE TABLE hr_database AS 
SELECT
	EmployeeID,
	Age,
	CASE
		WHEN Age <= 30 THEN '<= 30 years'
		ELSE '> 30 years'
	END AS AgeGroup,
	REPLACE(REPLACE(GENDER, 'Female', 'F'), 'Male', 'M') AS Gender,
	Department,
	REPLACE(REPLACE(Position, 'DataScientist', 'Data Scientist'), 'Marketinganalyst', 'Marketing Analyst') AS Position,
	YearsOfService,
	Salary,
	CASE 
		WHEN Salary >= 90000 THEN '90K - 100K'
		WHEN Salary >= 80000 THEN '80K - 90K'
		WHEN Salary >= 70000 THEN '70K - 80K'
		WHEN Salary >= 60000 THEN '60K - 70K'
		ELSE '50K - 60K'
	END AS SalaryBucket,
	PerformanceRating,
	WorkHours,
	Attrition,
	Promotion,
	TrainingHours,
	SatisfactionScore,
	LastPromotionDate
FROM hrdata;

-- datatype of the column Last_Promotion_Date was changed from text to varchar(50)
ALTER TABLE hr_database
MODIFY COLUMN Last_Promotion_Date VARCHAR(50);

-- data inside the column was converted 
UPDATE hr_database
SET Last_Promotion_Date = 
  CASE 
    WHEN LENGTH(Last_Promotion_Date) = 10 AND Last_Promotion_Date LIKE '__-__-____' THEN STR_TO_DATE(Last_Promotion_Date, '%d-%m-%Y')
    WHEN LENGTH(Last_Promotion_Date) = 10 AND Last_Promotion_Date LIKE '____-__-__' THEN STR_TO_DATE(Last_Promotion_Date, '%Y-%m-%d')
    ELSE NULL
  END;

-- datatype of the column Last_Promotion_Date was changed from  varchar(50) to date
ALTER TABLE hr_database
MODIFY COLUMN Last_Promotion_Date DATE;

-- Avg of all the employees
SELECT
COUNT(*) AS TotalEmp,
    ROUND(AVG(Age),0) AS AvgAge,	
    ROUND(AVG(Years_of_Service),0) AS Years_of_Service,	
    ROUND(AVG(Salary),0) AS AvgSalary,	-- 67736 
    ROUND(AVG(Performance_Rating),0) As AvgPerformance_Rating,	
    ROUND(AVG(Work_Hours),0) AS AvgWorkHours,	
    ROUND(AVG(Training_Hours),0) AS AvgTrainingHours,	
    ROUND(AVG(Satisfaction_Score),0) AS AvgSatisfactionScore
FROM hr_database;

-- Checking for Age criteria playing any role
SELECT AgeGroup, Attrition, count(*) 
from hr_database 
where Attrition='YES'  
group by AgeGroup, Attrition;

-- Checking for Gender criteria playing any role
SELECT Gender, Attrition, count(*) 
from hr_database 
where Attrition='YES'  
group by Gender, Attrition;

-- Checking for Department criteria playing any role
SELECT Department, Attrition,
    ROUND((count(*)*100/54),2) As Percent_of_Attrition 
from hr_database 
where Attrition='YES'  
group by Department, Attrition;

-- Checking for Position criteria playing any role
SELECT 
	Position, 
    Attrition, 
    ROUND((count(*)*100/54),2) As Percent_of_Attrition 
from  hr_database 
where Attrition='YES' 
group by  Position, Attrition;

-- comparing all the data of the employees with the average data with attrition 'Yes' & 'No'
SELECT
	Position,
	COUNT(*) AS TotalEmp,
    ROUND(AVG(Age),0) AS AvgAge,
    ROUND(AVG(Years_of_Service),0) AS Years_of_Service,
    ROUND(AVG(Salary),0) AS AvgSalary,
    ROUND(AVG(Satisfaction_Score),0) AS AvgSatisfactionScore,
    ROUND(AVG(Work_Hours),0) AS AvgWorkHours,
    ROUND(AVG(Training_Hours),0) AS AvgTrainingHours,
    SUM(CASE WHEN Promotion = 'Yes' THEN 1 ELSE 0 END) AS Promotion_Yes,
    ROUND(AVG(Performance_Rating),0) As AvgPerformance_Rating
FROM hr_database
WHERE Attrition='Yes'
GROUP BY Position;

SELECT
	Position,
	COUNT(*) AS TotalEmp,
    ROUND(AVG(Age),0) AS AvgAge,
    ROUND(AVG(Years_of_Service),0) AS Years_of_Service,
    ROUND(AVG(Salary),0) AS AvgSalary,
    ROUND(AVG(Satisfaction_Score),0) AS AvgSatisfactionScore,
    ROUND(AVG(Work_Hours),0) AS AvgWorkHours,
    ROUND(AVG(Training_Hours),0) AS AvgTrainingHours,
    SUM(CASE WHEN Promotion = 'Yes' THEN 1 ELSE 0 END) AS Promotion_Yes,
    ROUND(AVG(Performance_Rating),0) As AvgPerformance_Rating
FROM hr_database
WHERE Attrition='No'
GROUP BY Position;