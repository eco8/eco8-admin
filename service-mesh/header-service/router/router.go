package router

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"header-service/router/routes"
	"log"
	"net/http"
	"os"
)

var r *gin.Engine

func init() {
	fmt.Println("gin router is preparing...")

	/**
	初始化服务
	*/
	initServer()

	/**
	注册服务
	*/
	registerRoutes()
}

func registerRoutes() {
	fmt.Println("registerRoutes")

	staticDir := "../frontend/header-service"
	if os.Getenv("env") == "prod" {
		staticDir = "./frontend/header-service"
	}

	fmt.Println("env: ", os.Getenv("env"))
	/**
	注册静态资源目录
	*/
	r.StaticFS("/eco8-header", http.Dir(staticDir))

	// /common/v1 API
	routes.CommonApi(r.Group("/eco8-header-service"))
	// /portal/v1 API
	routes.PortalApi(r.Group("/portal"))
}

func initServer() {
	fmt.Println("initServer")
	/**
	实例化gin
	*/
	r = gin.Default()

	/**
	测试gin路由
	*/
	r.GET("/eco8-admin", func(c *gin.Context) {
		c.String(http.StatusOK, "Index Page!")
	})
}

func Run(host string, port uint16) {
	/**
	启动服务
	*/
	if err := r.Run(fmt.Sprintf("%s:%d", host, port)); err != nil {
		log.Fatalln(err.Error())
	} else {
		log.Printf(fmt.Sprintf("Server started at %s:%d", host, port))
	}
}
