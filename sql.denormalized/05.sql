SELECT
    '#' || no_tag AS tag,
    count(*) AS count
FROM (
    SELECT DISTINCT
        data->>'id',
        jsonb_array_elements(
	        COALESCE(data->'entities'->'hashtags','[]') ||
	        COALESCE(data->'extended_tweet'->'entities'->'hashtags','[]')
        )->>'text' AS no_tag
    FROM tweets_jsonb
    WHERE (to_tsvector('english', COALESCE(data->'extended_tweet'->>'full_text', data->>'text')) @@ to_tsquery('english','coronavirus'))
           AND data->>'lang' = 'en'
) t
GROUP BY tag
ORDER BY count DESC,tag
LIMIT 1000;
