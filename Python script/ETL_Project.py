import psycopg2
import csv

conn=psycopg2.connect (database='etl_project', 
                       user='postgres', 
                       password='YOUR_PASSWORD'  # Replace with your actual password, 
                       host='localhost', 
                       port='5432')
cur=conn.cursor()

cur.execute("""
CREATE TABLE IF NOT EXISTS STUD_S (student_id VARCHAR(10) PRIMARY KEY,	
hours_studied float(4) ,
sleep_hours float(4),
attendance_percent float(4),
previous_scores float(4),
exam_score float(4))
""")
conn.commit()

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
