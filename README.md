# Percona Mongodb with Rocksdb storage - MongoRocks on Docker

## How To Use
```
docker run -d -p 27017:27017 -e DB_USER=test DB_PASS=test DATABASE=mongorocks jadsonlourenco/mongo-rocks
```

## Environment Variables

#### AUTH - (default: yes)
To disable authentication, set to **no**.

#### ADMIN_USER - (default: admin)
You need have a user with **root** permissions, manager of the **admin** database ever present.

#### ADMIN_PASS - (default: admin)
The password of the **ADMIN_USER** above.

#### DATABASE
Create a new database with this name, the **DB_USER** and **DB_PASS** will be the owner of this database.

#### DB_USER - (default: user)
The user that manage the **DATABASE** above - don't have admin permissions.

#### DB_PASS - (default: password)
The password of the **DB_USER** above.

#### DBPATH - (default: /data/db)
The path that store all data, this setting is useful for *Docker volumes*

#### OPLOG_SIZE
Define the size of [Oplog](https://docs.mongodb.org/manual/tutorial/change-oplog-size/), in megabytes, for example, set **50** to be *50MB*.

## License
None! Use as you want and like.

---

By Jadson Lourenço - [@jadsonlourenco](https://twitter.com/jadsonlourenco)  
*"Quem tem verdadeiros ideais não sonha."*
