package main

import (
	"copyright/router"
	"fmt"
)

func main() {
	fmt.Println("copyright-service server is starting...")
	router.Run("0.0.0.0", 10006)
	select {}
}
