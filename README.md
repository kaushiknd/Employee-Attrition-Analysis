# Employee-Attrition-Analysis
## Identifying Factors Influencing Employee Attrition rate

## Objective: 
Determine the factors that contribute to employee attrition within the company and provide insights to reduce attrition rates

## Introduction:
In today's dynamic business landscape, addressing employee attrition is a top priority for organizations. This analysis delves into the reasons behind employee departures ("Attrition-Yes") and retentions ("Attrition-No"), exploring factors like years of service, performance, compensation, and work hours. We provide actionable recommendations to help reduce attrition and improve workplace satisfaction and productivity. 

## Data Cleaning and Processing:
1.	The available data with table name hr_data contains discrepancies which has to be taken care.
2.	Gender & Position column has incompatible data:

![image](https://github.com/kaushiknd/Employee-Attrition-Analysis/assets/115521614/a4ec656c-1da7-4390-8c8d-4f1775983477)
![image](https://github.com/kaushiknd/Employee-Attrition-Analysis/assets/115521614/739173eb-1b1d-46ec-b684-90397a430e52)

Here we can observe Data Scientist & Marketing Analyst data has Duplicates.

3.	Also the column Last_Promotion_Date is in varchar Datatype. 

![image](https://github.com/kaushiknd/Employee-Attrition-Analysis/assets/115521614/55ac0bef-a6ae-4068-a5fe-9969b9c441f4)

4.	All these columns has to be changed. Hence, data cleaning process was carried out using below queries,
5.	
 I.	Gender column was Replaced ‘Male’ to ‘M’ and ‘Female’ to ‘F’.

 II.	Position column was replaced ‘DataScientist’ to ‘Data Scientist’ and ‘Marketinganalyst’ to ‘Marketing Analyst’.
 
 III.	Age Group Column was created by filtering Age <= 30 and Age>30.
 
 IV.	SalaryBucket column was created by filtering the salary column.
 
 V.	LastPromotionDate Column was unable to modify hence followed different approach.
 
    a.	First datatype of the column was changed from text to varchar(50)
    b.	Then the data inside the column was converted as below.
    c.	Then the data type of the column was changed from varchar to date.

Now the data is cleaned and feasible for analysing the data.

## Data Analysis: 
1.	First the average of all the employees was calculated.

 ![image](https://github.com/kaushiknd/Employee-Attrition-Analysis/assets/115521614/35a35aa0-2243-4054-9007-0588cfe351f0)

The above values show the average values of all the employees.  Now we’ll compare the results Vis-à-Vis this.

2.	Let’s Check whether age criteria plays any role here

 ![image](https://github.com/kaushiknd/Employee-Attrition-Analysis/assets/115521614/e309b3d6-9ce0-4b13-93f9-1951fd911ee1)

Here we can observe that by looking into the data, Age factor is not playing much role for the attrition of employees.

3.	Let’s Check whether Gender criteria plays any role here

 ![image](https://github.com/kaushiknd/Employee-Attrition-Analysis/assets/115521614/3647a475-89f5-4807-b0df-6a2ba04f207a)

Here we can observe that by looking into the data, Gender factor is not playing much role for the attrition of employees.

4.	Department wise criteria was checked next

 ![image](https://github.com/kaushiknd/Employee-Attrition-Analysis/assets/115521614/72e3f841-015c-49fc-9c1a-70d430fce82e)

Here we can observe that Departments like IT, Finance & Marketing has high rate of attrition.

5.	Position wise criteria was checked next

 ![image](https://github.com/kaushiknd/Employee-Attrition-Analysis/assets/115521614/9361a609-6e72-4e49-b66c-e7baa5a25259)

Here we can observe that there is high rate of attrition from Data Scientist, Financial Analyst & Software Engineer positions.

6.	Now will compare all the data of the employees with the average data

![image](https://github.com/kaushiknd/Employee-Attrition-Analysis/assets/115521614/e8e8a30b-c989-428e-b00b-626ad61a25cb)

![image](https://github.com/kaushiknd/Employee-Attrition-Analysis/assets/115521614/1044368a-290a-47c6-81a3-87f6efce9c19)


### Analysing above data following inference were drawn:
1. For Data scientist, Sales Associate, Sales Manager & Software Engineer even though their Average year of service and Average performance rating was more, they were paid less than the average.
2. Overall organisation has to improvise the training hours for majority of the employees.
3. Average working hours is more for Financial Analyst, Organisation has to reduce burden of work and has to provide some leisure for the employees.
4. Employees with less YOS were subjected to high roles and responsibilities based on their experience. 
5. Concentrating young minds for apt roles adds up to the asset of the organisation. Especially in HR Coordinator roles

## Recommendations: 
1.	Review the compensation structure for job positions like Data Scientist, Sales Associate, Sales Manager, and Software Engineer. Consider adjusting salaries to align better with the employees' years of service and performance ratings. This can improve employee satisfaction and reduce attrition.
2.	Invest in enhancing the training programs across the organization. Focus on providing employees with the skills and knowledge they need to excel in their roles. Regular training and development opportunities can boost performance and job satisfaction.
3.	Address the heavy workload for Financial Analysts by exploring ways to balance their tasks and promote work-life balance. Reducing excessive working hours and providing support for managing workload can improve employee well-being and productivity.
4.	Ensure that roles and responsibilities are aligned with employees' experience levels. Employees with less experience should receive adequate training and mentorship to perform effectively in their roles, while experienced employees should be appropriately recognized and rewarded.
5.	Continue to focus on recruiting and nurturing young talent, especially in roles like HR Coordinator. These employees can bring fresh ideas and enthusiasm to the organization. Implement mentorship and career development programs to help them grow and excel in their roles.
6.	Establish a system for collecting regular feedback from employees to understand their concerns, needs, and suggestions. This can provide valuable insights for making ongoing improvements.
7.	Consider introducing performance-linked bonuses or incentives to motivate employees to perform at their best. This can boost overall productivity and job satisfaction.
8.	Ensure that the organization promotes diversity and inclusion. A diverse workforce can bring different perspectives and ideas, which can lead to innovation and better problem-solving.
9.	Implement health and well-being programs to support employees in managing their physical and mental health. A healthy and happy workforce is more likely to be productive and stay with the organization.
10.	Develop a clear succession plan to ensure that experienced employees can take on leadership roles as they become available. This can provide a path for career growth and retention.
11.	Conduct exit interviews to understand why employees are leaving the organization. Use this feedback to continuously improve the work environment and address any issues that may be contributing to attrition.

These recommendations can help the organization address the factors influencing attrition and create a more positive and productive work environment. Implementing these suggestions can lead to higher employee satisfaction and retention.

