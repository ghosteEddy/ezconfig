# Minio Client

## Set up

### Set alias for MC
```mc alias set {alias} http://host:port {user} {password}```
Example
```mc alias set local http://host:port minioadmin minioadmin```


## User

### List all user
```mc admin user ls {minio_alias}```
Example
```mc admin user ls local```

### Add user
```mc admin user add {alias} {username} {password}```

### List group
```mc admin group ls {alias}```

### Create user group
Must be create and add user only, cannot create empty group
```mc admin group add {alias} {group} {user1} {user2} ...```

## Policy

### Add policy to group
```mc admin policy attach {alias} {policy_name} group={group}```

## Bucket

### Create Bucket
```mc mb {alias}/{bucket}```