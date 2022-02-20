# Amazon Vine Analysis

## Overview of the project
This project is for analyzing Amazon reviews written by members of the paid Amazon Vine program. 

The Amazon Vine program is a service that allows manufacturers and publishers to receive reviews for their products. Companies like SellBy pay a small fee to Amazon and provide products to Amazon Vine members, who are then required to publish a review.

- Task 1: Perform ETL on Amazon Product Reviews ([Amazon_Reviews_ETL.ipynb](https://github.com/Takomochi/Amazon_Vine_Analysis/blob/main/Amazon_Reviews_ETL.ipynb))
- Task 2: Determine Bias of Vine Reviews ([Vine_Review_Analysis.sql](https://github.com/Takomochi/Amazon_Vine_Analysis/blob/main/Vine_Review_Analysis.sql))

## Resources
- Data: https://s3.amazonaws.com/amazon-reviews-pds/tsv/amazon_reviews_us_Video_Games_v1_00.tsv.gz
- Software: AWS, Google Colaboratory, pdAdmin4

## Results
1. How many Vine reviews and non-Vine reviews were there?
    - There were 94 vine reviews and 40471 non-vine reviews.
    
2. How many Vine reviews were 5 stars? How many non-Vine reviews were 5 stars?
    - There were 48 of vine reviews with 5 stars and 15663 of non-vine reviews with 5 stars.

3. What percentage of Vine reviews were 5 stars? What percentage of non-Vine reviews were 5 stars?
    - 51.06 % of vine reviews were 5 stars and 38.70 % of non-vine reviews were 5 stars.

## Summary
There is a bias for reviews in the Vine program. When we look at the percentage of reviews with 5 stars, Vine reviews have more than half of the reviews with 5 stars.

To support my statement, I also queried the average rating for each type. 

```
# Average star_rating of Vin program
SELECT AVG(star_rating) as average_rating
FROM vine_table_y;

# Average star_rating of non-Vine program
SELECT AVG(star_rating) as average_rating
FROM vine_table_n;
```
### Result of average ratings<br>
- Vine reviews : 4.20
- Non-Vine reviews : 3.35 

The average rating is 4.2 with Vine reviews. On the other hand, the average rating is 3.35 with non-Vine reviews. Therefore, there is a bias for reviews in the Vine program.


