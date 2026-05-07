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
        WHEN Attrition = 1 THEN 'Yes'
        ELSE 'No'
    END AS [Attrition Status],
    MonthlyIncome AS [Monthly Income],
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
    PercentSalaryHike AS [Salary Hike %],
    PerformanceRating AS [Performance Score],
    YearsAtCompany AS [Tenure Years],
    CASE
        WHEN YearsAtCompany < 1 THEN '0-1 Years (New Hire)'
        WHEN YearsAtCompany <= 3 THEN '1-3 Years'
        WHEN YearsAtCompany <= 5 THEN '3-5 Years'
        WHEN YearsAtCompany <= 10 THEN '5-10 Years'
        ELSE '10+ Years (Veteran)'
    END AS [Tenure Band],
    CASE
        WHEN YearsAtCompany < 1 THEN 1
        WHEN YearsAtCompany <= 3 THEN 2
        WHEN YearsAtCompany <= 5 THEN 3
        WHEN YearsAtCompany <= 10 THEN 4
        ELSE 5
END AS [Tenure Band Sort],
    YearsSinceLastPromotion AS [Years Since Promotion],
    NumCompaniesWorked AS [Companies Worked],
    TotalWorkingYears AS [Total Experience]
FROM silver.hr_attrition;
GO

-- =============================================================================
-- 2. Dimension: v_DimEmployeeDetails
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
    WHEN DistanceFromHome <=10 then 'Near (<10km)'
    ELSE 'Far (>10km)'
    END [Commute Type],
    CASE 
        WHEN DistanceFromHome <= 10 THEN 1 
        ELSE 2 
    END AS [Commute Type Sort]
FROM silver.hr_attrition;
GO

-- =============================================================================
-- 3. Dimension: v_DimJobDetails 
-- =============================================================================

IF OBJECT_ID('v_DimJobDetails', 'V') IS NOT NULL DROP VIEW v_DimJobDetails;
GO
CREATE OR ALTER VIEW v_DimJobDetails AS
SELECT 
    EmployeeNumber AS [Employee Number],
    Department,
    JobRole AS [Job Role],
    JobLevel AS [Job Level],
    BusinessTravel AS [Business Travel],
    Overtime,
    CASE 
        WHEN OverTime = 1 THEN 'Yes' 
        ELSE 'No' 
    END AS [Overtime Status],
    StandardHours AS [Standard Hours]
FROM silver.hr_attrition;
GO

-- =============================================================================
-- 4. Dimension: v_DimSatisfaction 
-- =============================================================================

IF OBJECT_ID('v_DimSatisfaction', 'V') IS NOT NULL DROP VIEW v_DimSatisfaction;
GO
CREATE OR ALTER VIEW v_DimSatisfaction AS
SELECT 
    EmployeeNumber AS [Employee Number],
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
    RelationshipSatisfaction AS [Relationship Satisfaction],
    CASE 
        WHEN RelationshipSatisfaction = 1 THEN 'Low'
        WHEN RelationshipSatisfaction = 2 THEN 'Medium'
        WHEN RelationshipSatisfaction = 3 THEN 'High'
        WHEN RelationshipSatisfaction = 4 THEN 'Very High'
    END AS [Relationship Satisfaction Status],
    WorkLifeBalance AS [Work Life Balance],
    CASE 
        WHEN WorkLifeBalance = 1 THEN 'Poor'
        WHEN WorkLifeBalance = 2 THEN 'Good'
        WHEN WorkLifeBalance = 3 THEN 'Better'
        WHEN WorkLifeBalance = 4 THEN 'Best'
    END AS [Work Life Balance Status],
    JobInvolvement AS [Job Involvement Score],
    StockOptionLevel AS [Stock Option Level]
FROM silver.hr_attrition;
GO
