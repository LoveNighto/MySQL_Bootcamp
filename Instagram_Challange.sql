-- FINDING 5 OLDEST USER -----------------------------------------------------

SELECT * FROM users ORDER BY created_at LIMIT 5;

SELECT created_at, DAYOFWEEK(created_at) FROM users ORDER BY DAYOFWEEK(created_at);

SELECT COUNT(*) FROM users WHERE DAYOFWEEK(created_at) = 7;

SELECT 
    DAYNAME(created_at) AS day,
    COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC;

-- USERS THAT NEVER POSTED PHOTOS --------------------------------------------

SELECT username FROM users
LEFT JOIN photos ON photos.user_id = users.id
WHERE photos.id IS NULL;

-- PHOTO WITH MOST LIKES -----------------------------------------------------

SELECT username, likes.photo_id, photos.image_url, COUNT(likes.user_id) AS 'Likes' FROM photos
JOIN likes ON photos.id = likes.photo_id
JOIN users ON  photos.user_id = users.id
GROUP BY likes.photo_id
ORDER BY COUNT(likes.user_id) DESC
LIMIT 1;

-- AVG USERS POST -----------------------------------------------------------

SELECT username, COUNT(photos.user_id) AS Post_count FROM photos
JOIN users ON photos.user_id = users.id
GROUP BY username;

SELECT COUNT(*) FROM photos;
SELECT COUNT(*) FROM users;
SELECT ((SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users)) AS Average_user_post;

-- 5 MOST POPULAR HASHTAGS ------------------------------------------------------

SELECT * FROM tags;

SELECT tag_name, COUNT(tag_id) FROM tags
JOIN photo_tags ON photo_tags.tag_id = tags.id
GROUP BY tag_name
ORDER BY COUNT(tag_id) DESC
LIMIT 5;

-- BOT CHECK, LIKING ALL PHOTS = BOTS ----------------------------------------------
SELECT COUNT(*) FROM photos;
SELECT username, COUNT(likes.user_id),
	CASE	
		WHEN COUNT(likes.user_id) = (SELECT COUNT(*) FROM photos) THEN 'Bots'
        ELSE 'Human'
	END AS Bot_check
FROM users
JOIN likes ON likes.user_id = users.id
JOIN photos ON likes.photo_id = photos.id
GROUP BY username
ORDER BY COUNT(likes.user_id) DESC;
