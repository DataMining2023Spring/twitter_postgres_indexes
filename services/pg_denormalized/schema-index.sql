-- 01
CREATE INDEX hashtags_gin ON tweets_jsonb USING gin((data->'entities'->'hashtags'));
CREATE INDEX ex_tags_gin ON tweets_jsonb USING gin((data->'extended_tweet'->'entities'->'hashtags'));

-- 04
CREATE INDEX ex_text_lang ON tweets_jsonb USING gin(to_tsvector('english', coalesce(data->'extended_tweet'->>'full_text', data->>'text'))) WHERE (data->>'lang'='en');
