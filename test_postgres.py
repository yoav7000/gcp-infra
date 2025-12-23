import os
import psycopg2

conn = psycopg2.connect(
    host="127.0.0.1",
    port=5432,
    dbname="app",
    user="app",
    password="4sGOKtXjs1tY4AjLVRBTUULoIesvJ2ArRg2S0xgyKzTIrP3VhmvEtjXR34pKSva1",
    connect_timeout=5,
)
cur = conn.cursor()
cur.execute("SELECT 1;")
print(cur.fetchone()[0])  # prints 1

with conn.cursor() as cur:
    cur.execute("""
        SELECT datname
        FROM pg_database
        WHERE datistemplate = false
        ORDER BY datname;
    """)
    for (name,) in cur.fetchall():
        print(name)

cur.close()
conn.close()
