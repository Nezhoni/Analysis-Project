-- Average sleep by level of daily sedentary time.

SELECT
    CASE
        WHEN SedentaryMinutes > 720 THEN 'High Sedentary (12h+)'
        WHEN SedentaryMinutes BETWEEN 480 AND 720 THEN 'Moderate Sedentary (8-12h)'
        ELSE 'Low Sedentary (<8h)'
    END AS sedentary_level,
    ROUND(AVG(TotalMinutesAsleep), 2) AS avg_minutes_asleep,
    COUNT(*) AS total_logs
FROM (
    SELECT A.SedentaryMinutes, S.TotalMinutesAsleep
    FROM `bellabeatproject-488620.bellabeat_data.daily_activity` AS A
    JOIN `bellabeatproject-488620.bellabeat_data.sleep_day` AS S
        ON A.Id = S.Id
        AND A.ActivityDate = CAST(S.SleepDay AS DATE)
)
GROUP BY sedentary_level;
