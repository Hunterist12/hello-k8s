package main

import (
	"net/http"
	"strings"
)

func HandleRequest(rw http.ResponseWriter, req *http.Request) {
	
	//get name from URL, use "World" as default
	name := req.URL.Path
	name = strings.TrimPrefix(name, "/")
	if name == "" {
		name = "World"
	}

	//format, return message
	message := "Hello, " + name + "!"
	rw.Write([]byte(message))
}

func main() {
	http.HandleFunc("/", HandleRequest)
	if err := http.ListenAndServe(":8080", nil); err != nil {
		panic(err)
	}
}
