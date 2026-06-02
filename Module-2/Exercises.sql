SELECT  e.event_id, e.title, e.city, e.start_date,  e.end_date FROM Users u 
JOIN Registrations r ON u.user_id = r.user_id JOIN Events e ON r.event_id = e.event_id
WHERE e.status = 'upcoming' AND e.city = u.city
ORDER BY e.start_date ASC;

SELECT e.event_id, e.title,AVG(f.rating) AS avg_rating, COUNT(*) AS feedback_count
FROM Events e
JOIN Feedback f ON e.event_id = f.event_id
GROUP BY e.event_id, e.title
HAVING COUNT(*) >= 10
ORDER BY avg_rating DESC;

SELECT *
FROM Users u
WHERE u.user_id NOT IN (
    SELECT DISTINCT user_id
    FROM Registrations
    WHERE registration_date >= CURDATE() - INTERVAL 90 DAY
);

SELECT e.event_id,e.title,COUNT(s.session_id) AS session_count
FROM Events e
LEFT JOIN Sessions s
ON e.event_id = s.event_id
WHERE TIME(s.start_time) BETWEEN '10:00:00' AND '12:00:00'
GROUP BY e.event_id, e.title;

SELECT u.city,COUNT(DISTINCT r.user_id) AS registrations
FROM Users u
JOIN Registrations r
ON u.user_id = r.user_id
GROUP BY u.city
ORDER BY registrations DESC
LIMIT 5;

SELECT e.event_id,e.title,COUNT(r.resource_id) AS total_resources
FROM Events e
LEFT JOIN Resources r
ON e.event_id = r.event_id
GROUP BY e.event_id, e.title;

SELECT u.full_name,e.title,f.rating,f.comments
FROM Feedback f
JOIN Users u ON f.user_id = u.user_id
JOIN Events e ON f.event_id = e.event_id
WHERE f.rating < 3;

SELECT e.event_id,e.title,COUNT(s.session_id) AS session_count
FROM Events e
LEFT JOIN Sessions s
ON e.event_id = s.event_id
WHERE e.status = 'upcoming'
GROUP BY e.event_id, e.title;

SELECT u.full_name,e.status,COUNT(*) AS total_events
FROM Events e
JOIN Users u
ON e.organizer_id = u.user_id
GROUP BY u.full_name, e.status;

SELECT e.event_id,e.title
FROM Events e
JOIN Registrations r
ON e.event_id = r.event_id
LEFT JOIN Feedback f
ON e.event_id = f.event_id
WHERE f.feedback_id IS NULL
GROUP BY e.event_id, e.title;

SELECT registration_date,COUNT(*) AS user_count
FROM Users
WHERE registration_date >= CURDATE() - INTERVAL 7 DAY
GROUP BY registration_date;

SELECT e.event_id,e.title,COUNT(s.session_id) AS session_count
FROM Events e
JOIN Sessions s
ON e.event_id = s.event_id
GROUP BY e.event_id, e.title
HAVING COUNT(s.session_id) = (
    SELECT MAX(cnt)
    FROM (
        SELECT COUNT(*) cnt
        FROM Sessions
        GROUP BY event_id
    ) t
);

SELECT e.city,AVG(f.rating) AS avg_rating
FROM Events e
JOIN Feedback f
ON e.event_id = f.event_id
GROUP BY e.city;

SELECT e.event_id,e.title,COUNT(r.registration_id) AS total_registrations
FROM Events e
JOIN Registrations r
ON e.event_id = r.event_id
GROUP BY e.event_id, e.title
ORDER BY total_registrations DESC
LIMIT 3;

SELECT s1.event_id,s1.title,s2.title
FROM Sessions s1
JOIN Sessions s2
ON s1.event_id = s2.event_id
AND s1.session_id < s2.session_id
AND s1.start_time < s2.end_time
AND s1.end_time > s2.start_time;

SELECT *
FROM Users u
WHERE registration_date >= CURDATE() - INTERVAL 30 DAY
AND NOT EXISTS (
    SELECT 1
    FROM Registrations r
    WHERE r.user_id = u.user_id
);

