--Find the unique shared users for each garage
SELECT garage_id, COUNT(DISTINCT user_id) as num_unique_users
FROM charging_sessions
WHERE user_type = 'Shared'
GROUP BY garage_id
ORDER BY num_unique_users DESC
;

--Find the top 10 most popular starting charge times by day and hour
SELECT weekdays_plugin,start_plugin_hour, COUNT(start_plugin) as num_charging_sessions
FROM charging_sessions
WHERE user_type = 'Shared'
GROUP BY weekdays_plugin, start_plugin_hour
ORDER BY num_charging_sessions DESC
LIMIT 10
;

--Find users with long average charging times
SELECT user_id, AVG(duration_hours) as avg_charging_duration
FROM charging_sessions
WHERE user_type = 'Shared'
GROUP BY user_id
HAVING AVG(duration_hours) > 10
ORDER BY avg_charging_duration DESC
;
