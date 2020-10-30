package main

import (
	"fmt"
	"main/router"
)

func main() {
	fmt.Println("server is starting...")
	router.Run("0.0.0.0", 10002)
	select {}
}
