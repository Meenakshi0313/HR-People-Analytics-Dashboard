/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/

IF OBJECT_ID('bronze.hr_attrition', 'U') IS NOT NULL
    DROP TABLE bronze.hr_attrition;
GO

CREATE TABLE bronze.hr_attrition (
    Age                      INT,
    Attrition                NVARCHAR(50), 
    BusinessTravel           NVARCHAR(50),
    DailyRate                INT,
    Department               NVARCHAR(100), 
    DistanceFromHome         INT,
    Education                INT,           
    EducationField           NVARCHAR(100), 
    EmployeeCount            INT,
    EmployeeNumber           INT,          
    EnvironmentSatisfaction  INT,            
    Gender                   NVARCHAR(50),
    HourlyRate               INT, 
    JobInvolvement           INT, 
    JobLevel                 INT, 
    JobRole                  NVARCHAR(100),
    JobSatisfaction          INT, 
    MaritalStatus            NVARCHAR(50),
    MonthlyIncome            INT, 
    MonthlyRate              INT,
    NumCompaniesWorked       INT,
    Over18                   NVARCHAR(10),
    OverTime                 NVARCHAR(10), 
    PercentSalaryHike        INT, 
    PerformanceRating        INT,
    RelationshipSatisfaction INT,
    StandardHours            INT,
    StockOptionLevel         INT, 
    TotalWorkingYears        INT, 
    TrainingTimesLastYear    INT, 
    WorkLifeBalance          INT,
    YearsAtCompany           INT, 
    YearsInCurrentRole       INT,
    YearsSinceLastPromotion  INT,
    YearsWithCurrManager     INT            
);
GO
