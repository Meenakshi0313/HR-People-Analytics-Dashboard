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
CREATE VIEW v_FactHRPerformance AS
SELECT 
    EmployeeNumber AS [Employee Number],
    Attrition AS [Attrition Flag],
    MonthlyIncome AS [Monthly Income],
    PercentSalaryHike AS [Salary Hike %],
    PerformanceRating AS [Performance Score],
    YearsAtCompany AS [Tenure Years],
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
CREATE VIEW v_DimEmployeeDetails AS
SELECT 
    EmployeeNumber AS [Employee Number],
    Age,
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
    DistanceFromHome AS [Distance From Home]
FROM silver.hr_attrition;
GO

-- =============================================================================
-- 3. Dimension: v_DimJobDetails 
-- =============================================================================

IF OBJECT_ID('v_DimJobDetails', 'V') IS NOT NULL DROP VIEW v_DimJobDetails;
GO
CREATE VIEW v_DimJobDetails AS
SELECT 
    EmployeeNumber AS [Employee Number],
    Department,
    JobRole AS [Job Role],
    JobLevel AS [Job Level],
    BusinessTravel AS [Business Travel],
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
CREATE VIEW v_DimSatisfaction AS
SELECT 
    EmployeeNumber AS [Employee Number],
    CASE 
        WHEN JobSatisfaction = 1 THEN 'Low'
        WHEN JobSatisfaction = 2 THEN 'Medium'
        WHEN JobSatisfaction = 3 THEN 'High'
        WHEN JobSatisfaction = 4 THEN 'Very High'
    END AS [Job Satisfaction],
    CASE 
        WHEN EnvironmentSatisfaction = 1 THEN 'Low'
        WHEN EnvironmentSatisfaction = 2 THEN 'Medium'
        WHEN EnvironmentSatisfaction = 3 THEN 'High'
        WHEN EnvironmentSatisfaction = 4 THEN 'Very High'
    END AS [Environment Satisfaction],
    CASE 
        WHEN RelationshipSatisfaction = 1 THEN 'Low'
        WHEN RelationshipSatisfaction = 2 THEN 'Medium'
        WHEN RelationshipSatisfaction = 3 THEN 'High'
        WHEN RelationshipSatisfaction = 4 THEN 'Very High'
    END AS [Relationship Satisfaction],
    CASE 
        WHEN WorkLifeBalance = 1 THEN 'Poor'
        WHEN WorkLifeBalance = 2 THEN 'Good'
        WHEN WorkLifeBalance = 3 THEN 'Better'
        WHEN WorkLifeBalance = 4 THEN 'Best'
    END AS [Work Life Balance],
    JobInvolvement AS [Job Involvement Score],
    StockOptionLevel AS [Stock Option Level]
FROM silver.hr_attrition;
GO
