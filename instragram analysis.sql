use ig_clone;

-- 1 Loyal user reward 
select username from users order by created_at  limit 5;

-- 2 Inactive user engagement

  select u.username,p.image_url from users u left join photos p on u.id= p.user_id where image_url is null  ;
 
 -- 3 Contest winner declaration 
  select  photo_id,count(*) t from likes l group by photo_id order by t desc limit 5;
  select u.*, l.* from users u left join likes l on u.id= l.user_id where photo_id = 145;
  
  
  

-- 4 Top 5 most hashtag used

select t.id, t.tag_name, count(tag_id) total_tag from tags t right join photo_tags pt on t.id = pt.tag_id group by tag_id order by total_tag desc limit 5;
 
-- 5 Ad campaign Launch 

select dayname (created_at)days,count(*)count from users
 group by  dayname (created_at) order by count desc limit 1;
 

-- 5 average user engagement 

select count(p.image_url)/ count(distinct u.username) as ratio from photos p left join users u on p.user_id= u.id;
-- bots and fake account 

  select u.username, u.id, count(user_id) total from users u right join likes l on u.id=l.user_id group by user_id order by total desc limit 13;


