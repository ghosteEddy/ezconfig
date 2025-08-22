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
** user --json to format output as json

### Add user
```mc admin user add {alias} {username} {password}```

### List group
```mc admin group ls {alias}```

### Create user group
Must be create and add user only, cannot create empty group  

```mc admin group add {alias} {group} {user1} {user2} ...```

### Create user service account
- Just create another access key
- The service account cannot be use to access minio console
```mc admin user svcacct add {alias} {user}```
#### specify the credential with
```--access-key={accesskey}```
```--secret-key={secreykey}```
** without specifying the key minio will generate it randomly
#### example
```mc admin user svcacct add local user-app --access-key=user-app-node-1```
this will create service account with access key "user-app-node-1" with random secret key

### List user service account
list service account of the user
```mc admin user svcacct ls {alias} {user}```

## Policy

### Add policy to group
```mc admin policy attach {alias} {policy_name} group={group}```

## Bucket

### Create Bucket
```mc mb {alias}/{bucket}```