SELECT
    region,
    DATE_TRUNC('week', created_at) AS week_start,
    SUM(total_engagement) AS weekly_engagement,
    AVG(engagement_rate) AS avg_engagement_rate
FROM {{ ref('int_post_engagement') }} AS pe JOIN {{ref('stg_profiles')}} AS p ON pe.profile_id = p.profile_id
GROUP BY region, week_start