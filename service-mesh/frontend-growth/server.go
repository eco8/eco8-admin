package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
)

func main() {
	fmt.Println("frontend growth starting at port 10009!")
	fmt.Println(gin.H{"a": "a"})

	var server = gin.Default()

	server.Static("/static", "static")

	_ = server.Run(":10009")
}
