### **✅ Module 1 — Docker & SQL**

## Data Engineering Zoomcamp 2026 - Homework Solutions
---

## Question 1 — Pip Version in python:3.13 Docker Image


**Logic:**  
Run a container with `python:3.13` image using `bash` entrypoint.  
What’s the version of `pip` in the image?

**Answer:**  
**24.3.1**

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
8,254

**Work:**

```sql
SELECT COUNT(*) 
FROM green_tripdata
WHERE lpep_pickup_datetime >= '2025-11-01'
  AND lpep_pickup_datetime < '2025-12-01'
  AND trip_distance <= 1;
```
**Output screenshot:**

![image alt]()






