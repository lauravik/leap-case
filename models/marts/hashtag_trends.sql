WITH exploded AS (
    SELECT
        post_id,
        num_likes,
        num_shares,
        num_collect,
        num_comments,
        created_at,
        TRIM(LOWER(value)) AS hashtag
    FROM {{ ref('stg_posts') }},
    LATERAL FLATTEN(input => hashtags_array)
)

SELECT
    hashtag,
    SUM(num_likes) AS num_likes,
    SUM(num_shares) AS num_share,
    SUM(num_collect) AS num_collect,
    SUM(num_comments) AS num_comments,
    MIN(created_at) AS min_date,
    MAX(created_at) AS max_date,
    COUNT(DISTINCT post_id) AS total_posts,
FROM exploded
GROUP BY hashtag
ORDER BY total_posts DESC

