-- Join daily activity with sleep records by user (Id) and date.
-- Keeps only days with recorded sleep and sedentary time.

SELECT
    A.Id,
    A.ActivityDate,
    A.SedentaryMinutes,
    S.TotalMinutesAsleep,
    S.TotalTimeInBed
FROM
    `bellabeatproject-488620.bellabeat_data.daily_activity` AS A
INNER JOIN
    `bellabeatproject-488620.bellabeat_data.sleep_day` AS S
    ON A.Id = S.Id
    AND A.ActivityDate = CAST(S.SleepDay AS DATE)
WHERE
    S.TotalMinutesAsleep > 0
    AND A.SedentaryMinutes > 0;
