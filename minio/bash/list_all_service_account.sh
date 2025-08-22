# Use first argument as MinIO alias, default to "local"
MINIO_ALIAS="${1:-local}"

# List all users
users=$(mc admin user list "$MINIO_ALIAS")

# Loop over each line
while IFS= read -r line; do
    # Split line into array by spaces
    read -ra cols <<< "$line"
    user="${cols[1]}"  # second column is index 1
    echo "Service accounts for user: $user"
    mc admin user svcacct list "$MINIO_ALIAS" "$user"
    echo
done <<< "$users"
