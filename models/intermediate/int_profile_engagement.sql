SELECT
    profile_id,
    COUNT(DISTINCT post_id) AS total_posts,
    SUM(num_likes) AS total_likes,
    SUM(num_comments) AS total_comments,
    SUM(num_shares) AS total_shares,
    SUM(total_engagement) AS total_engagement,
    AVG(engagement_rate) AS avg_engagement_rate
FROM {{ ref('int_post_engagement') }}
GROUP BY profile_id
