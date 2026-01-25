### **✅ Module 1 — Docker & SQL**

## Data Engineering Zoomcamp 2026 — Homework Solutions
---

## Question 1 — Docker Image Inspection

**Logic:**  
Run a container with `python:3.13` image using `bash` entrypoint.  
What’s the version of `pip` in the image?

**Answer:**  
**24.3.1**

**Work:**
```bash
docker run -it --entrypoint=bash python:3.13
pip --version
