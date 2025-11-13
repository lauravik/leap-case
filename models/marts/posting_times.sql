SELECT
    EXTRACT(DOW FROM created_at) AS weekday,
    EXTRACT(HOUR FROM created_at) AS hour,
    AVG(engagement_rate) AS avg_engagement_rate,
    COUNT(*) AS num_posts
FROM {{ ref('int_post_engagement') }}
GROUP BY weekday, hour
ORDER BY avg_engagement_rate DESC
