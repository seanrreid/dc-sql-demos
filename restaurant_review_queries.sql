-- List all the reviews for a given restaurant given a specific restaurant ID.
SELECT
    *
FROM
    review
WHERE
    restaurant_id = 5;

-- List all the reviews for a given restaurant, given a specific restaurant name.
SELECT
    review.review
FROM
    review,
    restaurant
WHERE
    review.restaurant_id = restaurant.id
    AND restaurant.name = 'Piu Bello';

-- equivalent to:
SELECT
    review.review
FROM
    review
    INNER JOIN restaurant ON review.restaurant_id = restaurant.id
WHERE
    restaurant.name = 'Piu Bello';

-- List all the reviews for a given reviewer, given a specific author name.
SELECT
    review.review
FROM
    review
    INNER JOIN reviewer ON review.reviewer_id = reviewer.id
WHERE
    reviewer.name = 'Aaron';

-- List all the reviews along with the restaurant they were written for. In the query result, select the restaurant name and the review text.
SELECT
    review.review,
    restaurant.name
FROM
    review,
    restaurant
WHERE
    review.restaurant_id = restaurant.id;

-- average stars by restaurant
SELECT
    restaurant.id,
    restaurant.name,
    restaurant.address,
    avg(review.stars)
FROM
    restaurant,
    review
WHERE
    review.restaurant_id = restaurant.id
GROUP BY
    restaurant.id
    -- List all the reviews along with the restaurant, and the reviewer's name. The result should have the restaurant name, the review text, and the reviewer name. Hint: you will need to do a three-way join - i.e. joining all three tables together.
    SELECT
        restaurant.name AS restaurant_name,
        reviewer.name AS reviewer_name,
        review.review
    FROM
        restaurant,
        review,
        reviewer
    WHERE
        restaurant.id = review.restaurant_id
        AND review.reviewer_id = reviewer.id;

-- equivalent in inner join syntax
SELECT
    restaurant.name AS restaurant_name,
    reviewer.name AS reviewer_name,
    review.review
FROM
    reviewer
    INNER JOIN review ON review.reviewer_id = review.id
    INNER JOIN restaurant ON review.restaurant_id = restaurant.id;

-- Get the number of restaurants in each category. (category name, restaurant count)
SELECT
    category,
    count(*)
FROM
    restaurant
GROUP BY
    category;

-- Get number of 5 star reviews given by restaurant. (restaurant name, 5-star count)
SELECT
    restaurant.name,
    count(*)
FROM
    restaurant,
    review
WHERE
    review.restaurant_id = restaurant.id
    AND review.stars = 5
GROUP BY
    restaurant.id;

-- Get the average star rating for a food category. (category name, average star rating)
SELECT
    category,
    avg(review.stars)
FROM
    restaurant,
    review
WHERE
    review.restaurant_id = restaurant.id
GROUP BY
    restaurant.category;

