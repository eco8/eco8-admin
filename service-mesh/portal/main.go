package main

import (
	"fmt"
	"portal/router"
)

func main() {
	fmt.Println("portal server is starting...")
	router.Run("0.0.0.0", 10000)
	select {}
}
