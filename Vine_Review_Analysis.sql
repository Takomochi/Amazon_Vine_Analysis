-- 1. Retrieve all the rows where the total_votes count is equal to or greater than 20
SELECT *
INTO vine_table_new
FROM vine_table
WHERE total_votes >= 20;	

-- 2. Retrieve all the rows where the number of helpful_votes divided by total_votes is equal to or greater than 50%
SELECT * 
INTO vine_table_2
FROM vine_table_new
WHERE CAST (helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT)>=0.5;

-- 3. Retrieves all the rows where a review was written as part of the Vine program (paid), vine == 'Y'.
SELECT *
INTO vine_table_y
FROM vine_table_2
WHERE vine = 'Y';

-- 4. Retrieves all the rows where a review was written as part of the Vine program (unpaid), vine == 'N'.
SELECT *
INTO vine_table_n
FROM vine_table_2
WHERE vine = 'N';

-- 5. Analysis

    -- 1.The total number of reviews for Each Type 
    SELECT COUNT(*)
    FROM vine_table_y; 
    --Y: 94

    SELECT COUNT(*)
    FROM vine_table_n;
    --N: 40471
    
    -- 2.The number of 5-star reviews
    SELECT COUNT(star_rating)
    FROM vine_table_y
    WHERE star_rating = 5;
    --Y: 48

    SELECT COUNT(star_rating)
    FROM vine_table_n
    WHERE star_rating =5;
    --N: 15663

    -- 3. The percentage of 5-star reviews for the two types of review (paid vs unpaid).
    SELECT COUNT(*),
        (((SELECT COUNT(*) FROM vine_table_y WHERE star_rating = 5)::decimal)/COUNT(*) * 100) AS percent
    FROM vine_table_y;
    -- Percentage: 51.06 % 

    SELECT COUNT(*),
        (((SELECT COUNT(*) FROM vine_table_n WHERE star_rating = 5)::decimal)/COUNT(*) * 100) AS percent
    FROM vine_table_n;
    -- Percentage: 38.70 % 


