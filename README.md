# Percona Mongodb with Rocksdb storage - MongoRocks on Docker

## How To Use
```
docker run -d -p 27017:27017 -e USER=test PASS=test jadsonlourenco/mongo-rocks
```

## Environment Variables

#### AUTH - (default: yes)
To disable authentication, set to **no**.

#### USER - (default: admin)
Define the user that has **root** permissions on Mongodb server.

#### PASS - (default: admin)
Your password to authenticate with Mongodb server, has **root** permissions.

#### DATABASE
Create a new database with this name, the **USER** and **PASS** will be the same for this database.

#### OPLOG_SIZE
Define the size of [Oplog](https://docs.mongodb.org/manual/tutorial/change-oplog-size/), in megabytes, for example, set **50** to be *50MB*.

## Data Volume
By default all data is stored on host volume: '/data/db'

## License
None! Use as you want and like.

---

By Jadson Lourenço - [@jadsonlourenco](https://twitter.com/jadsonlourenco)  
*"Quem tem verdadeiros ideais não sonha."*
