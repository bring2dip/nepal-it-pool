FROM golang:1.10

ARG app_env
ENV APP_ENV production

COPY ./app /go/src/github.com/user/sites/app
WORKDIR /go/src/github.com/user/sites/app

RUN go get ./
RUN go build

RUN chmod +x /go/src/github.com/user/sites/app/entrypoint.sh

ENTRYPOINT ["/go/src/github.com/user/sites/app/entrypoint.sh"]

CMD if [ ${APP_ENV} = production ]; \
	then \
	app; \
	else \
	go get github.com/pilu/fresh && \
	fresh; \
	fi

EXPOSE 8080
