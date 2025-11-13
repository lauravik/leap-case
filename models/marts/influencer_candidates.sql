SELECT
    pe.profile_id,
    pr.profile_name,
    pr.num_followers,
    pe.total_engagement,
    pe.avg_engagement_rate,
    (pe.total_engagement / NULLIF(pr.num_followers, 0)) AS engagement_per_follower
FROM {{ ref('int_profile_engagement') }} AS pe
LEFT JOIN {{ ref('stg_profiles') }} AS pr
  ON pe.profile_id = pr.profile_id
WHERE pr.num_followers BETWEEN 1000 AND 20000
  AND pe.avg_engagement_rate > 0.05
ORDER BY engagement_per_follower DESC

