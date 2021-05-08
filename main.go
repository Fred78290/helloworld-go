package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
	"os"
)

var podName = "standalone"
var listenAddress = ":8080"

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello World from pod %s!", podName)
}

func main() {
	flag.StringVar(&listenAddress, "listen", ":8080", "Listen address")
	flag.Parse()

	if str, set := os.LookupEnv("POD_NAME"); set {
		podName = str
	}

	http.HandleFunc("/", handler)

	log.Fatal(http.ListenAndServe(listenAddress, nil))
}
