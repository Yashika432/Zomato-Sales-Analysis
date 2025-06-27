create database project_3;
use project_3;
create table country(countryId int unique key,countryname varchar(20));
INSERT INTO country (countryid, countryname) VALUES (1,'India'),
(14, 'Australia'), (30, 'Brazil'), (37, 'Canada'), (94, 'Indonesia'), 
(148, 'New Zealand'), (162, 'Philippines'), (166, 'Qatar'), (184, 'Singapore'), 
(189, 'South Africa'), (191, 'Sri Lanka'), (208, 'Turkey'), 
(214, 'United Arab Emirates'), (215, 'United Kingdom'), (216, 'United States');
#-------------------------Kpi-1-----------------------------
SELECT 
    CAST(CONCAT(`year opening`, '-', `month opening`, '-', `day opening`) AS DATE) AS DateKey_Opening
FROM zomato;
CREATE TABLE Calendar (
    DateKey DATE PRIMARY KEY,
    Year INT,
    MonthNo INT,
    MonthFullName VARCHAR(20),
    Quarter VARCHAR(2),
    YearMonth VARCHAR(10),
    WeekdayNo INT,
    WeekdayName VARCHAR(10),
    FinancialMonth VARCHAR(5),
    FinancialQuarter VARCHAR(5)
);

INSERT INTO Calendar (
    DateKey, Year, MonthNo, MonthFullName, Quarter, YearMonth,
    WeekdayNo, WeekdayName, FinancialMonth, FinancialQuarter
)
SELECT DISTINCT
    STR_TO_DATE(CONCAT(`year opening`, '-', `month opening`, '-', `day opening`), '%Y-%m-%d') AS DateKey,
    `year opening`,
    `month opening`,
    MONTHNAME(STR_TO_DATE(CONCAT(`year opening`, '-', `month opening`, '-', `day opening`), '%Y-%m-%d')),
    CONCAT('Q', QUARTER(STR_TO_DATE(CONCAT(`year opening`, '-', `month opening`, '-', `day opening`), '%Y-%m-%d'))),
    DATE_FORMAT(STR_TO_DATE(CONCAT(`year opening`, '-', `month opening`, '-', `day opening`), '%Y-%m-%d'), '%Y-%b'),
    WEEKDAY(STR_TO_DATE(CONCAT(`year opening`, '-', `month opening`, '-', `day opening`), '%Y-%m-%d')) + 1,
    DAYNAME(STR_TO_DATE(CONCAT(`year opening`, '-', `month opening`, '-', `day opening`), '%Y-%m-%d')),
    CONCAT('FM', ((`month opening` - 3 + 12) % 12 + 1)),
    CONCAT('FQ', CEIL(((`month opening` - 3 + 12) % 12 + 1) / 3.0))
FROM zomato;
#---------------------------------------Kpi-2-----------------------
SELECT RestaurantName,City,Countryname,Average_Cost_for_two,
    concat((Average_Cost_for_two * 0.01167),'$') AS Cost_in_USD
FROM zomato as A join country as B
on A.countrycode=B.countryid;
#-----------------------------------------Kpi-3------------------------
SELECT `City`,`countryname`, COUNT(`RestaurantName`) AS Restaurant_Count
FROM zomato as A join country as B
on A.countrycode=B.countryid
GROUP BY 1,2
ORDER BY Restaurant_Count DESC;
#-------------------------------------------kpi-4----------------------------
SELECT `Year Opening` AS Year, COUNT(*) AS Openings
FROM zomato
GROUP BY 1
ORDER BY Year;
#---------------quarter------------------
SELECT A.Quarter AS Quartern, COUNT(*) AS Openings
FROM Calendar AS A JOIN zomato AS B ON B.`Month Opening` = A.MonthNo
GROUP BY A.Quarter
ORDER BY Quartern;
#----------------month---------------
SELECT `Month Opening` AS Month, COUNT(*) AS Openings
FROM zomato
GROUP BY 1
ORDER BY Month;
#---------------------------------------kpi-5-------------------------------------------
SELECT ROUND(AVG(Rating), 1) AS Average_Rating
FROM zomato;
#--------------------------rating wose count-----------------------------------------
SELECT ROUND(Rating, 1) AS Rating_Bucket,COUNT(*) AS Restaurant_Count
FROM zomato
GROUP BY Rating_Bucket
ORDER BY Rating_Bucket DESC;

#--------------------------------------kpi-6-----------------------------------------
SELECT CASE 
        WHEN Average_Cost_for_two < 500 THEN 'Low'
        WHEN Average_Cost_for_two BETWEEN 500 AND 1000 THEN 'Mid'
        WHEN Average_Cost_for_two BETWEEN 1000 AND 2000 THEN 'High'
        ELSE 'Luxury'
    END AS PriceBucket,
    COUNT(*) AS Restaurant_Count
FROM zomato
GROUP BY 1;
#--------------------------------------------kpi-7----------------------------------------
SELECT 
    (COUNT(CASE WHEN Has_Table_Booking = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS Percentage_Table_Booking
FROM zomato;
#-------------------------------------------kpi-8---------------------------------------------
SELECT 
    (COUNT(CASE WHEN Has_Online_Delivery = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS Percentage_Online_Delivery
FROM zomato;
#-----------------------------------------------------kpi-9-------------------------------------------
SELECT Cuisines, COUNT(*) AS Restaurant_Count
FROM zomato
GROUP BY 1
ORDER BY Restaurant_Count DESC;
#-------------------city by cusines-------------------------------------
SELECT City, Cuisines, COUNT(*) AS Restaurant_Count
FROM zomato
GROUP BY 1,2
ORDER BY City, Restaurant_Count DESC;