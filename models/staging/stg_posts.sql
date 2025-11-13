SELECT
    post_id,
    profile_id,
    url AS post_url,
    description AS caption,
    create_time AS created_at,
    digg_count AS num_likes,
    share_count AS num_shares,
    collect_count AS num_collect,
    comment_count AS num_comments,
    play_count,
    video_duration,
    SPLIT(hashtags, ',') AS hashtags_array,
    original_sound,
    post_type
FROM {{ source('raw_tiktok', 'posts') }}