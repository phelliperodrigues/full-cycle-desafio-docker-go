FROM golang:1.17-alpine as build

WORKDIR /usr/src/app
COPY . .
RUN go mod init exemple/go
RUN go build 

FROM scratch as execute
WORKDIR /usr/src/app
COPY --from=build /usr/src/app/go .
CMD ["./go"]
