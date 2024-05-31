-- DROP TABLE if EXISTS Posts CASCADE;
-- CREATE  TABLE Posts(
-- post_id serial PRIMARY KEY,
-- post_content varchar(100),
-- post_date Date
-- );
-- insert into Posts(post_content,post_date)
-- VALUES
-- ('Lorem ipsum dolor sit amet','2023-08-25 10:00:00'),
-- ('Exploring the beauty of nature','2023-08-26 15:30:00'),
-- ('Unveiling the latest tech trends','2023-08-27 12:00:00'),
-- ('Journey into the world of literature','2023-08-28 09:45:00'),
-- ('Capturing the essence of city life','2023-08-29 16:20:00');
-- 
-- drop TABLE if exists UserReactions;
-- CREATE TABLE UserReactions(
-- reaction_id serial,
-- user_id INT,
-- post_id INT,
-- reaction_type char(10),
-- reaction_date Date,
-- FOREIGN key (post_id) REFERENCES Posts(post_id)
-- );
-- insert into UserReactions(user_id,post_id,reaction_type,reaction_date)
-- VALUES
-- (101,1,'like','2023-08-25 10:15:00'),
-- (102,1,'comment','2023-08-25 11:30:00'),
-- (103,1,'share','2023-08-26 12:45:00'),
-- (101,2,'like','2023-08-26 15:45:00'),
-- (102,2,'comment','2023-08-27 09:20:00'),
-- (104,2,'like','2023-08-27 10:00:00'),
-- (105,3,'comment','2023-08-27 14:30:00'),
-- (101,3,'like','2023-08-28 08:15:00'),
-- (103,4,'like','2023-08-28 10:30:00'),
-- (105,4,'share','2023-08-29 11:15:00'),
-- (104,5,'like','2023-08-29 16:30:00'),
-- (101,5,'comment','2023-08-30 09:45:00');

-- Retrieve the comprehensive count of likes, comments, and shares garnered by a specific post identified by its unique post ID


-- SELECT p.Post_id, p.post_content,
--     count(case when u.reaction_type = 'like' then 1 end) as num_likes,
--     count(case when u.reaction_type = 'comment' then 1 end) as num_comment,
--     count(case when u.reaction_type = 'share' then 1 end) as num_share
-- from 
--     UserReactions as u join Posts as p using (post_id)
-- group by p.post_id,p.post_content;

-- SELECT
--     p.post_id,
--     p.post_content,
--     COUNT(CASE WHEN u.reaction_type = 'like' THEN 1 END) AS num_likes,
--     COUNT(CASE WHEN u.reaction_type = 'comment' THEN 1 END) AS num_comments,
--     COUNT(CASE WHEN u.reaction_type = 'share' THEN 1 END) AS num_shares
-- FROM
--     Posts AS p
-- LEFT JOIN
--     UserReactions AS u ON p.post_id = u.post_id
-- WHERE
--     p.post_id = 2
-- GROUP BY
--     p.post_id, p.post_content;

-- Calculate the mean number of reactions, encompassing likes, comments, and shares per distinct user within a designated 

-- SELECT
--     Reaction_day,
--     count(DISTINCT user_id) as "Distinct_User",
--     count(*) as "Total_Reactions",
--     ROUND(COUNT(*)::numeric / COUNT(DISTINCT user_id), 4) AS "Avg_Reactions_Per_User"
-- from(
-- SELECT
--     reaction_date as Reaction_day,
--     count( * ) as reactions_per_user,
--     user_id from "public"."userreactions"
-- GROUP by user_id,reaction_date) as subquery
-- GROUP BY
--     Reaction_day
-- Order BY
--     Reaction_day;

-- Identify the three most engaging posts, measured by the aggregate sum of reactions, within the preceding week

SELECT
    p.post_id,
    p.post_content,
    r.total_reactions
FROM
    "public"."posts" AS p
LEFT JOIN (
    SELECT
        post_id,
        COUNT(reaction_type) AS total_reactions
    FROM
        userreactions
    GROUP BY
        post_id
) AS r ON p.post_id = r.post_id
ORDER BY
    r.total_reactions DESC
LIMIT 3;


