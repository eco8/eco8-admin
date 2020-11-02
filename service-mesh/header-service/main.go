package main

import (
	"fmt"
	"header-service/router"
)

func main() {
	fmt.Println("header-service server is starting...")
	router.Run("0.0.0.0", 10001)
	select {}
}
