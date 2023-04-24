-- 01
CREATE INDEX tag_id_ttags ON tweet_tags(tag, id_tweets);
-- 03
CREATE INDEX id_lang_tweets ON tweets(id_tweets, lang);
--05
CREATE INDEX eng_text_tweets ON tweets USING gin(to_tsvector('english', text));
CREATE INDEX id_tag_ttags ON tweet_tags(id_tweets, tag); 
