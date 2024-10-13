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

func main() {
	http.HandleFunc("/healthz", healthz)
	http.HandleFunc("/headers", headers)
	fmt.Println("Starting server...")
	http.ListenAndServe(":8090", nil)
}
