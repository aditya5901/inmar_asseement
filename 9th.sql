WITH TEAM_VIEW AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY redemptionDate ORDER BY createDateTime DESC) AS rk
    FROM `[project].[dataset].tblRedemptions-ByDay`
    WHERE retailerId = (SELECT ID FROM `[project].[dataset].tblRetailers` WHERE retailerName = 'ABC Store')
    AND redemptionDate BETWEEN '2023-10-30' AND '2023-11-05'
)
SELECT redemptionDate, redemptionCount
FROM TEAM_VIEW
WHERE rk = 1;



--1. Date with least redeem count --> 2023-11-05 count --> 3702
--2. Date with most redeem count --> 2023-11-04, count --> 5224
--3. First -> 2023-11-06 11:00:00 UTC Second -> 2023-11-05 11:00:00 UTC
--4. Here is the below qquery
--SELECT redemptionDate, redemptionCount
--FROM `[project].[dataset].tblRedemptions-ByDay`
--WHERE retailerId = (SELECT ID FROM `[project].[dataset].tblRetailers` WHERE retailerName = 'ABC Store')
--AND redemptionDate BETWEEN '2023-10-30' AND '2023-11-05'
--GROUP BY redemptionDate
--HAVING createDateTime = MAX(createDateTime);