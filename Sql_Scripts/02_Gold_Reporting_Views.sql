/*
===============================================================================
DDL Script: Create Gold Views
===============================================================================
Script Purpose:
    This script creates views for the Gold layer in the HP Perofrmance Analytics. 
    The Gold layer represents the final dimension and fact tables (Star Schema)

    Each view performs transformations and combines data from the Silver layer 
    to produce a clean, enriched, and business-ready dataset.

Usage:
    - These views can be queried directly for analytics and reporting.
===============================================================================
*/

-- =============================================================================
-- 1. Fact Table: v_FactHRPerformance 
-- =============================================================================

IF OBJECT_ID('v_FactHRPerformance', 'V') IS NOT NULL DROP VIEW v_FactHRPerformance ;
GO

CREATE OR ALTER VIEW v_FactHRPerformance AS
SELECT 
    EmployeeNumber AS [Employee Number],
    Attrition AS [Attrition Flag],
    CASE 
        WHEN Attrition = 1 THEN 'Left'
        ELSE 'Stayed'
    END AS [Attrition Status],
    MonthlyIncome AS [Monthly Income],
    PercentSalaryHike AS [Salary Hike %],
    YearsAtCompany AS [Tenure Years],
    NumCompaniesWorked AS [Companies Worked],
    TotalWorkingYears AS [Total Experience],
    TrainingTimesLastYear AS [Training Times Last Year],
    YearsInCurrentRole AS [Years In Current Role],
    YearsSinceLastPromotion AS [Years Since Last Promotion],
    YearsWithCurrManager AS [Years With Current Manager],
    (TotalWorkingYears - YearsAtCompany) AS [Prior Experience],
    EmployeeCount AS [Employee Count]
FROM silver.hr_attrition;
GO

-- =============================================================================
-- 2. Dimension Table: v_DimEmployeeDetails 
-- =============================================================================

IF OBJECT_ID('v_DimEmployeeDetails', 'V') IS NOT NULL DROP VIEW v_DimEmployeeDetails;
GO

CREATE OR ALTER VIEW v_DimEmployeeDetails AS
SELECT 
    EmployeeNumber AS [Employee Number],
    Age,
    CASE 
        WHEN Age < 25 THEN '18-24'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+' 
    END AS [Age Group],
    CASE 
        WHEN Age < 25 THEN 1
        WHEN Age BETWEEN 25 AND 34 THEN 2
        WHEN Age BETWEEN 35 AND 44 THEN 3
        WHEN Age BETWEEN 45 AND 54 THEN 4
        ELSE 5
    END AS [Age Group Sort],
    Gender,
    MaritalStatus AS [Marital Status],
    EducationField AS [Education Field],
    CASE 
        WHEN Education = 1 THEN 'Below College'
        WHEN Education = 2 THEN 'College'
        WHEN Education = 3 THEN 'Bachelor'
        WHEN Education = 4 THEN 'Master'
        WHEN Education = 5 THEN 'Doctor'
    END AS [Education Level],
    DistanceFromHome AS [Distance From Home],
    CASE 
        WHEN DistanceFromHome <= 10 THEN 'Near (<10km)'
        ELSE 'Far (>10km)'
    END AS [Commute Type],
    CASE 
        WHEN DistanceFromHome <= 10 THEN 1 
        ELSE 2 
    END AS [Commute Type Sort],
    CASE 
        WHEN MonthlyIncome < 3000 THEN 'Entry (<$3k)'
        WHEN MonthlyIncome <= 5000 THEN 'Junior ($3k-$5k)'
        WHEN MonthlyIncome <= 10000 THEN 'Mid-Level ($5k-$10k)'
        WHEN MonthlyIncome <= 15000 THEN 'Senior ($10k-$15k)'
        ELSE 'Executive (>$15k)'
    END AS [Income Band],
    CASE 
        WHEN MonthlyIncome < 3000 THEN 1
        WHEN MonthlyIncome <= 5000 THEN 2
        WHEN MonthlyIncome <= 10000 THEN 3
        WHEN MonthlyIncome <= 15000 THEN 4
        ELSE 5
    END AS [Income Band Sort],

    -- Performance Rating Attributes
    PerformanceRating AS [Performance Score],
    CASE 
        WHEN PerformanceRating = 1 THEN 'Low'
        WHEN PerformanceRating = 2 THEN 'Good'
        WHEN PerformanceRating = 3 THEN 'Excellent' 
        WHEN PerformanceRating = 4 THEN 'Outstanding'
        ELSE 'N/A'
    END AS [Performance Status],

    -- Tenure Slicing Attributes
    CASE
        WHEN YearsAtCompany < 1 THEN 'New Hire (<1yr)'
        WHEN YearsAtCompany <= 3 THEN 'Junior (1-3yrs)'
        WHEN YearsAtCompany <= 5 THEN 'Mid (3-5yrs)'
        WHEN YearsAtCompany <= 10 THEN 'Senior (5-10yrs)'
        ELSE 'Veteran (10+ Years)'
    END AS [Tenure Band],
    CASE
        WHEN YearsAtCompany < 1 THEN 1
        WHEN YearsAtCompany <= 3 THEN 2
        WHEN YearsAtCompany <= 5 THEN 3
        WHEN YearsAtCompany <= 10 THEN 4
        ELSE 5
    END AS [Tenure Band Sort],
    Department,
    JobRole AS [Job Role],
    JobLevel AS [Job Level],
    BusinessTravel AS [Business Travel],
    Overtime,
    CASE 
        WHEN OverTime = 1 THEN 'Yes' 
        ELSE 'No' 
    END AS [Overtime Status],
    JobSatisfaction AS [Job Satisfaction],
    CASE 
        WHEN JobSatisfaction = 1 THEN 'Low'
        WHEN JobSatisfaction = 2 THEN 'Medium'
        WHEN JobSatisfaction = 3 THEN 'High'
        WHEN JobSatisfaction = 4 THEN 'Very High'
    END AS [Job Satisfaction Status],
    
    EnvironmentSatisfaction AS [Environment Satisfaction],
    CASE 
        WHEN EnvironmentSatisfaction = 1 THEN 'Low'
        WHEN EnvironmentSatisfaction = 2 THEN 'Medium'
        WHEN EnvironmentSatisfaction = 3 THEN 'High'
        WHEN EnvironmentSatisfaction = 4 THEN 'Very High'
    END AS [Environment Satisfaction Status],
    
    WorkLifeBalance AS [Work Life Balance],
    CASE 
        WHEN WorkLifeBalance = 1 THEN 'Poor'
        WHEN WorkLifeBalance = 2 THEN 'Good'
        WHEN WorkLifeBalance = 3 THEN 'Better'
        WHEN WorkLifeBalance = 4 THEN 'Best'
    END AS [Work Life Balance Status],
    
    JobInvolvement AS [Job Involvement Score],
    CASE 
        WHEN JobInvolvement = 1 THEN 'Low'
        WHEN JobInvolvement = 2 THEN 'Medium'
        WHEN JobInvolvement = 3 THEN 'High'
        WHEN JobInvolvement = 4 THEN 'Very High'
    END AS [Job Involvement Status],
    RelationshipSatisfaction AS [Relationship Satisfaction],
    StockOptionLevel AS [Stock Option Level],
    CASE 
        WHEN StockOptionLevel = 0 THEN 'None'
        WHEN StockOptionLevel = 1 THEN 'Basic'
        WHEN StockOptionLevel = 2 THEN 'Standard'
        WHEN StockOptionLevel = 3 THEN 'Executive'
        ELSE 'N/A'
    END AS [Stock Option Tier]
FROM silver.hr_attrition;
GO
