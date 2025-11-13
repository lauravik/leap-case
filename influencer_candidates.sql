SELECT
    pr.region,
    pr.profile_id,
    pr.profile_name,
    COUNT(DISTINCT pe.post_id) AS num_posts,
    SUM(pe.total_engagement) AS total_engagement,
    AVG(pe.engagement_rate) AS avg_engagement_rate,
    RANK() OVER (PARTITION BY pr.region ORDER BY SUM(pe.total_engagement) DESC) AS rank_in_region
FROM {{ ref('int_post_engagement') }} AS pe
JOIN {{ ref('stg_profiles') }} AS pr ON pe.profile_id = pr.profile_id
WHERE pe.created_at >= DATEADD(day, -30, CURRENT_DATE())
GROUP BY pr.region, pr.profile_id, pr.profile_name
