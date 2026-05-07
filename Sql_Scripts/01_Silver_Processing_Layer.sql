/*
===============================================================================
Stored Procedure: Load Silver Layer (Bronze -> Silver)
===============================================================================
Script Purpose:
    This stored procedure performs the ETL (Extract, Transform, Load) process to 
    populate the 'silver' schema tables from the 'bronze' schema.
	Actions Performed:
		- Truncates Silver tables.
		- Inserts transformed and cleansed data from Bronze into Silver tables.
		
Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC Silver.load_silver;
===============================================================================
*/

CREATE OR ALTER PROCEDURE silver.load_silver AS
BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME; 
    BEGIN TRY
        SET @batch_start_time = GETDATE();
        PRINT '================================================';
        PRINT 'Loading Silver Layer';
        PRINT '================================================';

		-- Loading silver.hr_attrition
        SET @start_time = GETDATE();
		PRINT '>> Truncating Table: silver.hr_attrition';
		TRUNCATE TABLE silver.hr_attrition;
		PRINT '>> Inserting Data Into: silver.hr_attrition';
		INSERT INTO silver.hr_attrition (
            Age, 
            Attrition, 
            BusinessTravel,
            DailyRate,
            Department, 
            DistanceFromHome,
            Education, 
            EducationField, 
            EmployeeCount, 
            EmployeeNumber, 
            EnvironmentSatisfaction,
            Gender, 
            HourlyRate,
            JobInvolvement, 
            JobRole, 
            JobLevel,
            JobSatisfaction,
            MaritalStatus, 
            MonthlyIncome, 
            MonthlyRate, 
            NumCompaniesWorked, 
            Over18, 
            OverTime, 
            PercentSalaryHike, 
            PerformanceRating, 
            RelationshipSatisfaction, 
            StandardHours,
            StockOptionLevel,
            TotalWorkingYears, 
            TrainingTimesLastYear, 
            WorkLifeBalance,
            YearsAtCompany,
            YearsInCurrentRole, 
            YearsSinceLastPromotion, 
            YearsWithCurrManager
        )
        SELECT 
            Age,
            CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END AS Atrrition, -- Transformation
            BusinessTravel,
            DailyRate,
            Department,
            DistanceFromHome,
            Education,
            EducationField,
            EmployeeCount,
            EmployeeNumber,
            EnvironmentSatisfaction,
            Gender,
            HourlyRate,
            JobInvolvement,
            JobRole,
            JobLevel,
            JobSatisfaction,
            MaritalStatus,
            MonthlyIncome,
            MonthlyRate,
            NumCompaniesWorked,
            Over18,
            CASE WHEN OverTime = 'Yes' THEN 1 ELSE 0 END AS OverTime, -- Transformation
            PercentSalaryHike,
            PerformanceRating,
            RelationshipSatisfaction,
            StandardHours,
            StockOptionLevel,
            TotalWorkingYears,
            TrainingTimesLastYear,
            WorkLifeBalance,
            YearsAtCompany,
            YearsInCurrentRole,
            YearsSinceLastPromotion,
            YearsWithCurrManager
        FROM bronze.hr_attrition;
		SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';

				SET @batch_end_time = GETDATE();
		PRINT '=========================================='
		PRINT 'Loading Silver Layer is Completed';
        PRINT '   - Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '=========================================='
		
	END TRY

	BEGIN CATCH
		PRINT '==========================================';
		PRINT 'ERROR OCCURED DURING LOADING SILVER LOAD';
		PRINT 'Error Message: ' + ERROR_MESSAGE();
		PRINT 'Error Number: ' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error State: ' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT 'Error Line: ' + CAST(ERROR_LINE() AS NVARCHAR);
		PRINT '==========================================';
	END CATCH
END

EXEC Silver.load_silver;
