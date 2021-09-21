# db-performance-tests
Database performance tests. The examples are inspired by the book *SQL Performance explained*.

## Prerequisites
- docker and docker-compose
- SQL Client, e.g.
    - [SQL Tools VSCode Extension](https://marketplace.visualstudio.com/items?itemName=mtxr.sqltools)
    - [DBeaver](https://dbeaver.io/)
    - [Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio)

## Setup

### Postgres

1. Start Postgres DB
```
cd postgres
docker-compose up
```
2. Connect with your favorite DB client``
```
"server": "localhost",
"port": 5432,
"username": "postgres",
"password": "example",
"database": "perftest"
```
3. Create test data. Execute [`postgres/sql/create-employees.sql`](postgres/sql/create-employees.sql).

4. Run sample queries, e.g. [`postgres/sql/primary-keys.sql`](postgres/sql/primary-keys.sql)

## Project Board

Planned stuff goes into the [Kanban Board](https://github.com/manedev79/db-performance-tests/projects/1).
