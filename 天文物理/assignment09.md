name : 楊承叡
student ID : 110502545 
date of submission : 2025-04-30
assignment number : #09

---

## Script
```python
import sqlite3
import csv

conn = sqlite3.connect("messier.db")
cursor = conn.cursor()

cursor.execute('DROP TABLE IF EXISTS messier_objects')

cursor.execute('''
CREATE TABLE IF NOT EXISTS messier_objects (
    id TEXT,
    ngc TEXT,
    magnitude REAL,
    constellation_eng TEXT,
    type TEXT
    )
''')
conn.commit()

with open('catalogue-de-messier2.csv', newline='', encoding='utf-8') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        cursor.execute('''
            INSERT INTO messier_objects (
                id, ngc, magnitude, constellation_eng, type
            ) VALUES (?, ?, ?, ?, ?)
        ''', (
            row.get('id'),
            row.get('ngc'),
            float(row['magnitude']) if row.get('magnitude') else None,
            row.get('constellation_eng'),
            row.get('object_type')
        ))
conn.commit()

print("Open Clusters in Archer with Magnitude ≤ 5 : ")
cursor.execute('''
    SELECT *
    FROM messier_objects
    WHERE type LIKE '%Open Cluster%'
    AND constellation_eng = 'Archer' AND magnitude <= 5
''')

results = cursor.fetchall()
total = 0
for row in results:
    print(f"id: {row[0]}, ngc: {row[1]}, magnitude: {row[2]}, constellation: {row[3]}, object_type: {row[4]}")
    total += 1

print(f"Total matching objects: {total}")

conn.close()
```

---

## Output of Execution
![[Pasted image 20250430213539.png]]
---

## Description
1. **Database Connection:** Establishes a connection to the `messier.db` SQLite database. ```python conn = sqlite3.connect("messier.db") cursor = conn.cursor() ``` 
2. **Table Creation:** Drops the `messier_objects` table if it exists and then creates a new table with the following schema: ```sql CREATE TABLE IF NOT EXISTS messier_objects ( id TEXT, ngc TEXT, magnitude REAL, constellation_eng TEXT, type TEXT ) ``` 
3. **CSV Data Import:** Reads data from a CSV file named `catalogue-de-messier2.csv` and inserts it into the `messier_objects` table. It maps CSV columns to the corresponding table columns (`id`, `ngc`, `magnitude`, `constellation_eng`, `object_type`). ```python with open('catalogue-de-messier2.csv', newline='', encoding='utf-8') as csvfile: reader = csv.DictReader(csvfile) for row in reader: cursor.execute(''' INSERT INTO messier_objects ( id, ngc, magnitude, constellation_eng, type ) VALUES (?, ?, ?, ?, ?) ''', ( row.get('id'), row.get('ngc'), float(row['magnitude']) if row.get('magnitude') else None, row.get('constellation_eng'), row.get('object_type') )) conn.commit() ``` 
4. **Data Query:** Queries the `messier_objects` table to find all "Open Cluster" objects located in the "Archer" constellation with a magnitude less than or equal to 5. ```sql SELECT * FROM messier_objects WHERE type LIKE '%Open Cluster%' AND constellation_eng = 'Archer' AND magnitude <= 5 ``` 
5. **Result Output:** Prints the details (id, ngc, magnitude, constellation, object\_type) of the matching objects and the total number of matching objects found. ```python print("Open Clusters in Archer with Magnitude ≤ 5 : ") # ... (query execution) ... for row in results: print(f"id: {row[0]}, ngc: {row[1]}, magnitude: {row[2]}, constellation: {row[3]}, object_type: {row[4]}") total += 1 print(f"Total matching objects: {total}") ``` 
6. **Database Closure:** Closes the connection to the SQLite database. ```python conn.close() ```