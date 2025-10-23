If you’re confused about where to start with data engineering, this project is for you. It’s a simple, beginner-friendly ETL project using SQL and Python — no Docker, no Airflow, no unnecessary complexity. I was once in that same boat, unsure where to begin, so I built this project to help you understand the process clearly and take your first confident step into data engineering.

Project Overview (Beginner-Friendly ETL)
Goal:
Build a simple ETL pipeline that:

    1.Extracts data from a CSV file

    2.Transforms it using SQL

    3.Loads it into PostgreSQL

Step 1:  ## This is an H2 header
PostgreSQL Setup


Step 2:



Step 3: ## This is an H2 header
Create a New Database in PostgreSQL (via pgAdmin)
Follow these quick steps:
1. Open pgAdmin
2. In the left sidebar: Expand: Servers → PostgreSQL → Databases
3. Right-click on Databases or Select ➝ Create ➝ Database…
4. Enter this info:
    Database Name: etl_project
    Owner: leave default (usually postgres)
    Click Save

Step 4:
Create Project Folder & CSV
1. Create a folder for your project, e.g., on Desktop (name: ETL_Project)
2. Inside the folder, create/paste a CSV file called (Data file is in repo folder named Data)