SELECT speaker_name,COUNT(*) AS total_sessions
FROM Sessions
GROUP BY speaker_name
HAVING COUNT(*) > 1;

SELECT e.event_id,e.title
FROM Events e
LEFT JOIN Resources r
ON e.event_id = r.event_id
WHERE r.resource_id IS NULL;


SELECT e.event_id,e.title,COUNT(DISTINCT r.registration_id) AS total_registrations,AVG(f.rating) AS avg_rating
FROM Events e
LEFT JOIN Registrations r
ON e.event_id = r.event_id
LEFT JOIN Feedback f
ON e.event_id = f.event_id
WHERE e.status = 'completed'
GROUP BY e.event_id, e.title;

SELECT u.user_id,u.full_name,COUNT(DISTINCT r.event_id) AS attended_events,COUNT(DISTINCT f.feedback_id) AS feedback_count
FROM Users u
LEFT JOIN Registrations r
ON u.user_id = r.user_id
LEFT JOIN Feedback f
ON u.user_id = f.user_id
GROUP BY u.user_id, u.full_name;

SELECT u.full_name,COUNT(f.feedback_id) AS feedback_count
FROM Users u
JOIN Feedback f
ON u.user_id = f.user_id
GROUP BY u.user_id, u.full_name
ORDER BY feedback_count DESC
LIMIT 5;

SELECT user_id,event_id,COUNT(*) AS duplicates
FROM Registrations
GROUP BY user_id, event_id
HAVING COUNT(*) > 1;

SELECT DATE_FORMAT(registration_date,'%Y-%m') AS month,COUNT(*) AS registrations
FROM Registrations
WHERE registration_date >= CURDATE() - INTERVAL 12 MONTH
GROUP BY DATE_FORMAT(registration_date,'%Y-%m')
ORDER BY month;

SELECT e.event_id,e.title,AVG(TIMESTAMPDIFF(MINUTE,s.start_time,s.end_time)) AS avg_duration_minutes
FROM Events e
JOIN Sessions s
ON e.event_id = s.event_id
GROUP BY e.event_id, e.title;


SELECT e.event_id,e.title
FROM Events e
LEFT JOIN Sessions s
ON e.event_id = s.event_id
WHERE s.session_id IS NULL;


