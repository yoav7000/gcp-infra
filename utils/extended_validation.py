import psycopg2
from psycopg2 import sql
import sys

DB_CONFIG = {
    "host": "localhost",      # or service name in k8s
    "port": 5432,
    "dbname": "your_db_name",
    "user": "your_user",
    "password": "your_password",
}

def run_check(cursor, description, query):
    try:
        cursor.execute(query)
        result = cursor.fetchone()
        print(f"[OK] {description}: {result}")
    except Exception as e:
        print(f"[FAIL] {description}: {e}")
        sys.exit(1)

def main():
    try:
        conn = psycopg2.connect(**DB_CONFIG, sslmode="disable")
        conn.autocommit = True
        print("[OK] Connected to database")
    except Exception as e:
        print(f"[FAIL] Connection failed: {e}")
        sys.exit(1)

    with conn.cursor() as cursor:
        # 1. Version check
        run_check(cursor, "Postgres version", "SELECT version();")

        # 2. Current database and user
        run_check(
            cursor,
            "Current database & user",
            "SELECT current_database(), current_user;"
        )

        # 3. Database exists in pg_database
        run_check(
            cursor,
            "Database exists",
            "SELECT datname FROM pg_database WHERE datname = current_database();"
        )

        # 4. Schemas exist
        run_check(
            cursor,
            "Schema count",
            "SELECT count(*) FROM pg_namespace;"
        )

        # 5. Tables in public schema (can be zero)
        run_check(
            cursor,
            "Public tables",
            "SELECT count(*) FROM pg_tables WHERE schemaname = 'public';"
        )

        # 6. Simple query execution
        run_check(cursor, "Simple query", "SELECT 1;")

        # 7. System catalog readable
        run_check(
            cursor,
            "System catalog access",
            "SELECT count(*) FROM pg_class;"
        )

        # 8. Server uptime
        run_check(
            cursor,
            "Server uptime",
            "SELECT now() - pg_postmaster_start_time();"
        )

    conn.close()
    print("\n✅ Database validation completed successfully")

if __name__ == "__main__":
    main()
