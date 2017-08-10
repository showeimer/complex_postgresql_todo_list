-- NEW INSERTS ============================================================
-- Write INSERT statements to insert 20 todos into the todos table, with a combination of priorities, created times, and completed times, with not all having a completed time.

INSERT INTO todo (title, priority, created_at) VALUES
('Pay electric bill', 5, TO_TIMESTAMP('2017-08-08 06:25:00', 'YYYY-MM-DD HH24:MI:SS')),
('Buy dog food', 4, TO_TIMESTAMP('2017-06-01 11:50:00', 'YYYY-MM-DD HH24:MI:SS')),
('Pressure wash house', 3, TO_TIMESTAMP('2017-07-21 15:25:00', 'YYYY-MM-DD HH24:MI:SS')),
('Oil change', 2, TO_TIMESTAMP('2017-08-09 14:05:00', 'YYYY-MM-DD HH24:MI:SS')),
('Study for test', 1, TO_TIMESTAMP('2017-08-02 20:47:00', 'YYYY-MM-DD HH24:MI:SS')),
('Renew car registration', 5, TO_TIMESTAMP('2017-07-07 07:07:00', 'YYYY-MM-DD HH24:MI:SS')),
('Order new phone chargers', 4, TO_TIMESTAMP('2017-08-08 08:05:00', 'YYYY-MM-DD HH24:MI:SS')),
('Pay off credit card', 3, TO_TIMESTAMP('2017-06-19 04:12:00', 'YYYY-MM-DD HH24:MI:SS')),
('Schedule appointment with VA', 2, TO_TIMESTAMP('2017-06-21 00:48:00', 'YYYY-MM-DD HH24:MI:SS')),
('Take couch to the dump', 1, TO_TIMESTAMP('2017-07-02 23:22:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO todo (title, details, priority, created_at) VALUES
('Plan vacation', 'Coordinate with friends', 5, TO_TIMESTAMP('2017-06-02 12:18:00', 'YYYY-MM-DD HH24:MI:SS')),
('Buy new cookingware', 'Use discount coupon', 4, TO_TIMESTAMP('2017-07-23 09:08:00', 'YYYY-MM-DD HH24:MI:SS')),
('Sign up for gym membership', 'Research local gym prices', 3, TO_TIMESTAMP('2017-07-18 22:16:00', 'YYYY-MM-DD HH24:MI:SS')),
('Volunteer at Habitat for Humanity', 'Obtain volunteering schedule and registration form', 2, TO_TIMESTAMP('2017-06-16 08:35:00', 'YYYY-MM-DD HH24:MI:SS')),
('Practice guitar', 'Replace guitar strings', 1, TO_TIMESTAMP('2017-06-04 14:40:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO todo (title, priority, created_at, completed_at) VALUES
('Go to coding meetup', 5, TO_TIMESTAMP('2017-07-25 14:37:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2017-07-26 18:47:00', 'YYYY-MM-DD HH24:MI:SS')),
('Restock medications', 4, TO_TIMESTAMP('2017-06-01 11:50:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2017-06-12 07:27:00', 'YYYY-MM-DD HH24:MI:SS')),
('Plan weekend trip to Asheville', 3, TO_TIMESTAMP('2017-07-17 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2017-07-19 12:17:00', 'YYYY-MM-DD HH24:MI:SS')),
('Find a mentor', 2, TO_TIMESTAMP('2017-08-02 08:25:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2017-08-04 12:37:00', 'YYYY-MM-DD HH24:MI:SS')),
('Contact academic advisor', 1, TO_TIMESTAMP('2017-05-02 14:42:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2017-06-01 15:28:00', 'YYYY-MM-DD HH24:MI:SS'));


-- SELECT -- INCOMPLETED TODOS WITH PRIORITY OF 3=========================
-- Write a SELECT statement to find all incomplete todos with priority 3.

SELECT * FROM todo WHERE completed_at IS NULL AND priority = 3;


-- SELECT -- # OF INCOMPLETE TODOS BY PRIORITY ===========================
-- Write a SELECT statement to find the number of incomplete todos by priority.

SELECT priority, COUNT(*) FROM todo WHERE completed_at IS NULL GROUP BY priority;


-- SELECT -- # TODOS BY PRIORITY CREATED WITHIN LAST 30 DAYS =============
-- Write a SELECT statement to find the number of todos by priority created in the last 30 days.

SELECT priority, COUNT(*) FROM todo WHERE created_at > current_date - interval '30' day GROUP BY priority;

-- SELECT * FROM todo WHERE created_at > current_date - interval '30' day
-- ORDER BY CASE priority
-- WHEN 5 THEN 1
-- WHEN 4 THEN 2
-- WHEN 3 THEN 3
-- WHEN 2 THEN 4
-- WHEN 1 THEN 5
-- END;


-- SELECT -- HIGHEST PRIORITY THAT WAS CREATED FIRST =====================
-- Write a SELECT statement to find the next todo you should work on. This is the todo with the highest priority that was created first.

SELECT * FROM todo WHERE created_at = (SELECT min(created_at) FROM todo WHERE priority = 5 AND completed_at IS NULL);
