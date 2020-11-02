package router

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
	"portal/router/routes"
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

	/**
	注册静态资源目录
	*/
	r.StaticFS("/portal", http.Dir("../frontend/portal"))

	// /portal/v1 API 内部服务接口放到 service 中
	routes.PortalApi(r.Group("/portal-service"))
	// /common/v1 API
	//routes.CommonApi(r.Group("/common"))
	// 需要开放的接口放到 api 中
	routes.CommonApi(r.Group("/portal-api"))
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
