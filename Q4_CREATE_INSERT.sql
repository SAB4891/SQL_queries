CREATE TABLE sessions (
session_id MEDIUMINT NOT NULL, 
created_at TIMESTAMP, 
delivery_fee_lc DECIMAL(3,2),
surge_applicable ENUM('YES', 'NO') NOT NULL
);  

INSERT INTO sessions (session_id, created_at, delivery_fee_lc, surge_applicable)
VALUES (236783, '2022-09-19 12:29:29', 2 ,'NO'), (236722, '2022-09-01 08:00:01', 5, 'NO'), (236231, '2022-09-16 15:00:00', 7.5, 'YES'),
(236783, '2022-09-19 12:29:32', 2.25, 'NO'), (236783, '2022-09-19 12:29:40', 3, 'YES'), (236722, '2022-09-01 08:01:00', 5, 'NO')


