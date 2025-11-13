SELECT
    post_type,
    AVG(engagement_rate) AS avg_engagement_rate,
    AVG(num_likes) AS avg_likes,
    AVG(num_shares) AS avg_shares,
    AVG(num_comments) AS avg_comments,
    COUNT(*) AS post_count
FROM {{ ref('int_post_engagement') }}
GROUP BY post_type
ORDER BY avg_engagement_rate DESC