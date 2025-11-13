SELECT profile_id, caption, comment_text, p.post_id, commenter_id, 
FROM {{ ref('stg_comments') }} AS c JOIN 
    {{ref('stg_posts')}} AS p ON c.post_id = p.post_id
WHERE caption ILIKE '%skincare%'
    AND comment_text ILIKE '%love%' OR comment_text ILIKE '%great%'

