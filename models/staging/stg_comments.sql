SELECT
    commenter_id,
    post_id,
    url as comment_url,
    comment_text,
    commenter_user_name,
    num_likes,
    num_replies,
    date_created AS comment_date,
    timestamp as created_at
FROM {{ source('raw_tiktok', 'comments') }}
WHERE comment_text IS NOT NULL
