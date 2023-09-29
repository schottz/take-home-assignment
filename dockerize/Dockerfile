FROM golang:latest

WORKDIR /opt/app/

COPY . .

RUN echo "root@tcp(database.default.svc.cluster.local:3306)/go" > server.confi

RUN go mod init dockerize && \
    go get github.com/go-sql-driver/mysql && \ 
    go build

CMD go run webserver.go