/*
+----------+-------------------------------+-------------+---------------------+---------------------+
| event_id | title                         | city        | start_date          | end_date            |
+----------+-------------------------------+-------------+---------------------+---------------------+
|        1 | Tech Innovators Meetup        | New York    | 2025-06-10 10:00:00 | 2025-06-10 16:00:00 |
|        3 | Frontend Development Bootcamp | Los Angeles | 2025-07-01 10:00:00 | 2025-07-03 16:00:00 |
+----------+-------------------------------+-------------+---------------------+---------------------+
2 rows in set (0.00 sec)

Empty set (0.00 sec)

+---------+---------------+---------------------+-------------+-------------------+
| user_id | full_name     | email               | city        | registration_date |
+---------+---------------+---------------------+-------------+-------------------+
|       1 | Alice Johnson | alice@example.com   | New York    | 2024-12-01        |
|       2 | Bob Smith     | bob@example.com     | Los Angeles | 2024-12-05        |
|       3 | Charlie Lee   | charlie@example.com | Chicago     | 2024-12-10        |
|       4 | Diana King    | diana@example.com   | New York    | 2025-01-15        |
|       5 | Ethan Hunt    | ethan@example.com   | Los Angeles | 2025-02-01        |
+---------+---------------+---------------------+-------------+-------------------+
5 rows in set (0.00 sec)

+----------+-------------------------------+---------------+
| event_id | title                         | session_count |
+----------+-------------------------------+---------------+
|        1 | Tech Innovators Meetup        |             2 |
|        3 | Frontend Development Bootcamp |             1 |
+----------+-------------------------------+---------------+
2 rows in set (0.00 sec)

+-------------+---------------+
| city        | registrations |
+-------------+---------------+
| Los Angeles |             2 |
| New York    |             2 |
| Chicago     |             1 |
+-------------+---------------+
3 rows in set (0.00 sec)

+----------+-------------------------------+-----------------+
| event_id | title                         | total_resources |
+----------+-------------------------------+-----------------+
|        1 | Tech Innovators Meetup        |               1 |
|        2 | AI & ML Conference            |               1 |
|        3 | Frontend Development Bootcamp |               1 |
+----------+-------------------------------+-----------------+
3 rows in set (0.00 sec)

Empty set (0.00 sec)

+----------+-------------------------------+---------------+
| event_id | title                         | session_count |
+----------+-------------------------------+---------------+
|        1 | Tech Innovators Meetup        |             2 |
|        3 | Frontend Development Bootcamp |             1 |
+----------+-------------------------------+---------------+
2 rows in set (0.00 sec)

+---------------+-----------+--------------+
| full_name     | status    | total_events |
+---------------+-----------+--------------+
| Alice Johnson | upcoming  |            1 |
| Charlie Lee   | completed |            1 |
| Bob Smith     | upcoming  |            1 |
+---------------+-----------+--------------+
3 rows in set (0.00 sec)

+----------+-------------------------------+
| event_id | title                         |
+----------+-------------------------------+
|        3 | Frontend Development Bootcamp |
+----------+-------------------------------+
1 row in set (0.00 sec)

Empty set (0.00 sec)

+----------+------------------------+---------------+
| event_id | title                  | session_count |
+----------+------------------------+---------------+
|        1 | Tech Innovators Meetup |             2 |
+----------+------------------------+---------------+
1 row in set (0.00 sec)

+----------+------------+
| city     | avg_rating |
+----------+------------+
| Chicago  |     4.5000 |
| New York |     3.0000 |
+----------+------------+
2 rows in set (0.00 sec)

+----------+-------------------------------+---------------------+
| event_id | title                         | total_registrations |
+----------+-------------------------------+---------------------+
|        1 | Tech Innovators Meetup        |                   2 |
|        2 | AI & ML Conference            |                   2 |
|        3 | Frontend Development Bootcamp |                   1 |
+----------+-------------------------------+---------------------+
3 rows in set (0.00 sec)

Empty set (0.00 sec)

Empty set (0.00 sec)

Empty set (0.00 sec)

Empty set (0.00 sec)

+----------+--------------------+---------------------+------------+
| event_id | title              | total_registrations | avg_rating |
+----------+--------------------+---------------------+------------+
|        2 | AI & ML Conference |                   2 |     4.5000 |
+----------+--------------------+---------------------+------------+
1 row in set (0.00 sec)

+---------+---------------+-----------------+----------------+
| user_id | full_name     | attended_events | feedback_count |
+---------+---------------+-----------------+----------------+
|       1 | Alice Johnson |               1 |              0 |
|       2 | Bob Smith     |               1 |              1 |
|       3 | Charlie Lee   |               1 |              1 |
|       4 | Diana King    |               1 |              1 |
|       5 | Ethan Hunt    |               1 |              0 |
+---------+---------------+-----------------+----------------+
5 rows in set (0.00 sec)

+-------------+----------------+
| full_name   | feedback_count |
+-------------+----------------+
| Bob Smith   |              1 |
| Charlie Lee |              1 |
| Diana King  |              1 |
+-------------+----------------+
3 rows in set (0.00 sec)

Empty set (0.00 sec)

+---------+---------------+
| month   | registrations |
+---------+---------------+
| 2025-06 |             1 |
+---------+---------------+
1 row in set (0.00 sec)

+----------+-------------------------------+----------------------+
| event_id | title                         | avg_duration_minutes |
+----------+-------------------------------+----------------------+
|        1 | Tech Innovators Meetup        |              67.5000 |
|        2 | AI & ML Conference            |              90.0000 |
|        3 | Frontend Development Bootcamp |             120.0000 |
+----------+-------------------------------+----------------------+
3 rows in set (0.00 sec)

Empty set (0.00 sec)

mysql>
*/