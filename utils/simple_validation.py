import psycopg2

HOST = "127.0.0.1"
PORT = 5432
DBNAME = "airis"
USER = "airis"
PASSWORD = "password1"

conn = psycopg2.connect(
    host=HOST,
    port=PORT,
    dbname=DBNAME,
    user=USER,
    password=PASSWORD,
    connect_timeout=5,
    sslmode="disable"

)

cur = conn.cursor()
cur.execute("SELECT 1;")
print("OK" if cur.fetchone()[0] == 1 else "FAIL")

cur.close()
conn.close()