package main

import (
	"fmt"
	"net/http"
)

func healthz(w http.ResponseWriter, req *http.Request) {
	fmt.Fprintf(w, "OK")
}

func headers(w http.ResponseWriter, req *http.Request) {
	for name, headers := range req.Header {
		for _, h := range headers {
			fmt.Fprintf(w, "%v: %v\n", name, h)
		}
	}
}

func homepage(w http.ResponseWriter, req *http.Request) {
	fmt.Fprintf(w, `
		<html>
			<head><title>Go Server</title></head>
			<body>
				<center>
				<h1>Welcome to the Go Server</h1>
				<p><a href="/healthz">Health Check</a></p>
				<p><a href="/headers">View Headers</a></p>
				</center>
			</body>
		</html>
	`)
}

func main() {
	http.HandleFunc("/", homepage)
	http.HandleFunc("/healthz", healthz)
	http.HandleFunc("/headers", headers)
	fmt.Println("Starting server...")
	http.ListenAndServe(":8090", nil)
}
