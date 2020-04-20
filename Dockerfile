# Build image
FROM golang:1.11-alpine3.9 AS BUILD-ENV

WORKDIR /

COPY . ./

RUN go build -o /messageapp

# Deploy image
FROM alpine:3.9

COPY --from=BUILD-ENV /messageapp /messageapp

COPY --from=BUILD-ENV /index.html /index.html

LABEL maintainer="akash.gautam@velotio.com"

EXPOSE 8080

ENTRYPOINT /messageapp