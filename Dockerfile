FROM golang:1.17-buster AS build

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN go build -o /lesson-087

FROM gcr.io/distroless/base-debian10

WORKDIR /

COPY --from=build /lesson-087 /lesson-087

USER nonroot:nonroot

ENTRYPOINT ["/lesson-087"]
