### Project Postgres Commands

Start Postgres Container
```postgres
% docker container run --name my_postgres -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:alpine 
```
Connect to Postgres Database 

```postgres
% docker exec -it my_postgres pslq -U root
```

List all databases 
```postgres
% \l 
```

List all database tables
```
% \dt
```
Access Postgres database container shell
```
% docker exec -it container-name /bin/sh
```

From the container sh, create a new database
```
# createdb --username=root --owner=root db-name 
``` 

Login to the new Database 
```
# psql db-name 
``` 

Access the container database console without going through the container shell
```
% docker exec -it container-name psql -U root db-name
```

### Database Migration Commands

To generate migration up and down files, run (two files will be created: 000001_init_schema.up.sql, and 000001_init_schema.down.sql)
``` 
% migrate create -ext sql -dir db/migration seq init_schema 
``` 

Run container database migration up
```
% migrate -path db/migration -database "postgresql://root:secret@localhost:5433/abankdb?sslmode=disable" -verbose up
``` 

Run container database migration down 
```
% migrate -path db/migration -database "postgresql://root:secret@localhost:5433/abankdb?sslmode=disable" -verbose down
``` 

### Postgres DB Management Commands

To create a new database, first, go to the database shell 

```
% docker exec -it container-name /bin/sh 
# createdb --username=root --owner=root new-db-name
```

Access the database console, make sure to go into the container shell first 
```
# psql new-db-name 
``` 

To delete the database
```
new-db-name=# \q                 // get out of the database prompt
/ # dropdb db-name
``` 

To create a new database from the MacOS terminal
```
% docker exec -it container-name createdb --username=root --owner=root new-db-name 
``` 

### Useful Unix Commands 

To see the history of the executed docker commands
```
% history | grep "docker run" 
``` 

