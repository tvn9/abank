postgres:
	docker run --name abank -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres

createdb:
	docker exec -it abank createdb --username=root --owner=root abankdb

dropdb:
	docker exec -it abank dropdb abankdb

migrateup:
	migrate -path db/migration -database "postgresql://root:secret@127.0.0.1:5432/abankdb?sslmode=disable" -verbose up 

migratedown:
	migrate -path db/migration -database "postgresql://root:secret@127.0.0.1:5432/abankdb?sslmode=disable" -verbose down

.PHONY: postgres createdb dropdb migrateup migratedown 