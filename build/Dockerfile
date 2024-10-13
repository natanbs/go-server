FROM golang:1.23rc2-alpine3.19

WORKDIR /app

# Connect to Github repository
LABEL org.opencontainers.image.source https://github.com/natanbs/go-server

# Download Go modules
COPY go.mod server ./
RUN go mod download

# Copy the source code. Note the slash at the end, as explained in
# https://docs.docker.com/reference/dockerfile/#copy
COPY *.go ./

# Build
RUN CGO_ENABLED=0 GOOS=linux go build -o /go-server

# Optional:
# To bind to a TCP port, runtime parameters must be supplied to the docker command.
# But we can document in the Dockerfile what ports
# the application is going to listen on by default.
# https://docs.docker.com/reference/dockerfile/#expose
EXPOSE 8090

# Run
CMD ["/go-server"]
