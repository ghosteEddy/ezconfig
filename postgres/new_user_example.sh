# Define your variables
CONTAINER_NAME="my-postgres-container" # Replace with your actual container name
DB_NAME="mydatabase"                 # Replace with your actual database name
READONLY_USER="readonly_user"        # Name for your new read-only user
READONLY_PASSWORD="readonly_pwd" # <<< CHANGE THIS!

echo "Creating user '$READONLY_USER'..."
docker exec -it "$CONTAINER_NAME" bash -c "psql -U postgres -d \"$DB_NAME\" -c \"CREATE USER $READONLY_USER WITH PASSWORD '$READONLY_PASSWORD';\""

echo "Granting CONNECT privilege to '$READONLY_USER' on database '$DB_NAME'..."
docker exec -it "$CONTAINER_NAME" bash -c "psql -U postgres -d \"$DB_NAME\" -c \"GRANT CONNECT ON DATABASE \"$DB_NAME\" TO $READONLY_USER;\""

echo "Granting USAGE on schema 'public' to '$READONLY_USER'..."
docker exec -it "$CONTAINER_NAME" bash -c "psql -U postgres -d \"$DB_NAME\" -c \"GRANT USAGE ON SCHEMA public TO $READONLY_USER;\""

echo "Granting SELECT on all existing tables in 'public' to '$READONLY_USER'..."
docker exec -it "$CONTAINER_NAME" bash -c "psql -U postgres -d \"$DB_NAME\" -c \"GRANT SELECT ON ALL TABLES IN SCHEMA public TO $READONLY_USER;\""

echo "Setting DEFAULT PRIVILEGES for future tables in 'public' for '$READONLY_USER'..."
docker exec -it "$CONTAINER_NAME" bash -c "psql -U postgres -d \"$DB_NAME\" -c \"ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO $READONLY_USER;\""