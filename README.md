# Percona Mongodb with Rocksdb storage - MongoRocks on Docker

## How To Use
```
docker run -d -p 27017:27017 -e PASS=change jadsonlourenco/mongo-rocks
```

## Environment Variables

#### USER - (default: admin)
Define the user that has **root** permissions on Mongodb server.

#### PASS - (default: mongorocks)
Your password to authenticate with Mongodb server, has **root** permissions.

#### AUTH - (default: yes)
To disable authentication, set to **no**.

## Data Volume
By default all data is stored on host volume: '/data/db'

## License
None! Use as you want and like.

---

By Jadson Lourenço - [@jadsonlourenco](https://twitter.com/jadsonlourenco)  
*"Quem tem verdadeiros ideais não sonha."*
