package main

import (
	"net/http"
	"fmt"
)

type hotdog int

func (m hotdog) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "This is amazing! Served from inside a docker container :)")
}

func main() {

	var d hotdog
	http.ListenAndServe(":8080", d)
}
