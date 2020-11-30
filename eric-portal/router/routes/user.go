package routes

import (
	"eric-portal/controller"
	"github.com/gin-gonic/gin"
)

func User(router *gin.RouterGroup) {
	user := controller.User{} // controller 管理者、控制器、公司财务总管
	cluster := router.Group("user") // relative 相对的， relativePath 相对路径
	{
		cluster.GET("test", user.Login())
	}
}
