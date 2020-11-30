package main

import (
	_ "eric-portal/mysql"
	"eric-portal/router"
	"eric-portal/service/config"
	"fmt"
)

func main() {
	fmt.Println("Eric-Portal App is ready to run ... ")

	fmt.Printf("%+v", config.CFG)

	router.InitServer()
}
