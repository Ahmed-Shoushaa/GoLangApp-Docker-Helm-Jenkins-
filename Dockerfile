FROM golang:alpine

WORKDIR /usr/src/app

# ENV MYSQL_USER=root
# ENV MYSQL_PASS=password
# # ENV MYSQL_HOST=172.17.0.3  db container ip
# ENV MYSQL_PORT=3306


# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
COPY go.mod go.sum ./
RUN go mod download && go mod verify

COPY . .
RUN go build -v -o /usr/local/bin/app ./...
EXPOSE 9090
CMD ["app"]