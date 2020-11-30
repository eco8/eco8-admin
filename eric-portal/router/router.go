package router

import (
	routerMiddleware "eric-portal/router/middleware"
	"eric-portal/router/routes"
	"eric-portal/service/config"
	log "eric-portal/utils/logs"
	"fmt"
	"github.com/gin-gonic/gin"
	"io"
	"net/http"
	"os"
)

var router *gin.Engine

func setRouter() {
	apiV1 := router.Group("/api").Group("/v1")
	routes.Portal(apiV1) // portal 路由
	routes.User(apiV1)
	routes.Resources(apiV1)
}

func init() {
	log.Info("Gin Router Init!")
}

func indexPage(c *gin.Context) {
	//c.String(http.StatusOK, "Index Page!")
	c.Redirect(http.StatusMovedPermanently, "/portal")
}

func InitServer() {
	// 日志输出
	writeGinLog()

	router = gin.Default()

	// 处理multipart forms提交文件时默认的内存限制是32 MiB
	router.MaxMultipartMemory = 64

	// 注册session中间件
	//routesMid.CookieSession(router)
	routerMiddleware.RedisSession(router)

	// 静态文件访问目录
	router.Static("/portal", "static")

	// 测试首页
	router.GET("/", indexPage)

	router.GET("/favicon.ico", favicon)

	// 后面注册进来的路由都会经过 Authorize 权限校验
	router.Use(routerMiddleware.FormatRequest())
	router.Use(routerMiddleware.Authorize())

	// 路由注册
	setRouter()

	// 启动服务
	address := fmt.Sprintf("%s:%d", config.CFG.Server.Host, config.CFG.Server.Port)
	if err := router.Run(address); err != nil {
		log.Err(err.Error())
	} else {
		log.Info(fmt.Sprintf("Server started at %s", address))
	}
}

func favicon(c *gin.Context) {
	//c.Redirect(http.StatusMovedPermanently, "/portal/assets/ico/favicon.ico")
	c.File("favicon.ico")
}

func writeGinLog() {
	f, _ := os.Create("logs/gin-gonic.out.log")
	// 日志同时写入文件和控制台
	//gin.DefaultWriter = io.MultiWriter(f, os.Stdout)
	// 只输出日志到文件
	gin.DefaultWriter = io.Writer(f)
}
