# User

## List all user
```docker compose exec -it postgres bash -c "psql -U postgres -d mydatabase -c '\\du'"```

## List detailed all user
```docker compose exec -it postgres bash -c "psql -U postgres -d mydatabase -c 'SELECT rolname, rolsuper, rolcreaterole, rolcreatedb, rolcanlogin, rolvaliduntil FROM pg_catalog.pg_roles ORDER BY rolname;'"
```