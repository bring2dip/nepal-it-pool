#!/bin/bash
echo $1

if [ $1 = "development" ]; then
    docker exec -i nepal-it-pool go run migrations/developer.go
fi



if [ ${APP_ENV} = production ]; \
	then \
	go run migration/developer.go\
	app; \
	else \
	go get github.com/pilu/fresh && \
	fresh; \
	fi
