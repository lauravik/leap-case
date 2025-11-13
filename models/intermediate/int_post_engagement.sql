SELECT
    post_id,
    created_at,
    post_type,
    pr.profile_id,
    num_likes,
    num_comments,
    num_shares,
    (num_likes + num_comments + num_shares) AS total_engagement,
    (num_likes + num_comments + num_shares) /  NULLIF(num_followers, 0) AS engagement_rate
FROM {{ ref('stg_posts') }} AS p
LEFT JOIN {{ ref('stg_profiles') }} AS pr ON p.profile_id = pr.profile_id
