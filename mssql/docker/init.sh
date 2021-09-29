# Wait to be sure that SQL Server came up
sleep "$SCRIPT_SLEEP"

# Run the setup script to create the DB and the schemas in the DB
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "$SA_PASSWORD" -i /usr/src/perftest/sql/ddl/create-database.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "$SA_PASSWORD" -d perftest -i /usr/src/perftest/sql/ddl/create-employees.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "$SA_PASSWORD" -d perftest -i /usr/src/perftest/sql/ddl/update-employees.sql