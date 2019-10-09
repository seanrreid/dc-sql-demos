CREATE TABLE drinks (
    id serial PRIMARY KEY,
    recipe text
);

INSERT INTO drinks (recipe)
    VALUES ('espresso'), ('latte'), ('americano'), ('black coffee'), ('cappuccino');

SELECT
    *
FROM
    drinks;

CREATE TABLE customers (
    id serial PRIMARY KEY,
    name text NOT NULL,
    email text,
    twitter text
);

INSERT INTO customers (name, email, twitter)
    VALUES ('chris aquino', 'radishmouse@aol.com', '@radishmouse'), ('mr robot', 's4ms3piol@pm.me', '@mrrobot'), ('mr rogers', 'mr@rogers.com', '@neighbor');

-- how many drinks did chrisaquino order?
SELECT
    count(*)
FROM
    orders
WHERE
    customer_id = 1;

-- how many drinks did chrisaquino and mrrobot order?
SELECT
    count(*)
FROM
    orders
WHERE
    customer_id IN (1, 2);

-- how many drinks did somebody with twitter handle '@radishmouse' order? (must search by twitter handle)
-- 1. write query for person with twitter handle '@radishmouse'

SELECT
    id
FROM
    customers
WHERE
    twitter ILIKE '@radishmouse';

-- 2. combine that query with order count query
SELECT
    count(*)
FROM
    orders
WHERE
    customer_id = 1;

-- subquery
SELECT
    count(*)
FROM
    orders
WHERE
    customer_id = (
        SELECT
            id
        FROM
            customers
        WHERE
            twitter ILIKE '@radishmouse');

SELECT
    *
FROM
    customers;

--drop table orders;
CREATE TABLE orders (
    id serial PRIMARY KEY,
    size text,
    date timestamp,
    drink_id integer REFERENCES drinks (id),
    customer_id integer REFERENCES customers (id)
);

-- CURRENT_TIMESTAMP
INSERT INTO orders (size, date, customer_id, drink_id)
    VALUES ('grande', CURRENT_TIMESTAMP, 1, 2), ('vente', CURRENT_TIMESTAMP, 1, 3), ('tiny', CURRENT_TIMESTAMP, 1, 5), ('grande', CURRENT_TIMESTAMP, 2, 4), ('gigantor', CURRENT_TIMESTAMP, 2, 5), ('gigantor', CURRENT_TIMESTAMP, 2, 5), ('vente', CURRENT_TIMESTAMP, 2, 5), ('grande', CURRENT_TIMESTAMP, 3, 3), ('gigantor', CURRENT_TIMESTAMP, 3, 4);

SELECT
    *
FROM
    orders;

