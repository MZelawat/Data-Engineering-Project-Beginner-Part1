If you’re confused about where to start with data engineering, this project is for you. It’s a simple, beginner-friendly ETL project using SQL and Python — no Docker, no Airflow, no unnecessary complexity. I was once in that same boat, unsure where to begin, so I built this project to help you understand the process clearly and take your first confident step into data engineering.

Project Overview (Beginner-Friendly ETL)
Goal:
Build a simple ETL pipeline that:

    1.Extracts data from a CSV file

    2.Transforms it using SQL

    3.Loads it into PostgreSQL

## Prerequisites
Before running this ETL project, make sure you have the following installed:

1. PostgreSQL (Database)
Download & install: https://www.postgresql.org/download/

2. Create a database named etl_project
Note your username (default: postgres) and password

3. pgAdmin (Optional GUI for PostgreSQL)
Download: https://www.pgadmin.org/download/

4. Python 3.9+ – Programming Language

5. Visual Studio Code (VS Code) – Code Editor
Download: https://code.visualstudio.com/
Recommended Extensions: Python (by Microsoft)

6. Basic knowledge of SQL and Python



## Step 1:
PostgreSQL Setup


## Step 2:



## Step 3:
Create a New Database in PostgreSQL (via pgAdmin)
Follow these quick steps:
1. Open pgAdmin
2. In the left sidebar: Expand: Servers → PostgreSQL → Databases
3. Right-click on Databases or Select ➝ Create ➝ Database…
4. Enter this info:
    Database Name: etl_project
    Owner: leave default (usually postgres)
    Click Save

## Step 4:
Create Project Folder & CSV
1. Create a folder for your project, e.g., on Desktop (name: ETL_Project)
2. Inside the folder, create/paste a CSV file called student_exam_scores.csv 
Link: [Data](https://github.com/MZelawat/Data-Engineering-Project-Beginner-Part1/tree/main/Data)

## Step 5:
Setup Python to run PostgreSQL (in VS Code)
We’ll use psycopg2, a simple PostgreSQL connector for Python.
1. Install psycopg2 (run in Terminal):
```bash 
pip install psycopg2-binary
```
2. Create a Python script inside your project folder: (ETL_Project/ETL_Project.py)

## Step 6.1:
Connect Python to PostgreSQL
In your Python script (etl_project.py), establish the connection:
```python
conn = psycopg2.connect(
    host="localhost",
    database="etl_project",
    user="postgres",
    password="YOUR_PASSWORD"  # Replace with your actual password
)
```
Link:[Python Script]: https://github.com/MZelawat/Data-Engineering-Project-Beginner-Part1/commit/e9064d071e477718a13f26d6d27d5a2eef5f7f08

## Step 6.2:
Connect Python to PostgreSQL
In your Python script (etl_project.py), create a table in PostgreSQL database so that we can bring the data from csv to this table:
```python
cur=conn.cursor() 
cur.execute (
    """CREATE TABLE IF NOT EXISTS STUD_S (student_id VARCHAR(10) PRIMARY KEY, 
    hours_studied float(4),
    sleep_hours float(4),
    attendance_percent float(4),
    previous_scores float(4),
    exam_score float(4))""")
conn.commit()
```
## Note: You can define variable name as per your naming convention like insted cur you can put cur_sql
Link:[Python Script]: https://github.com/MZelawat/Data-Engineering-Project-Beginner-Part1/commit/e9064d071e477718a13f26d6d27d5a2eef5f7f08

## Step 6.3:
Connect Python to PostgreSQL
Now th table has been created, we will insert the data from csv to the table we just created STUD_S
```python
with open('ETL_Project/student_exam_scores.csv','r') as f:
    reader=csv.DictReader(f)
    for row in reader:
        cur.execute("""
        insert into STUD_S (student_id,hours_studied, sleep_hours, attendance_percent, previous_scores, exam_score)
        values (%s, %s, %s, %s, %s, %s)
        on conflict (student_id) DO nothing
        """, (row['student_id'],row['hours_studied'],row['sleep_hours'],row['attendance_percent'],row['previous_scores'],row['exam_score']))
        conn.commit()
    cur.close()
    conn.close()
    print("CSV Data loaded int postgreSQL Successfully!")
```
Link:[Python Script]: https://github.com/MZelawat/Data-Engineering-Project-Beginner-Part1/commit/e9064d071e477718a13f26d6d27d5a2eef5f7f08