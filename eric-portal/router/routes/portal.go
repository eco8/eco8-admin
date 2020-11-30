package routes

import (
	"eric-portal/controller"
	"github.com/gin-gonic/gin"
)

func Portal(router *gin.RouterGroup) {
	portal := controller.Portal{}       // controller 管理者、控制器、公司财务总管
	cluster := router.Group("portal") // relative 相对的， relativePath 相对路径
	{
		cluster.GET("eco8-logo", portal.Logo())
	}
}
