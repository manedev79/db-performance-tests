# db-performance-tests
Database performance tests. The examples are inspired by the book *SQL Performance explained*.

## Prerequisites
- docker and docker-compose
- SQL Client, e.g.
    - [SQL Tools VSCode Extension](https://marketplace.visualstudio.com/items?itemName=mtxr.sqltools)
    - [MSSQL Extension for VSCode](https://marketplace.visualstudio.com/items?itemName=ms-mssql.mssql)
    - [DBeaver](https://dbeaver.io/)
    - [Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio)

## Setup

TODO: Common traits

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
"username": "perftest",
"password": "example",
"database": "perftest"
```
3. Create test data. Execute [`postgres/sql/create-employees.sql`](postgres/sql/create-employees.sql).

4. Run sample queries, e.g. [`postgres/sql/primary-keys.sql`](postgres/sql/primary-keys.sql)

The sample queries are creating execution plans, i.e. they use `EXPLAIN`.

### SQL Server

1. Start SQL Server
```
cd mssql
docker-compose up
```
NOTE: This will create the database `perftest` and all tables initially.  

2. Connect with your favorite DB client
```
"server": "localhost",
"port": 1433,
"username": "sa",
"password": "SuperStrong@Passw0rd",
"database": "perftest"
```
3. Run sample queries, e.g. [`mssql/sql/primary-keys.sql`](mssql/sql/primary-keys.sql)

The sample queries are creating execution plans, i.e. they use set `SET STATISTICS PROFILE ON` and `SET STATISTICS PROFILE OFF` afterwards. This generates two results: The actual result and another one for the execution plan.

## Project Board

Planned stuff goes into the [Kanban Board](https://github.com/manedev79/db-performance-tests/projects/1).
