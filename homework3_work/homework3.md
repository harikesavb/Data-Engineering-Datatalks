
# Module 3 Homework: Data Warehousing & BigQuery


## BigQuery Setup

Create an external table using the Yellow Taxi Trip Records. 

Create a (regular/materialized) table in BQ using the Yellow Taxi Trip Records (do not partition or cluster this table).

~~~~sql
CREATE OR REPLACE EXTERNAL TABLE zoomcamp.external_yellow_tripdata
OPTIONS(
  format = 'PARQUET',
  uris = ['gs://cohesive-folio-485508-e4-terra-bucket/yellow_tripdata_2024-0*.parquet']);

CREATE OR REPLACE TABLE zoomcamp.materialized_yellow_tripdata AS
SELECT * FROM `cohesive-folio-485508-e4.zoomcamp.external_yellow_tripdata`;
~~~~


## Question 1. Counting records

What is count of records for the 2024 Yellow Taxi Data?


✅ 20,332,093

## Query:

~~~~sql
SELECT COUNT(*) 
FROM `cohesive-folio-485508-e4.zoomcamp.external_yellow_tripdata`; -- 20332093
~~~~

## Question 2. Data read estimation

Write a query to count the distinct number of PULocationIDs for the entire dataset on both the tables.
 
What is the **estimated amount** of data that will be read when this query is executed on the External Table and the Table?


✅ 0 MB for the External Table and 155.12 MB for the Materialized Table

## Query:

~~~~sql
SELECT DISTINCT  PULocationID 
FROM `cohesive-folio-485508-e4.zoomcamp.external_yellow_tripdata`; -- 0 octet

SELECT DISTINCT  PULocationID 
FROM `cohesive-folio-485508-e4.zoomcamp.materialized_yellow_tripdata`; -- 155,12 Mo
~~~~

Attention malgré que 0 Mb sont affiché pour le cout de l'external table il y a un vraie cout reel lorsque l'on regarde les détails du job 155Mb !!

## Question 3. Understanding columnar storage

Write a query to retrieve the PULocationID from the table (not the external table) in BigQuery. Now write a query to retrieve the PULocationID and DOLocationID on the same table.
Why are the estimated number of Bytes different?

✅ BigQuery is a columnar database, and it only scans the specific columns requested in the query. Querying two columns (PULocationID, DOLocationID) requires 
reading more data than querying one column (PULocationID), leading to a higher estimated number of bytes processed.

## Query:
~~~~sql
SELECT PULocationID 
FROM `cohesive-folio-485508-e4.zoomcamp.materialized_yellow_tripdata`; -- 155,12 Mo

SELECT PULocationID, DOLocationID 
FROM `cohesive-folio-485508-e4.zoomcamp.materialized_yellow_tripdata`; -- 310.24 Mo
~~~~

## Question 4. Counting zero fare trips

How many records have a fare_amount of 0?

✅ 8,333

## Query:
~~~~sql
SELECT COUNT(fare_amount )
FROM `cohesive-folio-485508-e4.zoomcamp.materialized_yellow_tripdata`
WHERE fare_amount = 0;
~~~~

## Question 5. Partitioning and clustering

What is the best strategy to make an optimized table in Big Query if your query will always filter based on tpep_dropoff_datetime and order the results by VendorID (Create a new table with this strategy)

✅ Partition by tpep_dropoff_datetime and Cluster on VendorID

## Query:

~~~~sql
-- partition and cluster table
CREATE OR REPLACE TABLE zoomcamp.partitoned_clustered_yellow_tripdata
PARTITION BY DATE(tpep_dropoff_datetime)
CLUSTER BY VendorID AS
SELECT * FROM `cohesive-folio-485508-e4.zoomcamp.external_yellow_tripdata`;
~~~~

## Question 6. Partition benefits

Write a query to retrieve the distinct VendorIDs between tpep_dropoff_datetime
2024-03-01 and 2024-03-15 (inclusive)


Use the materialized table you created earlier in your from clause and note the estimated bytes. Now change the table in the from clause to the partitioned table you created for question 5 and note the estimated bytes processed. What are these values? 

Choose the answer which most closely matches.
 

✅ 310.24 MB for non-partitioned table and 26.84 MB for the partitioned table

## Query:

~~~~sql
SELECT DISTINCT  VendorID 
FROM `cohesive-folio-485508-e4.zoomcamp.materialized_yellow_tripdata` 
WHERE 
  TIMESTAMP_TRUNC(tpep_dropoff_datetime, DAY) > TIMESTAMP("2024-03-01") 
  AND
  TIMESTAMP_TRUNC(tpep_dropoff_datetime, DAY) <= TIMESTAMP("2024-03-15"); -- 310 Mo

  SELECT DISTINCT  VendorID 
FROM `cohesive-folio-485508-e4.zoomcamp.partitoned_clustered_yellow_tripdata` 
WHERE 
  TIMESTAMP_TRUNC(tpep_dropoff_datetime, DAY) > TIMESTAMP("2024-03-01") 
  AND
  TIMESTAMP_TRUNC(tpep_dropoff_datetime, DAY) <= TIMESTAMP("2024-03-15"); -- 25.05 Mo
~~~~


## Question 7. External table storage

Where is the data stored in the External Table you created?


✅ GCP Bucket


## Question 8. Clustering best practices

It is best practice in Big Query to always cluster your data:


✅ False


## Question 9. Understanding table scans

No Points: Write a `SELECT count(*)` query FROM the materialized table you created. How many bytes does it estimate will be read? Why?

## Query:
~~~~sql
SELECT COUNT(*) 
FROM `cohesive-folio-485508-e4.zoomcamp.materialized_yellow_tripdata` ;
~~~~
