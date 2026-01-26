### **✅ Module 1 — Docker & SQL**

## Data Engineering Zoomcamp 2026 - Homework Solutions
---

## Question 1 — Pip Version in python:3.13 Docker Image


**Logic:**  
Run a container with `python:3.13` image using `bash` entrypoint.  
What’s the version of `pip` in the image?

**Answer:**  
**25.3**

**Work:**
```bash
docker run -it --entrypoint=bash python:3.13
pip --version
```
**Output screenshot:**


![iamge alt](https://github.com/harikesavb/Data-Engineering-Datatalks/blob/63e960946138cc70aa21f54558d76391122b9ed7/homework1_works/homework1_ss/que-1.png)



## Question 2 — Docker Networking

**Logic:**
Given the docker-compose setup, what hostname + port should pgAdmin use to connect to Postgres?

**Answer:**
db:5432

**Explanation:**
Containers communicate via service names in Docker compose network; internal Postgres port is 5432.


## Question 3 — Count Trips ≤ 1 Mile

**Logic:**
Count trips in Nov 2025 where trip_distance <= 1.

**Answer:**
8007

**Work:**

```sql
SELECT COUNT(*) 
FROM green_tripdata
WHERE lpep_pickup_datetime >= '2025-11-01'
  AND lpep_pickup_datetime < '2025-12-01'
  AND trip_distance <= 1;
```
**Output screenshot:**

![image alt](https://github.com/harikesavb/Data-Engineering-Datatalks/blob/1dcea27bc57a55a998404f0b23d6cc88344cf438/homework1_works/homework1_ss/que-3.png)

## Question 4 — Pickup Day with Longest Trip (<100mi)

**Logic:**
Which pickup date had the longest trip (excluding ≥100mi)?

**Answer:**
2025-11-24

**Work:**

```sql
SELECT DATE(lpep_pickup_datetime) AS pickup_day,
       MAX(trip_distance) AS max_distance
FROM green_tripdata
WHERE trip_distance < 100
GROUP BY pickup_day
ORDER BY max_distance DESC
LIMIT 1;
```
**Output screenshot:**

![image alt](https://github.com/harikesavb/Data-Engineering-Datatalks/blob/21614760f4440a9c23c73b6500e560870085fe8d/homework1_works/homework1_ss/que-4.png)

## Question 5 — Highest Total Amount Zone on Nov 18

**Logic:**
Find pickup zone with highest total_amount sum on Nov 18 2025.

**Answer:**
East Harlem North

**Work:**
```sql
SELECT z."Zone",
       SUM(g.total_amount) AS total_amount_sum
FROM green_tripdata g
JOIN taxi_zone_lookup z
  ON g."PULocationID" = z."LocationID"
WHERE DATE(lpep_pickup_datetime) = '2025-11-18'
GROUP BY z."Zone"
ORDER BY total_amount_sum DESC
LIMIT 1;
```

**Output screenshot:**

![image alt](https://github.com/harikesavb/Data-Engineering-Datatalks/blob/21614760f4440a9c23c73b6500e560870085fe8d/homework1_works/homework1_ss/que-5.png)

## Question 6 — Largest Tip Drop Zone

**Logic:**
For pickups in East Harlem North in Nov 2025, which drop-off zone had largest tip?

**Answer:**
Yorkville West

**Work:**
```sql
SELECT zdo."Zone",
       MAX(g.tip_amount) AS max_tip
FROM green_tripdata g
JOIN taxi_zone_lookup zpu
  ON g."PULocationID" = zpu."LocationID"
JOIN taxi_zone_lookup zdo
  ON g."DOLocationID" = zdo."LocationID"
WHERE zpu."Zone" = 'East Harlem North'
  AND g.lpep_pickup_datetime >= '2025-11-01'
  AND g.lpep_pickup_datetime < '2025-12-01'
GROUP BY zdo."Zone"
ORDER BY max_tip DESC
LIMIT 1;
```
**Output screenshot:**

![image alt](https://github.com/harikesavb/Data-Engineering-Datatalks/blob/21614760f4440a9c23c73b6500e560870085fe8d/homework1_works/homework1_ss/que-6.png)

## Question 7 — Terraform Workflow

**Logic:**
Which workflow steps describe correct Terraform usage?

**Answer:**
terraform init → terraform apply -auto-approve → terraform destroy







