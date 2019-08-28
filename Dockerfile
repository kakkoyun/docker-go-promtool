FROM golang:1.12

ARG PROMTOOL_VERSION
WORKDIR /tmp/build
RUN go mod init .
RUN GOFLAGS="-mod=vendor -mod=readonly" go get -d -v github.com/prometheus/prometheus/cmd/promtool@v${PROMTOOL_VERSION}
RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o /bin/promtool github.com/prometheus/prometheus/cmd/promtool

FROM golang:1.12
COPY --from=0 /bin/promtool /bin
ENTRYPOINT ["/bin/promtool"]
