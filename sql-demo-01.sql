INSERT INTO orders (name, size, drink)
  VALUES ('oakley', 'grande', 'espresso');

INSERT INTO orders (name, size, drink)
  VALUES ('chris', 'super grande', 'espressooooo'), ('angela', 'gigantor', 'oatmilk latte with bourbon'), ('milla', 'small', 'milk');

-- grab everything from orders
SELECT
  *
FROM
  orders;

-- ilike provides a case-insensitive text search
SELECT
  *
FROM
  orders
WHERE
  name ILIKE 'miLlA';

-- the % symbol used in a string is the wildcard matcher
SELECT
  *
FROM
  orders
WHERE
  name ILIKE 'mil%';

SELECT
  *
FROM
  orders
WHERE
  name ILIKE '%is%';

-- the preferred way to retrieve a single row is to use the id
SELECT
  *
FROM
  orders
WHERE
  id = 3;

-- updating!
-- 1. write it as a select statement
-- 2. then do the update
--select * from orders where id=3;

UPDATE
  orders
SET
  size = 'godzilla'
WHERE
  id = 3;

UPDATE
  orders
SET
  size = 'house',
  name = 'the angelator'
WHERE
  id = 3;

-- deletion!
-- 1. write it as a select and confirm that's the target
-- 2. then do the delete

SELECT
  *
FROM
  orders
WHERE
  id = 4;

DELETE FROM orders
WHERE id = 4;

SELECT
  *
FROM
  orders;

INSERT INTO orders (name, size, drink)
  VALUES ('jeff', 'grande', 'jeff');

INSERT INTO orders (name, drink)
  VALUES ('jeff', 'jeff');

SELECT
  *
FROM
  orders;

