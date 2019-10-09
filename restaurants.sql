/*
Naming Conventions:
 SQL keywords: UPPER CASE
 names: lower_case_with_underscores 
 */
CREATE TABLE restaurant (
    id serial PRIMARY KEY,
    name text NOT NULL,
    distance integer,
    stars integer,
    category text,
    fav_dish text,
    takeout boolean,
    ate_last timestamp
);

INSERT INTO restaurant (name, distance, stars, category, fav_dish, takeout, ate_last)
    VALUES ('Strange Taco', 30, 5, 'Mexican', 'BATL', TRUE, '2019-08-02 12:30:00');

