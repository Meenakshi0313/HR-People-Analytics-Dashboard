/*
===============================================================================
DDL Script: Create Silver Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'silver' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/

IF OBJECT_ID('silver.hr_attrition', 'U') IS NOT NULL
    DROP TABLE silver.hr_attrition;
GO

CREATE TABLE silver.hr_attrition (
    
    EmployeeNumber           INT PRIMARY KEY,  
    Age                      INT,
    Gender                   NVARCHAR(50),
    MaritalStatus            NVARCHAR(50),
    Education                INT,
    EducationField           NVARCHAR(100),
    DistanceFromHome         INT,
    Department               NVARCHAR(100),
    JobRole                  NVARCHAR(100),
    JobLevel                 INT,
    BusinessTravel           NVARCHAR(50),
    StandardHours            INT,
    OverTime                 INT, 
    Attrition                INT,             
    DailyRate                INT,
    HourlyRate               INT,
    MonthlyIncome            INT,
    MonthlyRate              INT,
    PercentSalaryHike        INT,
    PerformanceRating        INT,
    StockOptionLevel         INT,
    EnvironmentSatisfaction  INT,
    JobInvolvement           INT,
    JobSatisfaction          INT,
    RelationshipSatisfaction INT,
    WorkLifeBalance          INT,
    NumCompaniesWorked       INT,
    TotalWorkingYears        INT,
    TrainingTimesLastYear    INT,
    YearsAtCompany           INT,
    YearsInCurrentRole       INT,
    YearsSinceLastPromotion  INT,
    YearsWithCurrManager     INT,
    
    EmployeeCount            INT,
    Over18                   NVARCHAR(10)
);
GO
